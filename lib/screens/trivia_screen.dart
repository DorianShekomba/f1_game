import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TriviaScreen extends StatefulWidget {
  const TriviaScreen({super.key});

  @override
  _TriviaScreenState createState() => _TriviaScreenState();
}

class _TriviaScreenState extends State<TriviaScreen> {
final List<Map<String, Object>> _questions = [
  {
    'questionText': 'Which team did Michael Schumacher drive for when he won his 7th world title?',
    'answers': ['Ferrari', 'McLaren', 'Mercedes', 'Williams'],
    'correctAnswer': 'Ferrari',
    'imagePath': 'assets/images/1.jpg',
  },
  {
    'questionText': 'Who holds the record for the fastest lap in Formula 1?',
    'answers': ['Ayrton Senna', 'Lewis Hamilton', 'Valtteri Bottas', 'Max Verstappen'],
    'correctAnswer': 'Valtteri Bottas',
    'imagePath': 'assets/images/2.jpg',
  },
  {
    'questionText': 'Which driver won his first Formula 1 World Championship in 2005?',
    'answers': ['Fernando Alonso', 'Kimi Räikkönen', 'Sebastian Vettel', 'Lewis Hamilton'],
    'correctAnswer': 'Fernando Alonso',
    'imagePath': 'assets/images/3.jpg',
  },
  {
    'questionText': 'Which team won the first-ever Formula 1 Constructors’ Championship in 1958?',
    'answers': ['Ferrari', 'Vanwall', 'Lotus', 'Alfa Romeo'],
    'correctAnswer': 'Vanwall',
    'imagePath': 'assets/images/4.jpg',
  },
  {
    'questionText': 'Which driver holds the record for the most consecutive points finishes?',
    'answers': ['Lewis Hamilton', 'Michael Schumacher', 'Sebastian Vettel', 'Kimi Räikkönen'],
    'correctAnswer': 'Lewis Hamilton',
    'imagePath': 'assets/images/5.jpg',
  },
  {
    'questionText': 'Which circuit is considered the fastest in Formula 1 history?',
    'answers': ['Monza', 'Silverstone', 'Spa-Francorchamps', 'Nürburgring'],
    'correctAnswer': 'Monza',
    'imagePath': 'assets/images/6.jpg',
  },
  {
    'questionText': 'Who won the last Formula 1 Grand Prix of the 2021 season in Abu Dhabi?',
    'answers': ['Lewis Hamilton', 'Max Verstappen', 'Sergio Perez', 'Valtteri Bottas'],
    'correctAnswer': 'Max Verstappen',
    'imagePath': 'assets/images/7.jpg',
  },
  {
    'questionText': 'Which driver famously missed out on the 2008 World Championship by one point?',
    'answers': ['Felipe Massa', 'Lewis Hamilton', 'Kimi Räikkönen', 'Fernando Alonso'],
    'correctAnswer': 'Felipe Massa',
    'imagePath': 'assets/images/8.jpg',
  },
  {
    'questionText': 'Which driver won the Formula 1 World Championship in 1996?',
    'answers': ['Damon Hill', 'Michael Schumacher', 'Jacques Villeneuve', 'Mika Häkkinen'],
    'correctAnswer': 'Damon Hill',
    'imagePath': 'assets/images/9.jpg',
  },
  {
    'questionText': 'Which team was the first to win a Formula 1 race using hybrid technology?',
    'answers': ['Mercedes', 'Ferrari', 'McLaren', 'Williams'],
    'correctAnswer': 'Mercedes',
    'imagePath': 'assets/images/10.jpg',
  },
  {
    'questionText': 'Who was the last driver to win a World Championship for Ferrari?',
    'answers': ['Kimi Räikkönen', 'Sebastian Vettel', 'Fernando Alonso', 'Michael Schumacher'],
    'correctAnswer': 'Kimi Räikkönen',
    'imagePath': 'assets/images/11.jpg',
  },
  {
    'questionText': 'What year did Jenson Button win the Formula 1 World Championship?',
    'answers': ['2009', '2007', '2010', '2008'],
    'correctAnswer': '2009',
    'imagePath': 'assets/images/12.jpg',
  },
  {
    'questionText': 'Which driver holds the record for the most race wins in a single Formula 1 season?',
    'answers': ['Lewis Hamilton', 'Sebastian Vettel', 'Michael Schumacher', 'Max Verstappen'],
    'correctAnswer': 'Max Verstappen',
    'imagePath': 'assets/images/13.jpg',
  },
  {
    'questionText': 'Which driver won the 1997 Formula 1 World Championship?',
    'answers': ['Jacques Villeneuve', 'Michael Schumacher', 'Mika Häkkinen', 'Damon Hill'],
    'correctAnswer': 'Jacques Villeneuve',
    'imagePath': 'assets/images/14.jpg',
  },
  {
    'questionText': 'Which circuit is known for its famous “Wall of Champions”?',
    'answers': ['Circuit Gilles Villeneuve', 'Monza', 'Silverstone', 'Suzuka'],
    'correctAnswer': 'Circuit Gilles Villeneuve',
    'imagePath': 'assets/images/15.jpg',
  },
  {
    'questionText': 'Who is the youngest Formula 1 driver to start a race?',
    'answers': ['Max Verstappen', 'Lando Norris', 'Sebastian Vettel', 'Charles Leclerc'],
    'correctAnswer': 'Max Verstappen',
    'imagePath': 'assets/images/16.jpg',
  },
  {
    'questionText': 'Who won the 2017 and 2018 Formula 1 World Championships?',
    'answers': ['Lewis Hamilton', 'Sebastian Vettel', 'Nico Rosberg', 'Valtteri Bottas'],
    'correctAnswer': 'Lewis Hamilton',
    'imagePath': 'assets/images/17.jpg',
  },
  {
    'questionText': 'Which driver won the Monaco Grand Prix six times?',
    'answers': ['Ayrton Senna', 'Lewis Hamilton', 'Michael Schumacher', 'Sebastian Vettel'],
    'correctAnswer': 'Ayrton Senna',
    'imagePath': 'assets/images/18.jpg',
  },
  {
    'questionText': 'Which team introduced the “double diffuser” in 2009?',
    'answers': ['Brawn GP', 'Red Bull Racing', 'Ferrari', 'McLaren'],
    'correctAnswer': 'Brawn GP',
    'imagePath': 'assets/images/19.jpg',
  },
  {
    'questionText': 'What is the length of the longest circuit on the Formula 1 calendar?',
    'answers': ['7.004 km', '5.848 km', '6.004 km', '6.948 km'],
    'correctAnswer': '7.004 km',
    'imagePath': 'assets/images/20.jpg',
  },
  {
    'questionText': 'Which driver won the Formula 1 World Championship in 2006?',
    'answers': ['Fernando Alonso', 'Kimi Räikkönen', 'Michael Schumacher', 'Jenson Button'],
    'correctAnswer': 'Fernando Alonso',
    'imagePath': 'assets/images/21.jpg',
  },
  {
    'questionText': 'Which circuit has the highest average speed?',
    'answers': ['Monza', 'Spa-Francorchamps', 'Silverstone', 'Suzuka'],
    'correctAnswer': 'Monza',
    'imagePath': 'assets/images/22.jpg',
  },
  {
    'questionText': 'Which team did Lewis Hamilton join in 2013?',
    'answers': ['Mercedes', 'McLaren', 'Ferrari', 'Red Bull Racing'],
    'correctAnswer': 'Mercedes',
    'imagePath': 'assets/images/23.jpg',
  },
  {
    'questionText': 'Which driver holds the record for the most consecutive podium finishes?',
    'answers': ['Lewis Hamilton', 'Michael Schumacher', 'Sebastian Vettel', 'Ayrton Senna'],
    'correctAnswer': 'Lewis Hamilton',
    'imagePath': 'assets/images/24.jpg',
  },
  {
    'questionText': 'Who won the Formula 1 World Championship in 1998 and 1999?',
    'answers': ['Mika Häkkinen', 'Michael Schumacher', 'Jacques Villeneuve', 'Damon Hill'],
    'correctAnswer': 'Mika Häkkinen',
    'imagePath': 'assets/images/25.jpg',
  },
  {
    'questionText': 'What year did Ferrari win their last Constructors’ Championship?',
    'answers': ['2008', '2007', '2010', '2012'],
    'correctAnswer': '2008',
    'imagePath': 'assets/images/26.jpg',
  },
  {
    'questionText': 'Which Formula 1 team did Niki Lauda help lead to dominance in the hybrid era?',
    'answers': ['Mercedes', 'Red Bull Racing', 'Ferrari', 'McLaren'],
    'correctAnswer': 'Mercedes',
    'imagePath': 'assets/images/27.jpg',
  },
  {
    'questionText': 'Which driver set the record for the most Grand Prix starts?',
    'answers': ['Fernando Alonso', 'Kimi Räikkönen', 'Rubens Barrichello', 'Lewis Hamilton'],
    'correctAnswer': 'Fernando Alonso',
    'imagePath': 'assets/images/28.jpg',
  },
  {
    'questionText': 'Who won the most races in the 2022 Formula 1 season?',
    'answers': ['Max Verstappen', 'Lewis Hamilton', 'Charles Leclerc', 'Sergio Perez'],
    'correctAnswer': 'Max Verstappen',
    'imagePath': 'assets/images/29.jpg',
  },
  {
    'questionText': 'Which country hosts the Canadian Grand Prix?',
    'answers': ['USA', 'Canada', 'Mexico', 'Brazil'],
    'correctAnswer': 'Canada',
    'imagePath': 'assets/images/30.jpg',
  },
];

int _currentQuestionIndex = 0;
  int _score = 0;
  int _highScore = 0;

  @override
  void initState() {
    super.initState();
    _loadHighScore(); // Load the high score when the app starts
  }

  Future<void> _loadHighScore() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? storedHighScore = prefs.getInt('highScore');
      if (storedHighScore == null) {
        print("No high score found. Starting at 0.");
      } else {
        print("Loaded high score: $storedHighScore");
      }
      setState(() {
        _highScore = storedHighScore ?? 0;
      });
    } catch (e) {
      print("Error loading high score: $e");
    }
  }

  Future<void> _saveHighScore() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('highScore', _highScore);
      print("High score saved: $_highScore");
    } catch (e) {
      print("Error saving high score: $e");
    }
  }

  void _checkAndSaveHighScore() {
    if (_score > _highScore) {
      setState(() {
        _highScore = _score;
      });
      _saveHighScore();
      print("New high score set: $_highScore");
    } else {
      print("High score not beaten. Current high score: $_highScore");
    }
  }

  void _answerQuestion(String answer) {
    if (answer == _questions[_currentQuestionIndex]['correctAnswer']) {
      setState(() {
        _score++;
      });
    }

    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        _showScoreDialog();
      }
    });
  }

  void _showScoreDialog() async {
    String resultMessage;
    int passingScore = 20;

    if (_score >= passingScore) {
      resultMessage = "Congratulations! You've passed Level 1!";
      await _saveScore('level1Score', _score);
      _checkAndSaveHighScore();
      await _unlockNextLevel();

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Quiz Finished!', style: TextStyle(color: Colors.red.shade900)),
          content: Text(
            '$resultMessage\nYour score is: $_score / ${_questions.length}\nHigh Score: $_highScore',
            style: const TextStyle(color: Colors.black),
          ),
          actions: [
            TextButton(
              child: Text('Next Level', style: TextStyle(color: Colors.red.shade900)),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacementNamed(context, '/level2');
              },
            ),
          ],
        ),
      );
    } else {
      resultMessage = "You need to score at least $passingScore to pass.";

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Quiz Finished!', style: TextStyle(color: Colors.red.shade900)),
          content: Text(
            '$resultMessage\nYour score is: $_score / ${_questions.length}\nHigh Score: $_highScore',
            style: const TextStyle(color: Colors.black),
          ),
          actions: [
            TextButton(
              child: Text('Try Again', style: TextStyle(color: Colors.red.shade900)),
              onPressed: () {
                Navigator.of(context).pop();
                _resetQuiz();
              },
            ),
            TextButton(
              child: Text('Go to Home', style: TextStyle(color: Colors.red.shade900)),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    }
  }

  Future<void> _saveScore(String levelKey, int score) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(levelKey, score);
    print("$levelKey score saved: $score");
  }

  Future<void> _unlockNextLevel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('level2Unlocked', true);
    print("Level 2 unlocked");
  }

  void _resetQuiz() {
    setState(() {
      _score = 0;
      _currentQuestionIndex = 0;
    });
    print("Quiz reset. Score: $_score, Question index: $_currentQuestionIndex");
  }

@override
Widget build(BuildContext context) {
  final String? imagePath = _questions[_currentQuestionIndex]['imagePath'] as String?;

  return Scaffold(
    appBar: AppBar(
      title: const Text('Formula 1 Trivia - Level 1'),
      backgroundColor: Colors.red.shade900,
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Display the image related to the current question if imagePath is not null
          if (imagePath != null)
            Image.asset(
              imagePath,
              height: 150,  // Limit the height for better fit
              width: double.infinity,  // Use the full width of the screen
              fit: BoxFit.contain,  // Adjust the fit to maintain aspect ratio
            )
          else
            const SizedBox.shrink(), // If imagePath is null, show nothing

          const SizedBox(height: 20),

          // Display the current question
          Text(
            _questions[_currentQuestionIndex]['questionText'] as String,
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),

          // Display the possible answers
          ...(_questions[_currentQuestionIndex]['answers'] as List<String>).map((answer) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                child: Text(answer),
                onPressed: () => _answerQuestion(answer),
              ),
            );
          }),

          const Spacer(),

          // Display the current score and high score
          Text(
            'Score: $_score',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          Text(
            'High Score: $_highScore',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: _resetQuiz,
      backgroundColor: Colors.red.shade900,
      child: const Icon(Icons.refresh),
    ),
  );
}
}