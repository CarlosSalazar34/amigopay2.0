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
    const Center(child: Text("Usuario", style: TextStyle(fontSize: 20))),
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
          icon: const Icon(Icons.menu, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications, color: Colors.white),
          ),
        ],
        backgroundColor: Colors.blue,
        centerTitle: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        elevation: 10, // Sombra suave
        shadowColor: Colors.black.withOpacity(0.3),
        title: const Text(
          "AmigoPay",
          style: TextStyle(
            color: Colors.white,
            fontSize: 27,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(
                0,
                -5,
              ), // Sombra hacia arriba para dar profundidad
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(
              30,
            ), // Redondeado para combinar con el AppBar
            topRight: Radius.circular(30),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            currentIndex: _index,
            onTap: _changeIndex,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.blue, // Mismo azul que el header
            unselectedItemColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            elevation:
                0, // Quitamos la elevación nativa porque usamos la del Container
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            unselectedLabelStyle: const TextStyle(fontSize: 12),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                activeIcon: Icon(
                  Icons.home_filled,
                ), // Icono relleno cuando está seleccionado
                label: "Inicio",
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
                label: "Usuario",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
