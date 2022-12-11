import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:glade_test/features/coins/presentation/widgets/convert_modal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CoinCard extends StatelessWidget {
  const CoinCard({
    super.key,
    required this.coinImage,
    required this.coinName,
    required this.postionChange,
    required this.amount,
    required this.changedPosition,
  });
  final String coinImage;
  final String coinName;
  final String postionChange;
  final String amount;
  final bool changedPosition;
  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('###,000');
    String? currency(context) {
      var format =
          NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
      if (Platform.isAndroid) {
        return format.currencyName;
      } else {
        return format.currencySymbol;
      }
    }

    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    coinImage,
                    height: 20,
                    width: 20,
                  ),
                  const Gap(5),
                  Text(
                    coinName,
                    style: GoogleFonts.lato(
                        fontSize: 18, color: Colors.white.withOpacity(0.6)),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                          changedPosition
                              ? Icons.arrow_drop_down
                              : Icons.arrow_drop_up,
                          color: changedPosition ? Colors.red : Colors.green),
                      Text(
                        postionChange,
                        style: TextStyle(
                            color: changedPosition ? Colors.red : Colors.green,
                            fontSize: 12),
                      ),
                    ],
                  ),
                  const Gap(4),
                  Text(
                    '${currency(context)}${formatter.format(double.parse(amount))}',
                    style: GoogleFonts.lato(
                      fontSize: 15,
                      color: Colors.white.withOpacity(0.6),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                      context: context,
                      builder: (context) {
                        return ConvertModal(
                          amount: amount,
                          symbols: coinName,
                        );
                      });
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.currency_exchange,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
