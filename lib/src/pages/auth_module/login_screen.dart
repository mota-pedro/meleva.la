import 'package:flutter/material.dart';
import 'package:meleva_la/src/pages/home_module/home_screen.dart';
import 'package:meleva_la/src/widgets/custom_button.dart';
import 'package:meleva_la/src/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Checkbox(
                                    value: rememberMe,
                                    overlayColor: WidgetStateProperty.all(theme.colorScheme.primary),
                                    side: BorderSide(color: theme.colorScheme.tertiary, width: 1.75),
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
                                      color: theme.colorScheme.tertiary
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
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);
                            },
                            title: 'Entrar',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
        )
      ),
    );
  }
}
