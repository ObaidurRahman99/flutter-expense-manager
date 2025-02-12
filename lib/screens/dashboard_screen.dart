import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/transaction_provider.dart';
import '../widgets/transaction_item.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<TransactionProvider>(context);
    double totalIncome = provider.totalIncome;
    double totalExpense = provider.totalExpense;
    double totalBalance = totalIncome - totalExpense;

    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard", style: TextStyle(color: Colors.white, fontSize: 18),),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.secondary,
                        Theme.of(context).colorScheme.tertiary,
                      ],
                  transform: const GradientRotation( pi / 4),
                  ),
                 boxShadow:[
                   BoxShadow(
                     blurRadius: 4,
                     color:Colors.grey.shade400,
                     offset: const Offset(5, 5)
                   )
                 ]
              ),
              child: Padding(
                padding: EdgeInsets.all(25),
                child: Column(
                  children: [
                    Text("Total Balance", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
                    Text("₹${totalBalance.toStringAsFixed(2)}", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),


                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.arrow_up,
                              size: 15,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5,),
                            Column(
                              children: [
                                Text("Income", style: TextStyle(color: Colors.green, fontSize: 15)),
                                Text("₹${totalIncome.toStringAsFixed(2)}", style: TextStyle(fontSize:15, color: Colors.white ), )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.arrow_down,
                              size: 15,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5,),
                            Column(
                              children: [
                                Text("Expenses", style: TextStyle(color: Colors.red, fontSize: 15)),
                                Text("₹${totalExpense.toStringAsFixed(2)}", style: TextStyle(fontSize:15, color: Colors.white ), )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Transactions",style: TextStyle(fontSize: 17, color: Theme.of(context).colorScheme.onBackground, fontWeight: FontWeight.bold,),),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: provider.transactions.length,
                itemBuilder: (context, index) {
                  return TransactionItem(transaction: provider.transactions[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
