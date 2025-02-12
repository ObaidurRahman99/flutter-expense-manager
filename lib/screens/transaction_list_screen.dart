import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/transaction_provider.dart';
import '../widgets/transaction_item.dart';

class TransactionListScreen extends StatefulWidget {
  const TransactionListScreen({super.key});

  @override
  _TransactionListScreenState createState() => _TransactionListScreenState();
}

class _TransactionListScreenState extends State<TransactionListScreen> {
  String _selectedFilter = "All";

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TransactionProvider>(context);

    final filteredTransactions = provider.transactions.where((tx) {
      if (_selectedFilter == "All") return true;
      if (_selectedFilter == "Income") return tx.isIncome;
      if (_selectedFilter == "Expense") return !tx.isIncome;
      return true;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Transactions", style: TextStyle(color: Colors.white, fontSize: 18)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [

            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _filterButton("All", Icons.list),
                  _filterButton("Income", Icons.arrow_upward, Colors.green),
                  _filterButton("Expense", Icons.arrow_downward, Colors.red),
                ],
              ),
            ),
            const SizedBox(height: 10),


            Expanded(
              child: filteredTransactions.isNotEmpty
                  ? ListView.builder(
                itemCount: filteredTransactions.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      provider.deleteTransaction(provider.transactions.indexOf(filteredTransactions[index]));
                    },
                    child: TransactionItem(transaction: filteredTransactions[index]),
                  );
                },
              )
                  : const Center(
                child: Text(
                  "No transactions found.",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _filterButton(String type, IconData icon, [Color? color]) {
    bool isSelected = _selectedFilter == type;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedFilter = type;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? (color ?? Theme.of(context).colorScheme.primary) : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade400),
          ),
          child: Column(
            children: [
              Icon(icon, color: isSelected ? Colors.white : Colors.grey, size: 20),
              const SizedBox(height: 4),
              Text(
                type,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
