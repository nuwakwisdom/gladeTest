import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:glade_test/features/coins/presentation/notifier/coin_notifier.dart';
import 'package:glade_test/features/coins/presentation/widgets/coin_card_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CoinsPage extends StatefulWidget {
  const CoinsPage({super.key});

  @override
  State<CoinsPage> createState() => _CoinsPageState();
}

class _CoinsPageState extends State<CoinsPage> {
  @override
  void initState() {
    super.initState();

    Provider.of<CryptoList>(context, listen: false).getCoins();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CryptoList>(builder: (context, _, snapshot) {
      return Scaffold(
        backgroundColor: const Color(
          0xFF1F2D2D,
        ),
        appBar: AppBar(
          backgroundColor: const Color(
            0xFF1F2D2D,
          ),
          elevation: 0,
          title: Text(
            'Glade Test',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(30),
              Text(
                'My Coins',
                style: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const Gap(20),
              Expanded(
                  child: ListView.builder(
                      itemCount: _.coinList.length,
                      itemBuilder: (context, index) {
                        final data = _.coinList[index];
                        bool colorsChange = data.dayChange.toString()[0] == '-';

                        return CoinCard(
                          coinImage: data.image,
                          coinName: data.symbol,
                          postionChange: data.dayChange.toString(),
                          amount: '${data.currentPrice * 740}',
                          changedPosition: colorsChange,
                        );
                      }))
            ],
          ),
        ),
      );
    });
  }
}
