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
      appBar: AppBar(title: const Text("Task List")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [

            SizedBox(
              height: 200,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  final types = ["New", "Progress", "Completed", "Cancelled"];
                  return TaskCountSummary(
                    title: types[index],
                    count: (index + 1) * 5,
                    taskType: types[index],
                  );
                },
                separatorBuilder: (context, index) =>
                const SizedBox(width: 10),
              ),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.task,
                                    size: 30,
                                    color: Colors.orange,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "Task $index",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              const Text("Task details Here"),
                              const SizedBox(height: 4),
                              const Text("time: 20:30pm"),
                              const SizedBox(height: 4),
                              Chip(
                                label: const Text(
                                  "New",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                backgroundColor: Colors.blue,
                              ),
                            ],
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit,
                                      color: Colors.blue),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
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
    required this.taskType,
  });

  final String title;
  final int count;
  final String taskType;

  Color _getTaskChipColour() {
    if (taskType.toLowerCase() == 'new') {
      return Colors.blue;
    } else if (taskType.toLowerCase() == 'progress') {
      return Colors.orange;
    } else if (taskType.toLowerCase() == 'completed') {
      return Colors.green;
    } else if (taskType.toLowerCase() == 'cancelled') {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$count',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Chip(
              label: Text(
                title,
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: _getTaskChipColour(),
            ),
          ],
        ),
      ),
    );
  }
}
