import 'package:flutter/material.dart';
import 'package:glade_test/features/coins/presentation/notifier/coin_notifier.dart';
import 'package:glade_test/features/coins/presentation/pages/coins_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CryptoList(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CoinsPage(),
      ),
    );
  }
}
