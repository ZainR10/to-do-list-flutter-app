import 'package:flutter/material.dart';
import 'add_task_list.dart';
import 'todo_initial_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     "Sign Up",
      //     style: TextStyle(fontFamily: 'VT323'),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Text(
                  'Create your Account',
                  style: TextStyle(fontSize: 35),
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: userNameController,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Name field cannot be empty";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    // suffix: Icon(Icons.remove_red_eye),
                    border: OutlineInputBorder(),
                    labelText: 'Enter your name',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailController,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Email field cannot be empty";
                    }
                    if (!value.contains('@') || !value.contains('.com')) {
                      return "Invalid email address";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    // suffix: Icon(Icons.remove_red_eye),
                    border: OutlineInputBorder(),
                    labelText: 'Enter your email',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Password field cannot be empty";
                    }
                    if (value.length <= 8) {
                      return "Password length must be greater than 8";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    // suffix: Icon(Icons.remove_red_eye),
                    border: OutlineInputBorder(),
                    labelText: 'Enter your password',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  style: Theme.of(context).elevatedButtonTheme.style,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AppInitialScreen(tasks: []),
                          ));
                    }
                  },
                  child: const Text("Sign Up"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
