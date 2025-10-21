import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/api_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ApiService apiService = ApiService();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isloading = false;

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
              controller: _usernameController,
              decoration: const InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.email),
              ),
            ),
            _gap(),
            TextFormField(
              controller: _passwordController,
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
            ),
            _gap(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
            onPressed: _isloading ? null : () async {
              if (_formKey.currentState?.validate() ?? false) {
                setState(() => _isloading = true);
                try {
                  String  token = await apiService.login(
                    _usernameController.text.trim(),
                    _passwordController.text.trim(),
                  );
                  if (!mounted) return;
                  Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => HomePage(token:token, userId: 2),
                  ));
                } 
                catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                } finally {
                  setState(() => _isloading = false);
                }
                }
                },
            child: _isloading
              ? const CircularProgressIndicator(color: Colors.white)
              : const Text('Masuk', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                ),
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