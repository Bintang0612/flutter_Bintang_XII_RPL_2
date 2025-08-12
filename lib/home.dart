import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Home Iuran Warga'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Daftar Iuran Warga',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text('Budi Santoso'),
                      subtitle: const Text('Iuran: Rp 50.000'),
                      trailing: const Icon(Icons.check_circle, color: Colors.green),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text('Siti Aminah'),
                      subtitle: const Text('Iuran: Rp 50.000'),
                      trailing: const Icon(Icons.cancel, color: Colors.red),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text('Agus Wijaya'),
                      subtitle: const Text('Iuran: Rp 50.000'),
                      trailing: const Icon(Icons.check_circle, color: Colors.green),
                    ),
                  ),
                  // Tambahkan data warga lain di sini
                ],
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // aksi tambah iuran
              },
              icon: const Icon(Icons.add),
              label: const Text('Tambah Iuran'),
            ),
          ],
        ),
      ),
    );
  }
}