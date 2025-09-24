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
      appBar: AppBar(title: const Text("Task List")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Horizontal list
            SizedBox(
              height: 200,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return TaskCountSummary(
                    title: 'Progress $index',
                    count: 11,
                  );
                },
                separatorBuilder: (context, index) =>
                const SizedBox(width: 10),
              ),
            ),

            const SizedBox(height: 16),

            // Vertical list
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      title: Text("Task $index"),
                      tileColor: Colors.white,
                      titleTextStyle:TextStyle(
                      color: Colors.black,
                        fontSize: 18,
                      ),
                      subtitle:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("Task details Here",),
                         SizedBox(height: 4,),
                         Text("time:20:30pm"),
                         Row(
                           children: [
                             Chip(label: Text("New",style: TextStyle(
                               color: Colors.blue
                             ),))
                           ],
                         )
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$count',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(title), 
            IconButton(onPressed: (){}, icon: Icon(Icons.food_bank))
          ],
        ),
      ),
    );
  }
}
