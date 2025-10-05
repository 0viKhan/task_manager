import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:task_manager/design/widgets/screen_background.dart';
import 'package:task_manager/design/widgets/tm_app_bar.dart';
import 'package:task_manager/screejn/Emal_Screen.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});
  static const String name = '/UpdateProfile';

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final _emailController = TextEditingController();
  final _firstname = TextEditingController();
  final _lastname = TextEditingController();
  final _phone = TextEditingController();
  final _passRController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  File? _profileImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(),
      body: ScreenBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                Center(
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.grey.shade300,
                      backgroundImage: _profileImage != null
                          ? FileImage(_profileImage!)
                          : null,
                      child: _profileImage == null
                          ? const Icon(Icons.camera_alt, size: 30, color: Colors.white)
                          : null,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text('Update Profile', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),

                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(hintText: 'Email'),
                  validator: (v) => v!.isEmpty ? 'Enter a valid Email' : null,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _firstname,
                  decoration: const InputDecoration(hintText: 'First Name'),
                  validator: (v) => v!.isEmpty ? 'Enter a Name' : null,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _lastname,
                  decoration: const InputDecoration(hintText: 'Last Name'),
                  validator: (v) => v!.isEmpty ? 'Enter Last Name' : null,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _phone,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(hintText: 'Phone Number'),
                  validator: (v) => v!.isEmpty ? 'Enter Mobile Number' : null,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _passRController,
                  obscureText: true,
                  decoration: const InputDecoration(hintText: 'Password'),
                  validator: (v) => v!.isEmpty ? 'Enter a password' : null,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _onTapSignIn,
                  child: const Icon(Icons.arrow_circle_right_outlined),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignIn() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, EmailPage.name);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _firstname.dispose();
    _lastname.dispose();
    _phone.dispose();
    _passRController.dispose();
    super.dispose();
  }
}
