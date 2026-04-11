import 'package:flutter/material.dart';
import 'package:frontend/components/amount_card.dart';
import 'package:frontend/components/movimientos.dart';
import 'package:frontend/components/sheet_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // La lista ahora es parte del estado
  final List<Map<String, dynamic>> movimientos = [
    {'titulo': 'Pago de nómina', 'monto': 1500.0, 'tipo': 'ingreso'},
    {'titulo': 'Suscripción Netflix', 'monto': -12.0, 'tipo': 'gasto'},
    // ... tus otros datos
  ];

  // Función para agregar un movimiento y actualizar la pantalla
  void _agregarMovimiento(Map<String, dynamic> nuevo) {
    setState(() {
      movimientos.add(nuevo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Carlos Salazar',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const AmountCard(amount: 12220.03),
              const SizedBox(height: 20),

              // Pasamos la función de agregar al botón
              SheetButton(onAdd: _agregarMovimiento),

              const SizedBox(height: 30),
              const Text(
                'Movimientos recientes',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              MovimientosList(movimientos: movimientos),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
