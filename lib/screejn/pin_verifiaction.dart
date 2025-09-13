import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';
import 'package:task_manager/design/widgets/screen_background.dart';
import 'package:task_manager/screejn/SignUp_screen.dart';
import 'package:task_manager/screejn/sign_In.dart';

class PinVerification extends StatefulWidget {

  const PinVerification({super.key});
  static const String  name ='PinVerification';

  @override
  State<PinVerification> createState() => _PinVerificationState();
}

class _PinVerificationState extends State<PinVerification> {
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  late EmailAuth emailAuth;
  bool submitValid = false;
  @override
  void initState() {
    super.initState();
    emailAuth = EmailAuth(sessionName: "Sample session");
  }

  void sendOtp() async {
    bool result = await emailAuth.sendOtp(
      recipientMail: _emailController.text,
      otpLength: 6,
    );
    if (result) {
      setState(() {
        submitValid = true;
      });
    }
  }

  bool verifyOtp() {
    return emailAuth.validateOtp(
      recipientMail: _emailController.text,
      userOtp: _otpController.text,
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _otpController.dispose();
    super.dispose();
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
                  const SizedBox(height: 80,),

                  Text(
                    'Verification Code',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  Text('A 6 digit verifiaction pin will send to your email address',style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                    letterSpacing: 0.4,
                  ),),
                  TextFormField(
                    validator: (String? value)

                    {
                      if (value?.isEmpty?? true)
                      {
                        return 'Enter  a valid Email';
                      }
                      return null;

                    },
                    controller: _emailController,
                    textInputAction: TextInputAction.next,
                    autovalidateMode:AutovalidateMode.always ,
                    decoration: InputDecoration(

                      hintText: 'Email',

                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),


                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: _onTapSignIn, child: Icon(Icons.arrow_circle_right_outlined),
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  RichText(
                    text: TextSpan(text: "Have Acount?",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.4,

                      ),
                      children: [
                        TextSpan(
                            text: 'SignIn',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w500,
                            ),
                            recognizer: TapGestureRecognizer()..onTap=_onTapSignIn
                        ),
                      ],

                    ),
                  )


                ],



              ),
            ),
          ),
        ),
      ),


    );

  }
  void _onTapSubmit(){
    if (_formKey.currentState!.validate())
    {
      //Todo signIn
    }

  }
  void _onTapForgot(){

  }
  void _onTapSignIn(){
    Navigator.pushReplacementNamed(context, SignIn.name);

    @override
    void dispose()
    {
      _emailController.dispose();
      super.dispose();
    }
  }
}
