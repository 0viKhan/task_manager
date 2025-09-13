import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/design/widgets/screen_background.dart';
import 'package:task_manager/screejn/Emal_Screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  static const String  name ='SignUp';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController=TextEditingController();

  final TextEditingController _firstname=TextEditingController();
  final TextEditingController _lastname=TextEditingController();
  final TextEditingController _phone=TextEditingController();
  final TextEditingController _passRController=TextEditingController();



  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,

        body: ScreenBackground(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 80,),
                    Text(
                      'Join With Us',
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
            
                      controller: _firstname,
                      textInputAction: TextInputAction.next,
            
                      autovalidateMode:AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
            
                        hintText: 'First Name',),
            
                      validator: (String? value)
            
                      {
                        if (value?.trim().isEmpty?? true)
                        {
                          return 'Enter  a Name';
                        }
                        return null;
            
                      },
            
            
            
            
                    ),
                const SizedBox(
                 height: 8,
                     ),
                    TextFormField(
            
                      controller: _lastname,
                      textInputAction: TextInputAction.next,
                      autovalidateMode:AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
            
                        hintText: 'Last Name',),
            
                      validator: (String? value)
            
                      {
                        if (value?.trim().isEmpty?? true)
                        {
                          return 'Enter Last a Name';
                        }
                        return null;
            
                      },
            
            
            
            
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: _phone,
                      obscureText: true,
                      keyboardType: TextInputType.phone,
                      autovalidateMode:AutovalidateMode.onUserInteraction,
            
                      decoration: InputDecoration(
            
                        hintText: 'Phone Number',),
            
                      validator: (String? value)
            
                      {
                        if (value?.trim().isEmpty?? true)
                        {
                          return 'Mobile Nunmber';
                        }
                        return null;
            
                      },
            
            
            
            
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
                      text: TextSpan(text: " Have a account?",
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
      ),


    );

  }
  void _onTapSignUp(){
    if (_formKey.currentState!.validate())
    {
      //Todo signIn
    }

  }
  void _onTapForgot(){

  }
  void _onTapSignIn(){
    Navigator.pushReplacementNamed(context, EmailPage.name);


  }
  @override
  void dispose()
  {
    _emailController.dispose();
    _passRController.dispose();
    _firstname.dispose();
    _lastname.dispose();
    _phone.dispose();
    super.dispose();
  }
}
