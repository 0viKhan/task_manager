
import 'package:flutter/material.dart';
import 'package:task_manager/screejn/Emal_Screen.dart';
import 'package:task_manager/screejn/SignUp_screen.dart';
import 'package:task_manager/screejn/add_new_task.dart';
import 'package:task_manager/screejn/main_nav_screen.dart';
import 'package:task_manager/screejn/pin_verifiaction.dart';
import 'package:task_manager/screejn/set_passwrd.dart';

import 'package:task_manager/screejn/sign_In.dart';
import 'package:task_manager/screejn/splash_screen.dart';
import 'package:task_manager/screejn/update_profile_screen.dart';

class Taskmanager extends StatelessWidget {
  const Taskmanager({super.key});
  static GlobalKey<NavigatorState>navigator=GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      navigatorKey: navigator,
      theme: ThemeData(

        colorSchemeSeed: Colors.blue,
        textTheme: TextTheme(
          titleLarge:
            TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700
            ),


        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.all(16),
          hintStyle:TextStyle(
            color: Colors.grey,

          ) ,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              fixedSize: Size.fromWidth(double.maxFinite),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)
              ),
              padding: EdgeInsets.symmetric(vertical: 12),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white
          ),

        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Colors.green
            )
        )
        ),





      routes: {
        SplashScreen.name: (context) => SplashScreen(),
        SignIn.name: (context) => SignIn(),
        SignUp.name: (context) => SignUp(),
        EmailPage.name: (context) => EmailPage(),
        PinVerification.name: (context) => PinVerification(),
        MainNavScreen.name: (context) => MainNavScreen(),
        AddNewTask.name:(context)=>AddNewTask(),
        UpdateProfileScreen.name:(context)=>UpdateProfileScreen(),
        SetPassword.name:(context)=>SetPassword()





      },


    );
  }
}
