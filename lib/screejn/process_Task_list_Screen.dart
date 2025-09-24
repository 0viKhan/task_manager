import 'package:flutter/cupertino.dart';

class ProcessTaskListScreen extends StatefulWidget {
  const ProcessTaskListScreen({super.key});

  @override
  State<ProcessTaskListScreen> createState() => _ProcessTaskListScreenState();
}

class _ProcessTaskListScreenState extends State<ProcessTaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context,index)
      {
        return TaskCard)();

      },
    ()

    );
  }
}
