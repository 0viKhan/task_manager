import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/design/widgets/screen_background.dart';
import 'package:task_manager/screejn/sign_In.dart';
import 'package:task_manager/utills/assest_path.dart';


class  SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _movieTonextScreen();
  }
  Future<void>_movieTonextScreen() async{
    await Future.delayed(Duration(seconds: 4));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignIn()));
  }
  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      child: Scaffold(
        body: Stack(

          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/learn_with_ovi-Photoroom.png',
                height: 130,
                width: 200,
              ),
            ),



          ],
        ),



      ),
    );
  }
}
