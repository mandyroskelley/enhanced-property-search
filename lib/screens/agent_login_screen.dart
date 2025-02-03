import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'search_screen.dart';

class AgentLoginScreen extends StatefulWidget {
  @override
  _AgentLoginScreenState createState() => _AgentLoginScreenState();
}

class _AgentLoginScreenState extends State<AgentLoginScreen> {
  final TextEditingController _controller = TextEditingController();

  void _login() async {
    String username = _controller.text;

    if (username.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true); // Save login status
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SearchScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Agent Login")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(labelText: "Username"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: Text("Login as Agent"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
