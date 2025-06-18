import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/firebase_service.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _loading = false;
  String? _error;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      await FirebaseService.signInWithEmail(_emailController.text, _passwordController.text);
    } catch (e) {
      setState(() {
        _error = 'Login failed';
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  Future<void> _loginAnon() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      await FirebaseService.signInAnonymously();
    } catch (e) {
      setState(() {
        _error = 'Anonymous login failed';
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Fullphysio', style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 32),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (v) => v != null && v.contains('@') ? null : 'Enter a valid email',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (v) => v != null && v.length >= 6 ? null : 'Min 6 chars',
                ),
                const SizedBox(height: 24),
                if (_error != null) ...[Text(_error!, style: const TextStyle(color: Colors.red)), const SizedBox(height: 8)],
                AppButton(label: 'Login', onPressed: _login, loading: _loading),
                const SizedBox(height: 12),
                AppButton(label: 'Login Anonymously', onPressed: _loginAnon, filled: false, loading: _loading),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
