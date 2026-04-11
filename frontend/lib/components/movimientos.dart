import 'package:flutter/material.dart';

class MovimientosList extends StatelessWidget {
  final List<Map<String, dynamic>> movimientos = [
    {'titulo': 'Pago de nómina', 'monto': 1500.0, 'tipo': 'ingreso'},
    {'titulo': 'Suscripción Netflix', 'monto': -12.0, 'tipo': 'gasto'},
    {'titulo': 'Compra Supermercado', 'monto': -85.50, 'tipo': 'gasto'},
    {'titulo': 'Venta Laptop', 'monto': 400.0, 'tipo': 'ingreso'},
    {'titulo': 'Factura Luz', 'monto': -45.0, 'tipo': 'gasto'},
    {'titulo': 'Gimnasio', 'monto': -30.0, 'tipo': 'gasto'},
  ];

  MovimientosList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, // IMPORTANTE: Ajusta el ListView al contenido
      physics:
          const NeverScrollableScrollPhysics(), // IMPORTANTE: El scroll lo hace el homepage
      padding: EdgeInsets.zero, // Quita paddings internos extra
      itemCount: movimientos.length,
      itemBuilder: (context, index) {
        final item = movimientos[index];
        final esIngreso = item['tipo'] == 'ingreso';

        return Card(
          elevation: 0, // Un toque más moderno (plano)
          color: Colors.grey[100], // Fondo sutil
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            leading: CircleAvatar(
              backgroundColor: esIngreso ? Colors.green[50] : Colors.red[50],
              child: Icon(
                esIngreso ? Icons.add : Icons.remove,
                color: esIngreso ? Colors.green : Colors.red,
              ),
            ),
            title: Text(
              item['titulo'],
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: const Text('Hoy'),
            trailing: Text(
              '${esIngreso ? "+" : ""}${item['monto']}\$',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: esIngreso ? Colors.green : Colors.red,
              ),
            ),
          ),
        );
      },
    );
  }
}
