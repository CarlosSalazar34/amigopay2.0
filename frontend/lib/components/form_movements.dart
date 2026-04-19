import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormMovement extends StatefulWidget {
  final Function(Map<String, dynamic>) onSave;

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
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            "Detalles del Movimiento",
            style: GoogleFonts.outfit(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A237E),
            ),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: _nombreController,
            decoration: InputDecoration(
              labelText: "Concepto",
              hintText: "Ej. Pago de Alquiler",
              prefixIcon: const Icon(Icons.description_outlined),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _montoController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: "Monto",
              hintText: "0.00",
              prefixIcon: const Icon(Icons.attach_money_rounded),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
            ),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            value: tipoPago,
            decoration: InputDecoration(
              labelText: "Tipo de Movimiento",
              prefixIcon: const Icon(Icons.swap_vert_rounded),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
            ),
            items: const [
              DropdownMenuItem(value: "ingreso", child: Text("Ingreso (+)")),
              DropdownMenuItem(value: "gasto", child: Text("Gasto (-)")),
            ],
            onChanged: (value) => setState(() => tipoPago = value!),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                String nombre = _nombreController.text;
                double? monto = double.tryParse(_montoController.text) ?? 0.0;

                if (nombre.isNotEmpty && monto > 0) {
                  Map<String, dynamic> nuevoMov = {
                    "titulo": nombre,
                    "monto": monto,
                    "tipo": tipoPago,
                  };
                  widget.onSave(nuevoMov);
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A237E),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 0,
              ),
              child: Text(
                "Guardar Movimiento",
                style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
