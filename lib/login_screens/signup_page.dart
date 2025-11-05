import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  static const _blue = const Color.fromRGBO(8, 45, 115, 1);

  final _formKey = GlobalKey<FormState>();
  final _firstCtrl = TextEditingController();
  final _lastCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();

  bool _obscure1 = true;
  bool _obscure2 = true;
  bool _submitting = false;

  @override
  void dispose() {
    _firstCtrl.dispose();
    _lastCtrl.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  String? _validateNotEmpty(String? v, String label) {
    if (v == null || v.trim().isEmpty) return '$label is required';
    return null;
  }

  String? _validateEmail(String? v) {
    final value = (v ?? '').trim();
    if (value.isEmpty) return 'Email is required';
    final re = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (!re.hasMatch(value)) return 'Enter a valid email';
    return null;
  }

  String? _validatePassword(String? v) {
    final value = v ?? '';
    if (value.isEmpty) return 'Password is required';
    if (value.length < 6) return 'Use at least 6 characters';
    return null;
  }

  String? _validateConfirm(String? v) {
    if (v == null || v.isEmpty) return 'Confirm your password';
    if (v != _passCtrl.text) return 'Passwords do not match';
    return null;
  }

  Future<void> _onRegister() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _submitting = true);
    await Future.delayed(const Duration(milliseconds: 600)); // mock API
    if (!mounted) return;

    // TODO: replace with your real signup flow
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Registered!')));

    // Navigate to login or home
    Navigator.of(context).pushReplacementNamed('/login');
    setState(() => _submitting = false);
  }

  InputDecoration _fieldDeco({
    required String label,
    IconData? prefix,
    Widget? suffix,
  }) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.white70),

      floatingLabelBehavior: FloatingLabelBehavior.never,

      filled: true,
      fillColor: Colors.white.withOpacity(0.15),
      prefixIcon: prefix == null ? null : Icon(prefix, color: Colors.white70),
      suffixIcon: suffix,
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
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.red, width: 1.8),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final maxW = width < 480 ? width : 480.0;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Sign Up"),
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(8, 45, 115, 1),
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.white),
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
                      const Text(
                        'OffdaBreak',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // same blue as buttons
                        ),
                      ),
                      const SizedBox(height: 70),
                      // Name row
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _firstCtrl,
                              validator: (v) =>
                                  _validateNotEmpty(v, 'First name'),
                              textInputAction: TextInputAction.next,
                              decoration: _fieldDeco(
                                label: 'Firstname',
                                prefix: Icons.person_outline,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextFormField(
                              controller: _lastCtrl,
                              validator: (v) =>
                                  _validateNotEmpty(v, 'Last name'),
                              textInputAction: TextInputAction.next,
                              decoration: _fieldDeco(
                                label: 'Lastname',
                                prefix: Icons.person_outline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),

                      // Email
                      TextFormField(
                        controller: _emailCtrl,
                        keyboardType: TextInputType.emailAddress,
                        validator: _validateEmail,
                        textInputAction: TextInputAction.next,
                        decoration: _fieldDeco(
                          label: 'Email',
                          prefix: Icons.email_outlined,
                        ),
                      ),
                      const SizedBox(height: 14),

                      // Password
                      TextFormField(
                        controller: _passCtrl,
                        validator: _validatePassword,
                        obscureText: _obscure1,
                        textInputAction: TextInputAction.next,
                        decoration: _fieldDeco(
                          label: 'Password',
                          prefix: Icons.lock_outline,
                          suffix: IconButton(
                            icon: Icon(
                              _obscure1
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: Colors.white70,
                            ),
                            onPressed: () =>
                                setState(() => _obscure1 = !_obscure1),
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),

                      // Confirm Password
                      TextFormField(
                        controller: _confirmCtrl,
                        validator: _validateConfirm,
                        obscureText: _obscure2,
                        decoration: _fieldDeco(
                          label: 'Confirm Password',
                          prefix: Icons.lock_outline,
                          suffix: IconButton(
                            icon: Icon(
                              _obscure2
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: Colors.white70,  
                            ),
                            onPressed: () =>
                                setState(() => _obscure2 = !_obscure2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Register button (blue)
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: _submitting ? null : _onRegister,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
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
                              : const Text('Register'),
                        ),
                      ),

                      const SizedBox(height: 14),

                      // Already have account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account? "),
                          GestureDetector(
                            onTap: () => Navigator.of(
                              context,
                            ).pushReplacementNamed('/login'),
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                color: _blue,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),
                      const Text('or'),

                      const SizedBox(height: 12),

                      // Social buttons (white squares, blue icons)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          _SocialSquare(icon: Icons.g_mobiledata),
                          SizedBox(width: 12),
                          _SocialSquare(icon: Icons.apple),
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
  final IconData icon;
  final VoidCallback? onTap;

  const _SocialSquare({Key? key, required this.icon, this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // allows gradient/background to show through
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap ?? () {},
        borderRadius: BorderRadius.circular(12),
        splashColor: Colors.blue.withOpacity(0.2), // nice blue ripple
        child: Ink(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xFFF4F4F4).withOpacity(0.8), // subtle gray
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(child: Icon(icon, color: Colors.black87, size: 22)),
        ),
      ),
    );
  }
}
