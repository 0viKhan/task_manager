import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/design/widgets/screen_background.dart';
import 'package:task_manager/screejn/Emal_Screen.dart';
import 'package:task_manager/screejn/SignUp_screen.dart';
import 'package:task_manager/screejn/main_nav_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});
  static const String  name ='SignIn';

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passRController=TextEditingController();
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
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
                    'Get Started With',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
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

                  TextFormField(

                    controller: _passRController,
                    obscureText: true,
                    autovalidateMode:AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
              
                      hintText: 'password',),

                    validator: (String? value)

                    {
                      if (value?.isEmpty?? true)
                      {
                        return 'Enter  a valid Email';
                      }
                      return null;

                    },




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
                  TextButton(onPressed:_onTapForgot,child:  Text('Forgot Password?',style: TextStyle(
                    color: Colors.grey
                  ),)),
                  RichText(
                    text: TextSpan(text: "Don't have any account?",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.4,
              
                      ),
                      children: [
                        TextSpan(
                          text: 'SignUp',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                          ),
                          recognizer: TapGestureRecognizer()..onTap=_onTapSignUp
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
  void _onTapSignUp(){
    if (_formKey.currentState!.validate())
      {
        Navigator.pushNamedAndRemoveUntil(context, SignUp.name, (predicate)=>false);
      }

  }
  void _onTapForgot(){
    Navigator.pushNamed(context, EmailPage.name);

  }
  void _onTapSignIn(){
    Navigator.pushNamedAndRemoveUntil(context, MainNavScreen.name, (predicate)=>false);

  }

  @override
  void dispose()
  {
    _emailController.dispose();
    _passRController.dispose();
    super.dispose();
  }
}
