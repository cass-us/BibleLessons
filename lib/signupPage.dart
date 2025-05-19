import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  // State variables
  bool _isChristian = false;
  String? _selectedChurch;
  final List<String> _churches = [
    'St. John\'s Church',
    'Grace Chapel',
    'Faith Community',
    'None',
  ];

  @override
  void initState() {
    super.initState();
    // Hardcoded location value
    _locationController.text = 'Johannesburg, South Africa';
  }

  @override
  void dispose() {
    // Dispose controllers when the widget is removed
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _ageController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform sign-up logic here
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text('Sign Up Successful'),
              content: const Text('Your account has been created.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            ),
      );
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    // Simple email validation
    if (!value.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  String? _validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your age';
    }
    final age = int.tryParse(value);
    if (age == null || age <= 0) {
      return 'Please enter a valid age';
    }
    return null;
  }

  String? _validateChurch(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a church';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Email
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                validator: _validateEmail,
              ),
              const SizedBox(height: 15),
              // Password
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
                validator: _validatePassword,
              ),
              const SizedBox(height: 15),
              // Confirm Password
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
                validator: _validateConfirmPassword,
              ),
              const SizedBox(height: 15),
              // Age
              TextFormField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Age',
                  prefixIcon: Icon(Icons.cake),
                  border: OutlineInputBorder(),
                ),
                validator: _validateAge,
              ),
              const SizedBox(height: 15),
              // Christian Checkbox
              CheckboxListTile(
                title: const Text('I am a Christian or believer'),
                value: _isChristian,
                onChanged: (bool? value) {
                  setState(() {
                    _isChristian = value ?? false;
                  });
                },
              ),
              const SizedBox(height: 15),
              // Church Dropdown
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Select Church',
                  prefixIcon: Icon(Icons.church),
                  border: OutlineInputBorder(),
                ),
                value: _selectedChurch,
                items:
                    _churches.map((String church) {
                      return DropdownMenuItem<String>(
                        value: church,
                        child: Text(church),
                      );
                    }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedChurch = newValue;
                  });
                },
                validator: _validateChurch,
              ),
              const SizedBox(height: 15),
              // Location (Read-only)
              TextFormField(
                controller: _locationController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Location',
                  prefixIcon: Icon(Icons.location_on),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 25),
              // Sign Up Button
              ElevatedButton.icon(
                onPressed: _submitForm,
                icon: const Icon(Icons.person_add),
                label: const Text('Sign Up'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 213, 92, 84),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
