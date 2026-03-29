import 'package:flutter/material.dart';
// Asegúrate de que la ruta sea correcta según tu estructura de carpetas
import 'package:frontend/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AmigoPay',
      // Corrección del ColorScheme
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Índice para controlar la navegación
  int _index = 0;

  // Lista de widgets para el cuerpo de la app
  // Nota: Cambié 'homepage()' por 'HomePage()' siguiendo la convención de Mayúsculas
  final List<Widget> _pages = [
    homepage(),
    const Center(
      child: Text("Historial de Movimientos", style: TextStyle(fontSize: 20)),
    ),
    const Center(child: Text("Mi Cartera", style: TextStyle(fontSize: 20))),
  ];

  // Función para cambiar el índice
  void _changeIndex(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // El body ahora depende dinámicamente del índice seleccionado
      body: _pages[_index],

      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // Aquí podrías abrir un Drawer
          },
          icon: const Icon(Icons.menu, color: Colors.blue),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications, color: Colors.blue),
          ),
        ],
        backgroundColor: Colors.white,
        centerTitle: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        elevation: 8, // Sombra suave
        shadowColor: Colors.black.withOpacity(0.3),
        title: const Text(
          "AmigoPay",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 27,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index, // Esencial para que el icono se pinte de azul
        onTap: _changeIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed, // Mantiene los iconos estables
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Inicio",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.replay_outlined),
            label: "Movimientos",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_rounded),
            label: "Cartera",
          ),
        ],
      ),
    );
  }
}
