import 'package:flutter/material.dart';

class CompletedPage extends StatelessWidget {
  const CompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: 5, // example data
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 6),
          child: ListTile(
            leading: const Icon(Icons.done, color: Colors.green),
            title: Text("Completed Task $index"),
            subtitle: const Text("This task has been successfully finished."),
            trailing: const Chip(
              label: Text("Completed"),
              backgroundColor: Colors.greenAccent,
            ),
          ),
        );
      },
    );
  }
}
