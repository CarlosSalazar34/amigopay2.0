import 'package:flutter/material.dart';

class MovimientosList extends StatelessWidget {
  // 1. Declarar la variable que va a recibir los datos
  final List<Map<String, dynamic>> movimientos;

  // 2. Corregir el constructor
  const MovimientosList({super.key, required this.movimientos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: movimientos.length, // Se usa la variable declarada arriba
      itemBuilder: (context, index) {
        final item = movimientos[index];
        final esIngreso = item['tipo'] == 'ingreso';

        return Card(
          elevation: 0,
          color: Colors.grey[100],
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
