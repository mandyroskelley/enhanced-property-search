import 'package:flutter/material.dart';

class CreateClientAccountScreen extends StatefulWidget {
  @override
  _CreateClientAccountScreenState createState() => _CreateClientAccountScreenState();
}

class _CreateClientAccountScreenState extends State<CreateClientAccountScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController(); // Optional for email

  void _createAccount() {
    String username = _usernameController.text;
    String password = _passwordController.text;
    String email = _emailController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      // Here you would normally save the account to a database or cloud storage
      // For now, we can just display a confirmation message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Account for $username created successfully!"),
      ));

      // You can navigate back to the login screen, or directly to the home page if you want
      Navigator.pop(context);  // Go back to AgentLoginScreen
    } else {
      // Show an error message if fields are empty
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please fill in both username and password"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Agent Account")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: "Username"),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true, // Make the password field obscure
                decoration: InputDecoration(labelText: "Password"),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _emailController,  // Optional field for email
                decoration: InputDecoration(labelText: "Email (Optional)"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _createAccount,
                child: Text("Create Account"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
