import 'package:flutter/material.dart';
import '../models/transaction_model.dart';

class TransactionProvider with ChangeNotifier {
  // List of transactions
  List<Transaction> _transactions = [];

  // Getter to fetch transactions
  List<Transaction> get transactions => _transactions;

  // Method to add a transaction
  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    notifyListeners(); // Notify listeners when a transaction is added
  }

  // Method to delete a transaction by index
  void deleteTransaction(int index) {
    _transactions.removeAt(index);
    notifyListeners(); // Notify listeners when a transaction is deleted
  }

  // Method to calculate total income
  double get totalIncome {
    double income = 0;
    for (var transaction in _transactions) {
      if (transaction.isIncome) {
        income += transaction.amount;
      }
    }
    return income;
  }

  // Method to calculate total expense
  double get totalExpense {
    double expense = 0;
    for (var transaction in _transactions) {
      if (!transaction.isIncome) {
        expense += transaction.amount;
      }
    }
    return expense;
  }

  // Method to calculate balance (total income - total expense)
  double get balance {
    return totalIncome - totalExpense;
  }
}
