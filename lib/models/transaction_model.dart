
class Transaction {
  final double amount;
  final String category;
  final String description;
  final DateTime date;
  final bool isIncome;

  Transaction({
    required this.amount,
    required this.category,
    required this.description,
    required this.date,
    required this.isIncome,
  });
}
