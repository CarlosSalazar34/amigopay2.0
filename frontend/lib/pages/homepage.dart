import 'package:flutter/material.dart';
import 'package:frontend/components/amount_card.dart';

Widget homepage() {
  return Container(
    padding: const EdgeInsets.only(left: 10, right: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Container(height: 22),
        Text(
          'Bienvenido otra vez,'.toUpperCase(),
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
        Text(
          'Carlos Salazar',
          style: TextStyle(
            fontSize: 37,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        AmountCard(amount: 12220.03),
      ],
    ),
  );
}
