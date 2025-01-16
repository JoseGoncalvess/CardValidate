class CardValidate {
  bool validateCard(String cardNumber) {
    cardNumber = cardNumber.replaceAll(' ', '');

    if (!RegExp(r'^[0-9]+$').hasMatch(cardNumber)) {
      return false;
    }

    if (cardNumber.length < 13 || cardNumber.length > 19) {
      return false;
    }

    if (_isVisa(cardNumber) ||
        _isMasterCard(cardNumber) ||
        _isAmex(cardNumber) ||
        _isElo(cardNumber) ||
        _isHipercard(cardNumber) ||
        _isDinersClubCarteBlanche(cardNumber) ||
        _isDinersClubInternational(cardNumber) ||
        _isVisaElectron(cardNumber)) {
      return _luhnCheck(cardNumber);
    }

    return false;
  }

  bool _isVisa(String cardNumber) {
    return RegExp(r'^4(\d{12}|\d{15}|\d{18})$').hasMatch(cardNumber);
  }

  bool _isMasterCard(String cardNumber) {
    return RegExp(r'^(5[1-5]\d{14}|2(2[2-9]|[3-6]\d|7[01])\d{12}|2720\d{12})$')
        .hasMatch(cardNumber);
  }

  bool _isAmex(String cardNumber) {
    return RegExp(r'^3[47]\d{13}$').hasMatch(cardNumber);
  }

  bool _isVisaElectron(String cardNumber) {
    return RegExp(r'^(4026|417500|4508|4844|4913|4917)\d{10}$')
        .hasMatch(cardNumber);
  }

  bool _isElo(String cardNumber) {
    return RegExp(
            r'^(4011|4312|4389|4514|4576|5041|5066|5090|6277|6362|6363|6504|6505|6506|6507|6509|6516|6550)')
        .hasMatch(cardNumber);
  }

  bool _isHipercard(String cardNumber) {
    return RegExp(r'^(606282|3841)').hasMatch(cardNumber);
  }

  bool _isDinersClubCarteBlanche(String cardNumber) {
    return RegExp(r'^30[0-5]\d{11}$').hasMatch(cardNumber);
  }

  bool _isDinersClubInternational(String cardNumber) {
    return RegExp(r'^36\d{12}$').hasMatch(cardNumber);
  }

  bool _luhnCheck(String cardNumber) {
    int sum = 0;
    bool alternate = false;

    for (int i = cardNumber.length - 1; i >= 0; i--) {
      int n = int.parse(cardNumber[i]);

      if (alternate) {
        n *= 2;
        if (n > 9) {
          n -= 9;
        }
      }

      sum += n;
      alternate = !alternate;
    }

    return (sum % 10 == 0);
  }
}
