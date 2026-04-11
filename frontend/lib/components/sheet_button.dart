import 'package:flutter/material.dart';
import 'package:frontend/components/form_movements.dart';

class SheetButton extends StatelessWidget {
  final Function(Map<String, dynamic>)
  onAdd; // Recibe la función desde la pantalla principal

  const SheetButton({super.key, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => _showMySheet(context),
      icon: const Icon(Icons.add_circle_outline),
      label: const Text('Agregar movimiento'),
    );
  }

  void _showMySheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Útil si el teclado tapa el input
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => SizedBox(
        height: 500,
        child: FormMovement(onSave: onAdd), // Pasamos la función
      ),
    );
  }
}
