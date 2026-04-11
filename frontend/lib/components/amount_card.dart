import 'package:flutter/material.dart';

class AmountCard extends StatefulWidget {
  final double amount;
  const AmountCard({super.key, required this.amount});

  @override
  State<AmountCard> createState() => _AmountCardState();
}

class _AmountCardState extends State<AmountCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(255, 35, 153, 250),
            const Color.fromARGB(255, 62, 82, 117),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Balance actual".toUpperCase(),
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w400,
                  fontSize: 19,
                ),
              ),
              Spacer(),
              Icon(Icons.wallet, color: Colors.white),
            ],
          ),
          Container(height: 20),
          Text(
            "\$${widget.amount.toStringAsFixed(2)}",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 55,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
