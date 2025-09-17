import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/design/widgets/tm_app_bar.dart';
import 'package:task_manager/screejn/new_task_list_screen.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});
  static const String name = '/main_nav_screen';

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  List<Widget> _screen = [
    NewTaskListScreen()
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(),
     body: _screen[_selectedIndex],
      bottomNavigationBar: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected:(int index)
          {
            _selectedIndex=index;
            setState(() {

            });
          },

          destinations: [
        NavigationDestination(
            icon: Icon(Icons.new_label_outlined), label: 'New task'),
        NavigationDestination(
            icon: Icon(Icons.arrow_circle_right_outlined), label: 'progress'),
        NavigationDestination(icon: Icon(Icons.done), label: 'completed'),
        NavigationDestination(icon: Icon(Icons.close), label: 'completed'),

      ]),
    );
  }
}

