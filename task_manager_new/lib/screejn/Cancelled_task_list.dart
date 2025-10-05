import 'package:flutter/material.dart';

class Cancelled_task_list_page extends StatelessWidget {
  const Cancelled_task_list_page({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 6),
          child: ListTile(
            leading: const Icon(Icons.arrow_circle_right_outlined, color: Colors.orange),
            title: Text("Progress Task $index"),
            subtitle: const Text("Details about this progress task..."),
            trailing: const Chip(
              label: Text("In Progresses"),
              backgroundColor: Colors.orangeAccent,
            ),
          ),
        );
      },
    );
  }
}

