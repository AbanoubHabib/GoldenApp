class ItemModel {
  final String name;
  final double price;
  final String symbol;
  final DateTime updatedAt;
  final String updatedAtReadable;

  ItemModel({
    required this.name,
    required this.price,
    required this.symbol,
    required this.updatedAt,
    required this.updatedAtReadable,
  });

  /// From JSON come from API
  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      symbol: json['symbol'] as String,
      updatedAt: DateTime.parse(json['updatedAt']),
      updatedAtReadable: json['updatedAtReadable'] as String,
    );
  }

  /// To JSON to send data to API or save it in local storage
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'symbol': symbol,
      'updatedAt': updatedAt.toIso8601String(),
      'updatedAtReadable': updatedAtReadable,
    };
  }
}
