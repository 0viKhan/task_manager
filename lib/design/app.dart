
import 'package:flutter/material.dart';
import 'package:task_manager/screejn/splash_screen.dart';

class Taskmanager extends StatelessWidget {
  const Taskmanager({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
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
      ),



      home: SplashScreen(),

    );
  }
}
