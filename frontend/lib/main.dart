import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frontend/pages/homepage.dart';
import 'package:frontend/pages/onboarding_page.dart';
import 'package:frontend/pages/registration_page.dart';
import 'package:frontend/pages/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  
  final bool onboardingDone = prefs.getBool('onboarding_done') ?? false;
  final bool isRegistered = prefs.getBool('is_registered') ?? false;

  Widget initialScreen;
  if (!onboardingDone) {
    initialScreen = const OnboardingPage();
  } else if (!isRegistered) {
    initialScreen = const RegistrationPage();
  } else {
    initialScreen = const MyHomePage();
  }

  runApp(MyApp(initialScreen: initialScreen));
}

class MyApp extends StatelessWidget {
  final Widget initialScreen;
  const MyApp({super.key, required this.initialScreen});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AmigoPay',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1A237E),
          secondary: const Color(0xFF00C853),
          surface: Colors.white,
          background: const Color(0xFFF5F7FA),
        ),
        textTheme: GoogleFonts.outfitTextTheme(Theme.of(context).textTheme),
      ),
      home: initialScreen,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const ProfilePage(),  // Using the real ProfilePage now
  ];

  void _changeIndex(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: _pages[_index],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: NavigationBar(
          selectedIndex: _index,
          onDestinationSelected: _changeIndex,
          backgroundColor: Colors.white,
          indicatorColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          height: 70,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home_filled, color: Color(0xFF1A237E)),
              label: "Inicio",
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person, color: Color(0xFF1A237E)),
              label: "Perfil",
            ),
          ],
        ),
      ),
    );
  }
}
