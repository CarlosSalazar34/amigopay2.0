import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:amigopay/components/form_movements.dart';

class SheetButton extends StatelessWidget {
  final Function(Map<String, dynamic>) onAdd;

  const SheetButton({super.key, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showMySheet(context),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFF1A237E).withOpacity(0.1)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1A237E).withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF1A237E).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add_rounded, color: Color(0xFF1A237E), size: 28),
            ),
            const SizedBox(width: 16),
            Text(
              'Añadir nuevo registro',
              style: GoogleFonts.outfit(
                color: const Color(0xFF1A237E),
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showMySheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            FormMovement(onSave: onAdd),
          ],
        ),
      ),
    );
  }
}
