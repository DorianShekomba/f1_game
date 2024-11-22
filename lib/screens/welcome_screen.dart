import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'trivia_screen.dart';
import 'trivia_screen2.dart';
import 'trivia_screen3.dart';
import 'trivia_screen4.dart';

class WelcomeScreen extends StatefulWidget {
  final String username;

  const WelcomeScreen({super.key, required this.username});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool level2Unlocked = false;
  bool level3Unlocked = false;
  bool level4Unlocked = false;
  int totalScore = 0; // Track the total score

  @override
  void initState() {
    super.initState();
    _loadLevelUnlocks(); // Load level unlocks when the app starts
    _loadTotalScore();   // Load the total score when the app starts
  }

  Future<void> _loadLevelUnlocks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      level2Unlocked = prefs.getBool('level2Unlocked') ?? false;
      level3Unlocked = prefs.getBool('level3Unlocked') ?? false;
      level4Unlocked = prefs.getBool('level4Unlocked') ?? false;
    });
  }

  // Load the total score from all levels
  Future<void> _loadTotalScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int level1Score = prefs.getInt('level1HighScore') ?? 0;
    int level2Score = prefs.getInt('level2HighScore') ?? 0;
    int level3Score = prefs.getInt('level3HighScore') ?? 0;
    int level4Score = prefs.getInt('level4HighScore') ?? 0;

    setState(() {
      totalScore = level1Score + level2Score + level3Score + level4Score;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        backgroundColor: Colors.red.shade900,
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to Formula 1 Trivia, ${widget.username}!',
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  'Your total score: $totalScore / 120',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                // Button for Level 1
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TriviaScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade900,
                  ),
                  child: const Text('Start Level 1'),
                ),

                // Button for Level 2 (only enabled if unlocked)
                ElevatedButton(
                  onPressed: level2Unlocked
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TriviaScreen2()),
                          );
                        }
                      : null, // Disable if Level 2 is locked
                  style: ElevatedButton.styleFrom(
                    backgroundColor: level2Unlocked ? Colors.red.shade900 : Colors.grey,
                  ),
                  child: const Text('Start Level 2'),
                ),

                // Button for Level 3
                ElevatedButton(
                  onPressed: level3Unlocked
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TriviaScreen3()),
                          );
                        }
                      : null, // Disable if level 3 is locked
                  style: ElevatedButton.styleFrom(
                    backgroundColor: level3Unlocked ? Colors.red.shade900 : Colors.grey,
                  ),
                  child: const Text('Start Level 3'),
                ),

                // Button for Level 4
                ElevatedButton(
                  onPressed: level4Unlocked
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TriviaScreen4()),
                          );
                        }
                      : null, // Disable if level 4 is locked
                  style: ElevatedButton.styleFrom(
                    backgroundColor: level4Unlocked ? Colors.red.shade900 : Colors.grey,
                  ),
                  child: const Text('Start Level 4'),
                ),
                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () => _logout(context), // Call the logout function
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade900,
                  ),
                  child: const Text('Logout'),
                ),
              ],
            ),
          ),

          // Positioned text for "Logged in as"
          Positioned(
            top: 16,
            right: 16,
            child: Text(
              'Logged in as: ${widget.username}',
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushReplacementNamed(context, '/login');
  }
}
