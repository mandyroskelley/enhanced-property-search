import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'choose_role_screen.dart';
import 'search_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _logoAnimation;
  late Animation<double> _textAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller for both animations
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    // Define animations for logo and text
    _logoAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticInOut),
    );
    _textAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    // Start the animation controller
    _controller.forward();

    // After animation is completed, check the login status
    _checkLoginStatus();
  }

  // Check if user is logged in and navigate accordingly
  Future<void> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    // After animation completes, navigate based on login status
    Future.delayed(Duration(seconds: 3), () {
      if (isLoggedIn) {
        // Navigate to search page if user is logged in
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SearchScreen()));
      } else {
        // Navigate to choose role page if user is not logged in
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ChooseRoleScreen()));
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the animation controller when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor, // Use your theme's primary color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Animated Logo
            FadeTransition(
              opacity: _logoAnimation,
              child: Transform.scale(
                scale: _logoAnimation.value,
                child: Icon(
                  Icons.house, // House icon
                  size: 120,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Animated Text
            FadeTransition(
              opacity: _textAnimation,
              child: Transform.scale(
                scale: _textAnimation.value + 0.5, // Makes the text appear to grow
                child: Text(
                  "Enhanced Property Search",
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
