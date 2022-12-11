import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ConvertModal extends StatefulWidget {
  const ConvertModal({
    super.key,
    required this.amount,
    required this.symbols,
  });
  final String amount;
  final String symbols;

  @override
  State<ConvertModal> createState() => _ConvertModalState();
}

class _ConvertModalState extends State<ConvertModal> {
  double? newAmount = 0;

  @override
  Widget build(BuildContext context) {
    TextEditingController _amountController = TextEditingController();
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

    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      height: 300,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: const Color(
                      0xFF1F2D2D,
                    ),
                  )),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                ),
                child: TextField(
                  controller: _amountController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter amount',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            const Gap(30),
            InkWell(
              onTap: () {
                setState(() {
                  newAmount = double.parse(_amountController.text) *
                      double.parse(widget.amount);
                });
              },
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    'Convert',
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.symbols,
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '${currency(context)}${formatter.format(newAmount)}',
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
