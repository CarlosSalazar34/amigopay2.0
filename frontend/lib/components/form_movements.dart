import 'package:flutter/material.dart';

class FormMovement extends StatefulWidget {
  final Function(Map<String, dynamic>) onSave; // Callback para devolver el dato

  const FormMovement({super.key, required this.onSave});

  @override
  State<FormMovement> createState() => _FormMovementState();
}

class _FormMovementState extends State<FormMovement> {
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
        children: [
          const Text(
            "Nuevo Movimiento",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: _nombreController,
            decoration: const InputDecoration(labelText: "Concepto"),
          ),
          TextField(
            controller: _montoController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Monto"),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              // Creamos el nuevo objeto
              final nuevoMovimiento = {
                "nombre": _nombreController.text,
                "monto": double.tryParse(_montoController.text) ?? 0.0,
              };
              // Lo enviamos de vuelta al padre
              widget.onSave(nuevoMovimiento);
              Navigator.pop(context);
            },
            child: const Text("Guardar"),
          ),
        ],
      ),
    );
  }
}
