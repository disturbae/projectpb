class Medicine {
  final String name;
  final int price;
  int qty;

  Medicine({
    required this.name,
    required this.price,
    this.qty = 1,
  });
}
