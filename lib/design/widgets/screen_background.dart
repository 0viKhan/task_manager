import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenBackground extends StatelessWidget {
  const ScreenBackground({super.key, required this.child});
     final Widget child;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
      
          children: [
            Image.network('https://img.freepik.com/free-photo/close-up-detailed-paper-texture_23-2151873015.jpg?w=360',
              height: double.maxFinite,width:  double.maxFinite,fit: BoxFit.cover,),
             SafeArea(child: child),
          ],
        ),
      
      
      
      ),
    );
  }
}
