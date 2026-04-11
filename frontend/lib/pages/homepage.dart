import 'package:flutter/material.dart';
import 'package:frontend/components/amount_card.dart';
import 'package:frontend/components/movimientos.dart';
import 'package:frontend/components/sheet_button.dart';

Widget homepage() {
  return SafeArea(
    // Evita que el contenido choque con la barra de estado
    child: SingleChildScrollView(
      physics:
          const BouncingScrollPhysics(), // Da un efecto de rebote agradable
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'BIENVENIDO OTRA VEZ,',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                letterSpacing: 1.2,
              ),
            ),
            const Text(
              'Carlos Salazar',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            AmountCard(amount: 12220.03),
            const SizedBox(height: 20),
            const SheetButton(),
            const SizedBox(height: 30),
            const Text(
              'Movimientos recientes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            MovimientosList(), // La lista ahora se adapta al tamaño de la columna
            const SizedBox(height: 20), // Espacio final para que no pegue abajo
          ],
        ),
      ),
    ),
  );
}
