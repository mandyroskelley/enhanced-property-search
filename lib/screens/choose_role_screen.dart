import 'package:flutter/material.dart';
import 'agent_login_screen.dart';
import 'client_login_screen.dart';

class ChooseRoleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Role")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => AgentLoginScreen()));
              },
              child: Text("Agent"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => ClientLoginScreen()));
              },
              child: Text("Client"),
            ),
          ],
        ),
      ),
    );
  }
}
