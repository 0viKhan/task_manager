import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_manager/design/widgets/screen_background.dart';
import 'package:task_manager/screejn/set_passwrd.dart';

class PinVerification extends StatefulWidget {
  const PinVerification({super.key});
  static const String name = '/pin-verification';

  @override
  State<PinVerification> createState() => _PinVerificationState();
}

class _PinVerificationState extends State<PinVerification> {
  final List<TextEditingController> _otpControllers =
  List.generate(6, (_) => TextEditingController());

  @override
  void dispose() {
    for (var c in _otpControllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _verifyOtp() {
    final otp = _otpControllers.map((c) => c.text).join();
    if (otp.length == 6) {

      Navigator.pushNamed(
        context,
        SetPassword.name,
      );
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
          width: 45,
          child: TextField(
            controller: _otpControllers[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: (value) {
              if (value.isNotEmpty && index < 5) {
                FocusScope.of(context).nextFocus();
              } else if (value.isEmpty && index > 0) {
                FocusScope.of(context).previousFocus();
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                Text("Enter Verification Code",
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 8),
                const Text(
                  "We sent a 6-digit code to your email.",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                const SizedBox(height: 24),
                _buildOtpFields(),
                const SizedBox(height: 32),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: _verifyOtp,
                    icon: const Icon(Icons.check_circle_outline),
                    label: const Text("Verify"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
