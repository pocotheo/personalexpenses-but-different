class Transaction {
  final String id;
  final String title;
  final double amount;
  final String icon;
  final DateTime date;

  Transaction(
      {required this.id,
      required this.title,
      required this.amount,
      required this.icon,
      required this.date});
}
