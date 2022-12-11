class Coins {
  num id;
  String symbol;
  String image;
  num currentPrice;
  num dayChange;
  num marketCap;
  Coins({
    required this.id,
    required this.symbol,
    required this.image,
    required this.currentPrice,
    required this.dayChange,
    required this.marketCap,
  });

  factory Coins.fromJson(Map<String, dynamic> item) {
    return Coins(
      id: item["market_cap_rank"],
      symbol: item["symbol"],
      image: item["image"],
      currentPrice: item["current_price"],
      dayChange: item["price_change_percentage_24h"],
      marketCap: item["market_cap"],
    );
  }
}
