import 'package:flutter/material.dart';
import 'userdata.dart';

List<Userdata> users = [Userdata('ad', 'min', 'admin', '123456')];

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _obscure = true;
  bool _submitting = false;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  String? _validateEmail(String? v) {
    final x = (v ?? '').trim();
    if (x.isEmpty) return 'Email or username is required';

    // Check if email exists in users list
    if (!users.any((user) => user.email == x)) {
      return 'Email not found. Please sign up first.';
    }
    return null;
  }

  String? _validatePass(String? v) {
    final password = v ?? '';
    if (password.isEmpty) return 'Password is required';
    if (password.length < 6) return 'Use at least 6 characters';

    final email = _emailCtrl.text.trim();

    // Safely look up user (nullable)
    final Userdata? user = users
        .where((u) => u.email == email)
        .cast<Userdata?>()
        .firstOrNull;

    // If user exists, verify password
    if (user != null && user.password != password) {
      return 'Password is incorrect';
    }

    return null;
  }

  Future<void> _onLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _submitting = true);
    await Future.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;

    // Navigate to your main page (home/event page)
    Navigator.of(context).pushNamedAndRemoveUntil('/', (r) => false);
    setState(() => _submitting = false);
  }

  InputDecoration _decoration({
    required String label,
    required IconData icon,
    Widget? suffix,
  }) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.white70),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      prefixIcon: Icon(icon, color: Colors.white70),
      suffixIcon: suffix,
      filled: true,
      fillColor: Colors.white.withOpacity(0.15),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.white38),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.white, width: 1.8),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.redAccent, width: 1.8),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is List<Userdata>) {
      users = args;
      print('Received ${users.length} users');
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final maxW = width < 480 ? width : 480.0;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Login"),
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushNamedAndRemoveUntil(
            context,
            '/welcome',
            (r) => false,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(8, 45, 115, 1), // dark navy top
              Color.fromRGBO(34, 87, 170, 1), // medium blue
              Color.fromRGBO(176, 209, 235, 1), // light blue bottom
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxW),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // App Title
                      const Text(
                        'OffdaBreak',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 70),

                      // Email or username field
                      TextFormField(
                        controller: _emailCtrl,
                        style: const TextStyle(color: Colors.white),
                        validator: _validateEmail,
                        decoration: _decoration(
                          label: 'Email or username',
                          icon: Icons.mail_outline,
                        ),
                      ),
                      const SizedBox(height: 14),

                      // Password field
                      TextFormField(
                        controller: _passCtrl,
                        style: const TextStyle(color: Colors.white),
                        validator: _validatePass,
                        obscureText: _obscure,
                        decoration: _decoration(
                          label: 'Password',
                          icon: Icons.lock_outline,
                          suffix: IconButton(
                            icon: Icon(
                              _obscure
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: Colors.white70,
                            ),
                            onPressed: () =>
                                setState(() => _obscure = !_obscure),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Forgot password
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () =>
                              Navigator.of(context).pushNamed('/forgotpw'),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('Forgot Password?'),
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Sign In Button
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: _submitting ? null : _onLogin,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 3,
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          child: _submitting
                              ? const SizedBox(
                                  width: 22,
                                  height: 22,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.black,
                                  ),
                                )
                              : const Text('Sign in'),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Sign Up link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account? ",
                            style: TextStyle(color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(
                              context,
                            ).pushReplacementNamed('/signup'),
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                color: const Color.fromRGBO(8, 45, 115, 1),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),
                      const Text(
                        'or',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      const SizedBox(height: 12),

                      // Social Icons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _SocialSquare(
                            bg: const Color(0xFFF4F4F4).withOpacity(0.8),
                            icon: Icons.g_mobiledata,
                            iconColor: Colors.black,
                          ),
                          const SizedBox(width: 12),
                          _SocialSquare(
                            bg: const Color(0xFFF4F4F4).withOpacity(0.8),
                            icon: Icons.apple,
                            iconColor: Colors.black,
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
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
}

class _SocialSquare extends StatelessWidget {
  final Color bg;
  final IconData icon;
  final Color iconColor;
  final VoidCallback? onTap;

  const _SocialSquare({
    Key? key,
    required this.bg,
    required this.icon,
    required this.iconColor,
    // ignore: unused_element_parameter
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap ?? () {},
        borderRadius: BorderRadius.circular(12),
        splashColor: Colors.white24,
        child: Ink(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(child: Icon(icon, color: iconColor, size: 24)),
        ),
      ),
    );
  }
}
