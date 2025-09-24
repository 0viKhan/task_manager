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
  int _selectedIndex = 0;


  final List<Widget> _screens = [
    const NewTaskListScreen(), // New task
    const Center(child: Text("Dummy")), // placeholder, won't be used
    const Center(child: Text("Completed Page")),
    const Center(child: Text("Cancelled Page")),
  ];

  void _onItemTapped(int index) {
    if (index == 1) {

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProgressPage(),
        ),
      );
    } else {
      // Normal tab switch
      setState(() {
        _selectedIndex = index;
      });
    }
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
          NavigationDestination(
              icon: Icon(Icons.new_label_outlined), label: 'New task'),
          NavigationDestination(
              icon: Icon(Icons.arrow_circle_right_outlined), label: 'Progress'),
          NavigationDestination(icon: Icon(Icons.done), label: 'Completed'),
          NavigationDestination(icon: Icon(Icons.close), label: 'Cancelled'),
        ],
      ),
    );
  }
}


class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Progress Page")),
      body: const Center(child: Text("All progress tasks here")),
    );
  }
}
