import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'welcome_screen.dart'; // Import the WelcomeScreen

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isLoginValid = true;

  Future<void> _login() async {
    String enteredUsername = _usernameController.text.trim();
    String enteredPassword = _passwordController.text.trim();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedUsername = prefs.getString('username');
    String? storedPassword = prefs.getString('password');

    if (enteredUsername == storedUsername && enteredPassword == storedPassword) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => WelcomeScreen(username: enteredUsername),
        ),
      );
    } else {
      setState(() {
        isLoginValid = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid username or password'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.red.shade900,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView( // Prevent overflow on smaller screens
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Add the logo at the top
                Image.asset(
                  'assets/images/Mylogo.png', // Ensure this path matches your asset
                  height: 150, // Adjust height as needed
                ),
                const SizedBox(height: 20), // Space between logo and title

                // Title for the Login page
                Text(
                  'Formula 1 Trivia App',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade900,
                  ),
                ),
                const SizedBox(height: 40), // Space between title and input fields

                // Input fields for username and password
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 40),

                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 60.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.red.shade900,
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/createAccount');
                  },
                  child: Text(
                    'Don’t have an account? Create one',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red.shade900,
                    ),
                  ),
                ),
                if (!isLoginValid)
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Invalid username or password',
                      style: TextStyle(color: Colors.red),
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
