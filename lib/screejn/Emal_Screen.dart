import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_manager/design/widgets/screen_background.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({super.key});
  static const String name = 'EmailPage';

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // OTP controllers
  final List<TextEditingController> _otpControllers =
  List.generate(6, (index) => TextEditingController());

  bool _isOtpStep = false;

  @override
  void dispose() {
    _emailController.dispose();
    for (var c in _otpControllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _onTapSubmitEmail() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isOtpStep = true;
      });
      // TODO: Send OTP to the email
    }
  }

  void _onVerifyOtp() {
    String otp = _otpControllers.map((c) => c.text).join();
    if (otp.length == 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("OTP Verified: $otp")),
      );
      // TODO: Add verification API call
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enter all 6 digits")),
      );
    }
  }

  Widget _buildOtpFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(6, (index) {
        return SizedBox(
          width: 40,
          child: TextField(
            controller: _otpControllers[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: (value) {
              if (value.isNotEmpty && index < 5) {
                FocusScope.of(context).nextFocus();
              }
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        );
      }),
    );
  }

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
                    _isOtpStep ? 'Enter Verification Code' : 'Your Email Address',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _isOtpStep
                        ? 'We sent a 6 digit verification code to your email'
                        : 'A 6 digit verification pin will be sent to your email address',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Step 1: Email Input
                  if (!_isOtpStep)
                    TextFormField(
                      controller: _emailController,
                      validator: (String? value) {
                        if (value == null ||
                            value.isEmpty ||
                            !value.contains('@')) {
                          return 'Enter a valid Email';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Email',
                      ),
                    ),

                  // Step 2: OTP Input
                  if (_isOtpStep) _buildOtpFields(),

                  const SizedBox(height: 24),

                  Center(
                    child: ElevatedButton(
                      onPressed: _isOtpStep ? _onVerifyOtp : _onTapSubmitEmail,
                      child: Icon(
                        _isOtpStep
                            ? Icons.check_circle_outline
                            : Icons.arrow_circle_right_outlined,
                      ),
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
}
