import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isPasswordVisible = false;

  Widget _gap() {
    return const SizedBox(height: 16);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 8,
          child: Container(
        padding: const EdgeInsets.all(32),
        constraints: const BoxConstraints(
          maxWidth: 350,
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const FlutterLogo(size: 100),
            _gap(),
            Text(
              "Masuk Aplikasi Iuran Warga",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            _gap(),
            TextFormField(
              decoration: const InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Email tidak boleh kosong';
            }
            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
              return 'Email tidak valid';
            }
            return null;
              },
            ),
            _gap(),
            TextFormField(
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
            labelText: 'Password',
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible
                ? Icons.visibility
                : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
              _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
              ),
              validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Password tidak boleh kosong';
            }
            if (value.length < 6) {
              return 'Password minimal 6 karakter';
            }
            return null;
              },
            ),
            _gap(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                // TODO: Implement login logic
                ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Login berhasil!'),
              ),
                );
              }
            },
            child: const Text('Masuk'),
              ),
            ),
          ],
            ),
          ),
        ),
          ),
        ),
      ),
    );
  }
}