

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:food_recipe_app/pages/loginscreen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String name = '';
  String password = '';
  String email = '';
  bool _obscurePassword = true;
  bool _obscureRePassword = true;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordsController = TextEditingController();
  final _repasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Here"),
        titleTextStyle: const TextStyle(
          color: Color.fromARGB(255, 64, 154, 165),
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Center(
        child: _buildForm(),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Username"),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Enter Name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: 'Email Address'),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "Email cannot be empty";
                  }
                  final regex = RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$");
                  if (!regex.hasMatch(text)) {
                    return "Invalid email format";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _passwordsController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "Password cannot be empty";
                  }
                  final regex = RegExp(
                      r"^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*\W)(?!.* ).{8,16}$");
                  if (!regex.hasMatch(text)) {
                    return "Invalid password format";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _repasswordController,
                obscureText: _obscureRePassword,
                decoration: InputDecoration(
                  labelText: 'Re-enter Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureRePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureRePassword = !_obscureRePassword;
                      });
                    },
                  ),
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "Re-enter password cannot be empty";
                  }
                  if (_passwordsController.text != text) {
                    return "Passwords do not match";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: validateForm,
                child: const Text("Sign Up"),
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: const TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.none,
                  ),
                  children: [
                    TextSpan(
                      text: 'Sign in',
                      style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.none,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const MyLoginScreen()),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> validateForm() async {
    final form = _formKey.currentState;
    if (form?.validate() == true) {
      try {
        // Firebase Authentication logic
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordsController.text.trim(),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration Successful')),
        );

        // Navigate to Login Screen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MyLoginScreen()),
        );
      } catch (e) {
        // Display error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    }
  }
}
