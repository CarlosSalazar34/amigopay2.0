import 'package:flutter/material.dart';
import 'package:frontend/components/form_movements.dart';

class SheetButton extends StatelessWidget {
  final Function(Map<String, dynamic>)
  onAdd; // Recibe la función desde la pantalla principal

  const SheetButton({super.key, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Bordes redondeados
          side: const BorderSide(
            color: Colors.blue, // Color del borde
            width: 2, // Grosor del borde (10 era demasiado, 2 es más elegante)
          ),
        ),
        elevation: 4,
        minimumSize: const Size(
          double.infinity,
          50,
        ), // double.infinity lo hace tan ancho como el padre
        maximumSize: const Size(double.infinity, 50),
        backgroundColor: Colors.white,
      ),
      onPressed: () => _showMySheet(context),
      icon: const Icon(Icons.add_circle_outline, color: Colors.blue),
      label: const Text(
        'Agregar movimiento',
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
    );
  }

  void _showMySheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => SizedBox(
        height: 500,
        // PASA LA FUNCIÓN DIRECTAMENTE
        child: FormMovement(onSave: onAdd),
      ),
    );
  }
}
