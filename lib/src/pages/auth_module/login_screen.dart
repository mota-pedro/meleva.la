import 'package:flutter/material.dart';
import 'package:meleva_la/src/pages/home_module/home_screen.dart';
import 'package:meleva_la/src/services/auth_service.dart';
import 'package:meleva_la/src/widgets/custom_button.dart';
import 'package:meleva_la/src/widgets/custom_text_field.dart';

import '../../models/user.dart';
import '../../services/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService authService = AuthService();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  String? errorMessage;
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/melevala_blue.png',
                              width: MediaQuery.of(context).size.width,
                            ),
                            const SizedBox(height: 20),
                            CustomTextField(
                              controller: emailController,
                              label: 'Email',
                              icon: Icons.email_rounded,
                            ),
                            const SizedBox(height: 14),
                            CustomTextField(
                              controller: passwordController,
                              label: 'Senha',
                              icon: Icons.lock_rounded,
                              isPassword: true,
                            ),
                            if (errorMessage != null)
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10.0,
                                  top: 20.0,
                                ),
                                child: Text(
                                  errorMessage!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: theme.colorScheme.onError,
                                  ),
                                ),
                              ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Checkbox(
                                  value: rememberMe,
                                  overlayColor: WidgetStateProperty.all(
                                    theme.colorScheme.primary,
                                  ),
                                  side: BorderSide(
                                    color: theme.colorScheme.tertiary,
                                    width: 1.75,
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      rememberMe = value ?? false;
                                    });
                                  },
                                ),
                                Text(
                                  'Lembre-se de mim',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: theme.colorScheme.tertiary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24.0),
                        child: CustomButton(
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });
                            try {
                              await authService.doLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );

                              if (mounted) {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
                                  ),
                                  (route) => false,
                                );
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            } catch (error) {
                              if (mounted) {
                                setState(() {
                                  isLoading = false;
                                  errorMessage = 'Credenciais inválidas';
                                });
                              }
                            }
                          },
                          title: 'Entrar',
                          isLoading: isLoading,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
