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
  String tipoPago = "ingreso";
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
          const SizedBox(height: 20),
          DropdownButtonFormField<String>(
            value: tipoPago,
            // Estilo del input (el borde y fondo)
            decoration: InputDecoration(
              labelText: "Tipo de movimiento",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Colors.grey[100],
              prefixIcon: const Icon(Icons.swap_vert),
            ),
            // Estilo del menú desplegable
            dropdownColor: Colors.white,
            borderRadius: BorderRadius.circular(12),
            icon: const Icon(
              Icons.arrow_drop_down_circle_outlined,
              color: Colors.blue,
            ),
            // Estilo del texto seleccionado
            style: const TextStyle(color: Colors.black, fontSize: 16),
            items: const [
              DropdownMenuItem(value: "ingreso", child: Text("Ingreso")),
              DropdownMenuItem(value: "gasto", child: Text("Gasto")),
            ],
            onChanged: (value) => setState(() => tipoPago = value!),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              // 1. Capturamos y validamos
              String nombre = _nombreController.text;
              double? monto = double.tryParse(_montoController.text) ?? 0.0;

              // 2. Creamos el mapa con el formato que espera tu lista
              Map<String, dynamic> nuevoMov = {
                "titulo": nombre,
                "monto": monto,
                "tipo": tipoPago,
              };

              // 3. Ejecutamos el callback que viene de HomePage
              widget.onSave(nuevoMov);

              // 4. Cerramos el modal
              Navigator.pop(context);
            },
            child: const Text("Guardar"),
          ),
        ],
      ),
    );
  }
}
