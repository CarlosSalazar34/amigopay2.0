import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovimientosList extends StatelessWidget {
  final List<Map<String, dynamic>> movimientos;

  const MovimientosList({super.key, required this.movimientos});

  @override
  Widget build(BuildContext context) {
    if (movimientos.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            children: [
              Icon(Icons.history_rounded, size: 64, color: Colors.grey[300]),
              const SizedBox(height: 16),
              const Text(
                'Aún no hay movimientos',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: movimientos.length,
      itemBuilder: (context, index) {
        final item = movimientos[index];
        final esIngreso = item['tipo'] == 'ingreso';

        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: esIngreso ? const Color(0xFFE8F5E9) : const Color(0xFFFFEBEE),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                esIngreso ? Icons.arrow_downward_rounded : Icons.arrow_upward_rounded,
                color: esIngreso ? const Color(0xFF2E7D32) : const Color(0xFFC62828),
                size: 26,
              ),
            ),
            title: Text(
              item['titulo'],
              style: GoogleFonts.outfit(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: const Color(0xFF2C3E50),
              ),
            ),
            subtitle: Text(
              'Transacción exitosa',
              style: GoogleFonts.outfit(
                color: Colors.grey[500],
                fontSize: 13,
              ),
            ),
            trailing: Text(
              '${esIngreso ? "+" : "-"}\$${item['monto'].toStringAsFixed(2)}',
              style: GoogleFonts.outfit(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: esIngreso ? const Color(0xFF2E7D32) : const Color(0xFFC62828),
              ),
            ),
          ),
        );
      },
    );
  }
}
