import 'package:cardvalidation/utils/card_validate.dart';
import 'package:flutter/material.dart';

abstract class HomeViewModel extends State {
  final CardValidate cardValidate = CardValidate();
  TextEditingController cardNumberController = TextEditingController();
  String result = '';

  void validateCard() {
    String cardNumber = cardNumberController.text;

    if (cardValidate.validateCard(cardNumber)) {
      setState(() {
        result = 'Valid';
      });
    } else {
      setState(() {
        result = 'Invalid';
      });
    }
  }
}
