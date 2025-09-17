import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewTaskListScreen extends StatefulWidget {
  const NewTaskListScreen({super.key});

  @override
  State<NewTaskListScreen> createState() => _NewTaskListScreenState();
}

class _NewTaskListScreenState extends State<NewTaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task List')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: 5, // example: 5 items
                itemBuilder: (context, index) {
                  return TaskCountSummary(
                    title: 'Progress',
                    count: 12,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10); // space between cards
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskCountSummary extends StatelessWidget {
  const TaskCountSummary({
    super.key,
    required this.title,
    required this.count,
  });

  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              '$count',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
