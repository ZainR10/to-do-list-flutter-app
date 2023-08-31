import 'package:flutter/material.dart';
import 'add_task_list.dart';
import 'todo_initial_screen.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // TextEditingController userNameController = TextEditingControlLogin
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
                  'Login',
                  style: TextStyle(fontSize: 50),
                ),
                SizedBox(
                  height: 50,
                ),
                // TextFormField(
                //   controller: userNameController,
                //   validator: (String? value) {
                //     if (value == null || value.isEmpty) {
                //       return "Name field cannot be empty";
                //     }
                //     return null;
                //   },
                //   decoration: const InputDecoration(
                //     // suffix: Icon(Icons.remove_red_eye),
                //     border: OutlineInputBorder(),
                //     labelText: 'Enter your name',
                //   ),
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
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
                  child: const Text("Login"),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an Account? ",
                      style: TextStyle(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Sign Up",
                          style: TextStyle(
                            color: Colors.blue, // Customize the color
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
