import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/design/widgets/screen_background.dart';
import 'package:task_manager/design/widgets/tm_app_bar.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key});
  static const String name='/add-new-task';

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  final TextEditingController _titleTEController =TextEditingController();
  final TextEditingController _descriptionTEController =TextEditingController();
  GlobalKey<FormState>_formkey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(),
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40,),
                Text("Add New Task",style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(height: 16,),
                TextFormField(
                  controller: _titleTEController,
                  validator:(String?value)
                  {
                    if (value?.trim().isEmpty??true)
                      {
                        return'Enter Your Title';
                      }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Title'
                  ),
                ),
                const SizedBox(height: 8,),
                TextFormField(
                  controller: _descriptionTEController,

                  validator:(String?value)
                  {
                    if (value?.trim().isEmpty??true)
                    {
                      return'Enter Your deccription';
                    }
                    return null;
                  },
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Enter your Description'
                  ),
                ),
                const SizedBox(height: 8,),
                ElevatedButton(onPressed:_onTapSubmitButton , child: Icon(Icons.arrow_circle_right_outlined))
              ],
            
            ),
          ),
        ),
      )
    );
  }
  void _onTapSubmitButton(){
    if(_formkey.currentState!.validate())
      {
        //To Do add
      }
    Navigator.pop(context);

  }
  @override
  void dispose() {
    _descriptionTEController.dispose();
    _titleTEController.dispose();
    super.dispose();
  }
}
