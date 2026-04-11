import 'package:flutter/material.dart';

class SheetButton extends StatelessWidget {
  const SheetButton({super.key});

  // Nota: Cambié a StatelessWidget porque el botón en sí no
  // parece necesitar manejar estado interno.

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => _showMySheet(context),
      icon: const Icon(Icons.add_circle_outline, size: 22),
      label: const Text('Agregar movimiento'),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.blueAccent,
        backgroundColor: Colors.white,
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Bordes más modernos
          side: const BorderSide(color: Colors.blueAccent, width: 1),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
        minimumSize: Size(900, 60),
      ),
    );
  }

  void _showMySheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const SizedBox(
        height: 500,
        child: Center(child: Text("Formulario de movimiento")),
      ),
    );
  }
}
