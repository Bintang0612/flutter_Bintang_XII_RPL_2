import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/profile.png'), // Ganti dengan path foto profil
                ),
                const SizedBox(height: 16),
                const Text(
                  'Agus Wijaya',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Alamat: Jl. Contoh No. 123',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Status Iuran: Lunas',
                  style: TextStyle(fontSize: 16, color: Colors.green),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Total Iuran:', style: TextStyle(fontSize: 16)),
                    Text('Rp 500.000', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Terakhir Bayar:', style: TextStyle(fontSize: 16)),
                    Text('Juni 2024', style: TextStyle(fontSize: 16)),
                  ],
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    // aksi jika ingin membayar iuran
                  },
                  child: const Text('Bayar Iuran'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}