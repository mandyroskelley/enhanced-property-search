import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'choose_role_screen.dart'; // Import the choose_role_screen.dart file

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _url = 'https://buyahomecolorado.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search For Homes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Navigate back to choose_role_screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ChooseRoleScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: const WebView(
        initialUrl: 'https://buyahomecolorado.com',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
