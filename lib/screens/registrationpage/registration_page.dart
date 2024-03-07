/*import 'package:flutter/material.dart';
import 'package:session3/util/validators.dart';
import 'package:session3/widgets/input_field.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  'Enter your data',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                InputField(
                  controller: _userNameController,
                  hintText: 'Enter your username',
                  prefix: const Icon(Icons.person),
                  validator: (String? input) => Validators.checkLengthValidator(input, 7),
                ),
                const SizedBox(height: 10),
                InputField(
                    controller: _firstNameController,
                    hintText: 'Enter your first name',
                    prefix: Icon(Icons.person),
                    validator: (String? input) => Validators.checkLengthValidator(input, 7)),
                const SizedBox(height: 10),
                InputField(
                    controller: _lastNameController,
                    hintText: 'Enter your last name',
                    prefix: Icon(Icons.person),
                    validator: (String? input) => Validators.checkLengthValidator(input, 7)),
                const SizedBox(height: 10),
                InputField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Enter your email',
                    prefix: Icon(Icons.alternate_email),
                    validator: (String? input) => Validators.emailValidator(input)),
                const SizedBox(height: 10),
                InputField(
                    controller: _passwordController,
                    obscureText: true,
                    hintText: 'Enter your password',
                    prefix: Icon(Icons.lock),
                    validator: (String? input) => Validators.passwordValidator(input)),
                const SizedBox(height: 10),
                InputField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    hintText: 'Confirm your password',
                    prefix: Icon(Icons.lock),
                    validator: (String? input) => Validators.confirmPasswordValidator(_passwordController.text, input)),
                const SizedBox(height: 20),
                ElevatedButton(onPressed: _register, child: Text('Register')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _register() {
    if (_formKey.currentState?.validate() ?? false) {
      debugPrint(_userNameController.text);
    }
  }
}*/
