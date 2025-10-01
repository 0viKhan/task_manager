import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/screejn/sign_In.dart';

class TMAppBar extends StatefulWidget implements PreferredSizeWidget{
  const TMAppBar({
    super.key,
  });

  @override
  State<TMAppBar> createState() => _TMAppBarState();


  @override
  // TODO: implement preferredSize
  Size get preferredSize =>Size.fromHeight(kToolbarHeight);
}


class _TMAppBarState extends State<TMAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      title: Row(
        children: [
          CircleAvatar(),
          const SizedBox(width: 16,),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Ovi', style: TextStyle(
                    fontSize: 15,
                    color: Colors.white
                ),),

                Text('Ovikhan753@gmail.com', style: TextStyle(
                    fontSize: 14,
                    color: Colors.black
                ),)
              ],
            ),
          ),
          IconButton(onPressed: _onTapLogOutButton, icon: Icon(Icons.logout)),
        ],
      ),
    );
  }

  void _onTapLogOutButton() {
    Navigator.pushNamedAndRemoveUntil(
        context, SignIn.name, (predicate) => false);
  }
}