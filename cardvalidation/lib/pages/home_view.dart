import 'package:cardvalidation/pages/home_view_model.dart';
import 'package:flutter/material.dart';

class HomeView extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('Card Validation',
            style: TextStyle(
                fontSize: 20,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Column(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Text(
                'Verifique se o Cartão é Válido',
                style: TextStyle(
                    fontSize: MediaQuery.sizeOf(context).height * 0.03,
                    color: Colors.white),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * 0.06,
                ),
                child: FocusScope(
                  child: Focus(
                    autofocus: true,
                    child: TextFormField(
                      controller: cardNumberController,
                      validator: (value) =>
                          value!.isEmpty ? 'Enter a valid card number' : null,
                      decoration: InputDecoration(
                        hintText: 'Número do Cartão',
                        hintStyle: TextStyle(color: Colors.white54),
                        filled: true,
                        fillColor: Colors.white24,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.3,
              height: MediaQuery.sizeOf(context).height * 0.04,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor: Colors.white),
                onPressed: () {
                  validateCard();
                },
                child: Text(
                  'Validate',
                ),
              ),
            ),
            Text(
              'Seu Cartão é  $result',
              style: TextStyle(
                  fontSize: MediaQuery.sizeOf(context).height * 0.04,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
