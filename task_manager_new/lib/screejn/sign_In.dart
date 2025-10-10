import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/data/service/Network_caller.dart';
import 'package:task_manager/design/widgets/centered_circular_progress_indicator.dart';
import 'package:task_manager/design/widgets/screen_background.dart';
import 'package:task_manager/design/widgets/snack_bar_message.dart';
import 'package:task_manager/screejn/Emal_Screen.dart';
import 'package:task_manager/screejn/SignUp_screen.dart';
import 'package:task_manager/screejn/main_nav_screen.dart';
import 'package:task_manager/utills/Urls.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});
  static const String name = 'SignIn';

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passRController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _signInProgress = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ScreenBackground(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  Text(
                    'Get Started With',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),


                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      hintText: "Enter Email",
                    ),
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Email is required';
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value.trim())) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    textInputAction: TextInputAction.next,
                  ),

                  const SizedBox(height: 8),


                  TextFormField(
                    controller: _passRController,
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                    ),
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Password is required';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),


                  Visibility(
                    visible: !_signInProgress,
                    replacement: const CenteredCircularProgressIndicator(),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _signIn();
                        }
                      },
                      child: const Icon(Icons.arrow_circle_right_outlined),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Forgot password button
                  TextButton(
                    onPressed: _onTapForgot,
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),

                  // Signup link
                  RichText(
                    text: TextSpan(
                      text: "Don't have any account? ",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.4,
                      ),
                      children: [
                        TextSpan(
                          text: 'SignUp',
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = _onTapSignUp,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignUp() {
    Navigator.pushNamedAndRemoveUntil(
        context, SignUp.name, (predicate) => false);
  }

  void _onTapForgot() {
    Navigator.pushNamed(context, EmailPage.name);
  }

  Future<void> _signIn() async {
    _signInProgress = true;
    setState(() {});

    Map<String, String> requestBody = {
      "email": _emailController.text.trim(),
      "password": _passRController.text,
    };

    NetworkResponse response =
    await NetworkCaller.postRequest(url: Urls.loginUrl, body: requestBody);

    _signInProgress = false;
    setState(() {});

    if (response.isSuccess) {
      Navigator.pushNamedAndRemoveUntil(
          context, MainNavScreen.name, (predicate) => false);
    } else {
      showSnackbarMessage(context, response.errorMessage ?? 'Login failed');
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passRController.dispose();
    super.dispose();
  }
}
