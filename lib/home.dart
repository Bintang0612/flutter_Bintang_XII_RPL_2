import 'package:flutter/material.dart';
import 'package:flutter_application_1/profile.dart';

class HomePage extends StatefulWidget {
  final String token;
  final int userId;

  const HomePage({super.key, required this.token, required this.userId});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Variabel untuk menyimpan indeks tab yang aktif

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const Center(child: Text('Ini halaman Beranda')),
      const Center(child: Text('Ini halaman Bookmark')),
      const Center(child: Text('Ini halaman Cart')),
      ProfilePage(
          userId: widget.userId.toString()), // Menggunakan userId dari widget
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Flutter'), // Judul di AppBar
      ),
      body: _pages[_selectedIndex], // Menampilkan halaman sesuai index
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(milliseconds: 300), // Animasi tab
        selectedIndex: _selectedIndex, // Tab aktif
        onDestinationSelected: (index) {
          // Saat tab dipilih
          setState(() {
            _selectedIndex = index; // Update index dan render ulang halaman
          });
        },
        destinations: const [
          // Daftar item NavigationBar
          NavigationDestination(
            icon: Icon(Icons.home_outlined), // Icon default
            selectedIcon: Icon(Icons.home_rounded), // Icon aktif
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.bookmark_border_outlined),
            selectedIcon: Icon(Icons.bookmark_rounded),
            label: 'Bookmarks',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_bag_outlined),
            selectedIcon: Icon(Icons.shopping_bag),
            label: 'Cart',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}