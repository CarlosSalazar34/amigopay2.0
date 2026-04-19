import 'package:flutter/material.dart';
import 'package:amigopay/components/amount_card.dart';
import 'package:amigopay/components/movimientos.dart';
import 'package:amigopay/components/sheet_button.dart';
import 'package:amigopay/pages/notifications_page.dart';
import 'package:amigopay/services/api_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService apiService = ApiService();
  List<Map<String, dynamic>> movimientos = [];
  double balance = 0.0;
  bool isLoading = true;
  String userName = 'Recuperando...';
  bool hasUnreadNotifications = false;

  @override
  void initState() {
    super.initState();
    _loadData();
    _loadUser();
  }

  void _loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('user_name') ?? 'Usuario';
    });
  }

  Future<void> _loadData() async {
    setState(() => isLoading = true);
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('user_id') ?? 0;

    final fetchedMovimientos = await apiService.getTransactions(userId);
    final fetchedBalance = await apiService.getBalance(userId);
    final fetchedNotifs = await apiService.getNotifications(userId);
    
    setState(() {
      movimientos = fetchedMovimientos.reversed.toList();
      balance = fetchedBalance;
      hasUnreadNotifications = fetchedNotifs.any((n) => n['leido'] == 0);
      isLoading = false;
    });
  }

  Future<void> _agregarMovimiento(Map<String, dynamic> nuevo) async {
    final prefs = await SharedPreferences.getInstance();
    nuevo['user_id'] = prefs.getInt('user_id') ?? 0;
    await apiService.createTransaction(nuevo);
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: RefreshIndicator(
        onRefresh: _loadData,
        displacement: 80,
        color: const Color(0xFF1A237E),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: false,
              backgroundColor: const Color(0xFFF5F7FA),
              surfaceTintColor: Colors.transparent,
              title: Text(
                'Hola, $userName',
                style: GoogleFonts.outfit(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1A237E),
                ),
              ),
              actions: [
                Stack(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const NotificationsPage()),
                        ).then((_) => _loadData()); // Refresh when coming back
                      },
                      icon: const Icon(Icons.notifications_outlined, size: 28),
                    ),
                    if (hasUnreadNotifications)
                      Positioned(
                        right: 12,
                        top: 12,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 8),
              ],
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    isLoading 
                      ? const Center(child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 40),
                          child: CircularProgressIndicator(),
                        ))
                      : AmountCard(amount: balance),
                    const SizedBox(height: 24),
                    Text(
                      "Acciones Rápidas",
                      style: GoogleFonts.outfit(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1A237E),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SheetButton(onAdd: _agregarMovimiento),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Actividad Reciente',
                          style: GoogleFonts.outfit(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF1A237E),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Ver todo'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    isLoading 
                      ? const Center(child: Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: CircularProgressIndicator(),
                        ))
                      : MovimientosList(movimientos: movimientos),
                    const SizedBox(height: 100), // Spacing for bottom
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
