import 'package:flutter/material.dart';

class FormMovement extends StatefulWidget {
  const FormMovement({super.key});

  @override
  State<FormMovement> createState() => _FormMovementState();
}

class _FormMovementState extends State<FormMovement> {
  // Controladores para capturar el texto
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _montoController = TextEditingController();

  @override
  void dispose() {
    _nombreController.dispose();
    _montoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text(
            "Nuevo Movimiento",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _nombreController,
            decoration: const InputDecoration(
              labelText: "Concepto (ej. Pago Internet)",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: _montoController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: "Monto (\$)",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                // Aquí iría la lógica para agregar a la lista
                print("Nombre: ${_nombreController.text}");
                Navigator.pop(context); // Cierra el modal
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              child: const Text(
                "Guardar",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
