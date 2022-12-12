import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:glade_test/features/coins/data/coin_model.dart';
import 'package:http/http.dart' as http;

class CryptoList extends ChangeNotifier {
  final listEndPoint =
      "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false";

  List<Coins> _coinList = [];
  bool _loading = false;
  List<Coins> get coinList => _coinList;

  bool get isLoading => _loading;

  Future<List<Coins>> getCoins() async {
    _coinList = [];
    _loading = true;
    final response = await http.get(
      Uri.parse(listEndPoint),
    );
    if (response.statusCode == 200) {
      List<dynamic> values = [];
      values = json.decode(response.body);
      if (values.isNotEmpty) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            _coinList.add(
              Coins.fromJson(map),
            );
          }
        }
      }
      _coinList = _coinList
          .where(
            (element) =>
                element.symbol == 'btc' ||
                element.symbol == 'eth' ||
                element.symbol == 'xrp' ||
                element.symbol == 'doge' ||
                element.symbol == 'ltc' ||
                element.symbol == 'dash',
          )
          .toList();
      _loading = false;
      notifyListeners();

      return coinList;
    } else {
      throw Exception("failed");
    }
  }
}
