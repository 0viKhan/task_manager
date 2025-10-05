import 'package:flutter/material.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: Padding(
              padding: const EdgeInsets.all(12),
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
                            color: Colors.green,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Task $index",
                            style: TextStyle(fontSize: 20, color: Colors.green),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text("Task details Here"),
                      const SizedBox(height: 4),
                      const Text("time: 20:30pm"),
                      const SizedBox(height: 4),
                      Chip(label: const Text("New",
                      style: TextStyle(

                      ),

                      ),
                        backgroundColor: Colors.green,

                      ),

                    ],
                    
                  ),
                  Positioned(
                      right: 0,
                      top: 0,

                      child: Row(
                        children: [
                          IconButton(icon:const Icon(Icons.wallet_giftcard),onPressed: (){}, ),
                          IconButton(icon:const Icon(Icons.delete),onPressed: (){}, )
                        ],

                      ))

                ],

              ),

            ),
          );

        });
  }
}
