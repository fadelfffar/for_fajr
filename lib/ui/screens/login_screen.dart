import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey     = GlobalKey<FormState>();
  final _emailCtrl   = TextEditingController();
  final _passCtrl    = TextEditingController();

  bool _obscurePass = true;
  bool _loading     = false;

  /* ---------- 8-colour vertical gradient (identical to FeedScreen) ---------- */
  static const _gradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF0D1B2A),
      Color(0xFF1B263B),
      Color(0xFF415A77),
      Color(0xFF778DA9),
      Color(0xFF9A8C98),
      Color(0xFFE9C46A),
      Color(0xFFF4A261),
      Color(0xFFE76F51),
    ],
  );

  Future<void> _signIn() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);

    try {
      final res = await Supabase.instance.client.auth.signInWithPassword(
        email: _emailCtrl.text.trim(),
        password: _passCtrl.text.trim(),
      );

      if (res.user != null && mounted) {
        final uid = res.user!.id;
        Navigator.pushReplacementNamed(context, '/feed', arguments: uid);
      }
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message), backgroundColor: Colors.red),
      );
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  /* -------------------------------------------------------------------------- */
  /*                                   BUILD                                    */
  /* -------------------------------------------------------------------------- */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(gradient: _gradient),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildHeader(),
                      const SizedBox(height: 32),
                      _buildField(
                        label: 'Email',
                        icon: Icons.email_outlined,
                        controller: _emailCtrl,
                        keyboard: TextInputType.emailAddress,
                        validator: (v) =>
                            v!.trim().isEmpty ? 'Enter your email' : null,
                      ),
                      const SizedBox(height: 16),
                      _buildField(
                        label: 'Password',
                        icon: Icons.lock_outline,
                        controller: _passCtrl,
                        obscure: _obscurePass,
                        validator: (v) =>
                            v!.trim().isEmpty ? 'Enter your password' : null,
                        suffix: IconButton(
                          icon: Icon(
                            _obscurePass
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white,
                          ),
                          onPressed: () =>
                              setState(() => _obscurePass = !_obscurePass),
                        ),
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: _loading ? null : _signIn,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF004D40),
                          foregroundColor: Colors.white,
                          elevation: 2,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: _loading
                            ? const CircularProgressIndicator(
                                color: Colors.white, strokeWidth: 3)
                            : const Text(
                                'Sign In',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: () =>
                            Navigator.pushReplacementNamed(context, '/signup'),
                        child: RichText(
                          text: const TextSpan(
                            text: 'No account? ',
                            style: TextStyle(color: Colors.white70),
                            children: [
                              TextSpan(
                                text: 'Create one',
                                style: TextStyle(
                                  color: Color(0xFFE9C46A),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
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
      ),
    );
  }

  /* -------------------------------------------------------------------------- */
  /*                               UI HELPERS                                   */
  /* -------------------------------------------------------------------------- */
  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.15),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(Icons.login, color: Colors.white, size: 40),
        ),
        const SizedBox(height: 12),
        const Text(
          'Welcome Back',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Sign in to continue sharing khayr',
          style: TextStyle(color: Colors.white70),
        ),
      ],
    );
  }

  Widget _buildField({
    required String label,
    required IconData icon,
    required TextEditingController controller,
    bool obscure = false,
    TextInputType? keyboard,
    String? Function(String?)? validator,
    Widget? suffix,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      keyboardType: keyboard,
      validator: validator,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        prefixIcon: Icon(icon, color: Colors.white),
        suffixIcon: suffix,
        filled: true,
        fillColor: Colors.white.withOpacity(.12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}