import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/design/widgets/tm_app_bar.dart';
import 'package:task_manager/screejn/new_task_list_screen.dart';
import 'package:task_manager/screejn/progress_page.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});
  static const String name = '/main_nav_screen';

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const NewTaskListScreen(),
    const ProgressPage(),
    const Center(child: Text("Completed Page")),
    const Center(child: Text("Cancelled Page")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TMAppBar(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.new_label_outlined), label: 'New task'),
          NavigationDestination(icon: Icon(Icons.arrow_circle_right_outlined), label: 'Progress'),
          NavigationDestination(icon: Icon(Icons.done), label: 'Completed'),
          NavigationDestination(icon: Icon(Icons.close), label: 'Cancelled'),
        ],
      ),
    );
  }
}

