import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TriviaScreen2 extends StatefulWidget {
  const TriviaScreen2({super.key});

  @override
  _TriviaScreen2State createState() => _TriviaScreen2State();
}

class _TriviaScreen2State extends State<TriviaScreen2> {
  int _score = 0; // Score tracking
  int _highScore = 0; // High score tracking
  int _currentQuestionIndex = 0;

  // Example questions (replace these with your actual questions)
final List<Map<String, Object>> _questions = [
  {
    'questionText': 'Which team introduced the F-duct system in 2010?',
    'answers': ['McLaren', 'Ferrari', 'Red Bull Racing', 'Mercedes'],
    'correctAnswer': 'McLaren',
    'imagePath': 'assets/images/31.jpg',
  },
  {
    'questionText': 'Who won the 1999 Formula 1 World Championship?',
    'answers': ['Mika Häkkinen', 'Michael Schumacher', 'David Coulthard', 'Eddie Irvine'],
    'correctAnswer': 'Mika Häkkinen',
    'imagePath': 'assets/images/32.jpg',
  },
  {
    'questionText': 'Which driver won the 1988 Japanese Grand Prix to secure his first World Championship?',
    'answers': ['Ayrton Senna', 'Alain Prost', 'Nigel Mansell', 'Nelson Piquet'],
    'correctAnswer': 'Ayrton Senna',
    'imagePath': 'assets/images/33.jpg',
  },
  {
    'questionText': 'Which engine supplier powered Red Bull Racing to their first Constructors’ Championship?',
    'answers': ['Renault', 'Ferrari', 'Honda', 'Mercedes'],
    'correctAnswer': 'Renault',
    'imagePath': 'assets/images/34.jpg',
  },
  {
    'questionText': 'Which driver holds the record for the most Grand Slam races (pole, win, fastest lap, led every lap)?',
    'answers': ['Jim Clark', 'Lewis Hamilton', 'Ayrton Senna', 'Michael Schumacher'],
    'correctAnswer': 'Jim Clark',
    'imagePath': 'assets/images/35.jpg',
  },
  {
    'questionText': 'Who won the last race of the 2020 Formula 1 season?',
    'answers': ['Max Verstappen', 'Lewis Hamilton', 'Valtteri Bottas', 'Sergio Perez'],
    'correctAnswer': 'Max Verstappen',
    'imagePath': 'assets/images/36.jpg',
  },
  {
    'questionText': 'Which team did Alain Prost drive for during his final F1 season in 1993?',
    'answers': ['Williams', 'McLaren', 'Ferrari', 'Lotus'],
    'correctAnswer': 'Williams',
    'imagePath': 'assets/images/37.jpg',
  },
  {
    'questionText': 'Who won the 2008 Formula 1 World Championship in a dramatic final lap?',
    'answers': ['Lewis Hamilton', 'Felipe Massa', 'Kimi Räikkönen', 'Fernando Alonso'],
    'correctAnswer': 'Lewis Hamilton',
    'imagePath': 'assets/images/38.jpg',
  },
  {
    'questionText': 'Which driver replaced Ayrton Senna at Williams after his tragic death in 1994?',
    'answers': ['David Coulthard', 'Nigel Mansell', 'Damon Hill', 'Jacques Villeneuve'],
    'correctAnswer': 'David Coulthard',
    'imagePath': 'assets/images/39.jpg',
  },
  {
    'questionText': 'Which team used a double diffuser to great effect during the 2009 season?',
    'answers': ['Brawn GP', 'Ferrari', 'Red Bull Racing', 'McLaren'],
    'correctAnswer': 'Brawn GP',
    'imagePath': 'assets/images/40.jpg',
  },
  {
    'questionText': 'Which driver has won the most Hungarian Grand Prix races?',
    'answers': ['Lewis Hamilton', 'Michael Schumacher', 'Ayrton Senna', 'Max Verstappen'],
    'correctAnswer': 'Lewis Hamilton',
    'imagePath': 'assets/images/41.jpg',
  },
  {
    'questionText': 'Which team did Jenson Button drive for when he won the 2009 Formula 1 World Championship?',
    'answers': ['Brawn GP', 'McLaren', 'Williams', 'Ferrari'],
    'correctAnswer': 'Brawn GP',
    'imagePath': 'assets/images/42.jpg',
  },
  {
    'questionText': 'Which driver famously crashed on purpose in the 2008 Singapore Grand Prix?',
    'answers': ['Nelson Piquet Jr.', 'Felipe Massa', 'Lewis Hamilton', 'Fernando Alonso'],
    'correctAnswer': 'Nelson Piquet Jr.',
    'imagePath': 'assets/images/43.jpg',
  },
  {
    'questionText': 'Who won the first-ever Formula 1 race held at the Circuit of the Americas in 2012?',
    'answers': ['Lewis Hamilton', 'Sebastian Vettel', 'Fernando Alonso', 'Mark Webber'],
    'correctAnswer': 'Lewis Hamilton',
    'imagePath': 'assets/images/44.jpg',
  },
  {
    'questionText': 'Which driver earned the nickname "The Professor" due to his methodical driving style?',
    'answers': ['Alain Prost', 'Niki Lauda', 'Nigel Mansell', 'Jackie Stewart'],
    'correctAnswer': 'Alain Prost',
    'imagePath': 'assets/images/45.jpg',
  },
  {
    'questionText': 'Who won the first Formula 1 World Championship in 1950?',
    'answers': ['Juan Manuel Fangio', 'Giuseppe Farina', 'Alberto Ascari', 'Stirling Moss'],
    'correctAnswer': 'Giuseppe Farina',
    'imagePath': 'assets/images/46.jpg',
  },
  {
    'questionText': 'Which team holds the record for the most Constructors’ Championships?',
    'answers': ['Ferrari', 'Mercedes', 'McLaren', 'Red Bull Racing'],
    'correctAnswer': 'Ferrari',
    'imagePath': 'assets/images/47.jpg',
  },
  {
    'questionText': 'Which driver holds the record for the most pole positions in Formula 1 history?',
    'answers': ['Lewis Hamilton', 'Ayrton Senna', 'Sebastian Vettel', 'Michael Schumacher'],
    'correctAnswer': 'Lewis Hamilton',
    'imagePath': 'assets/images/48.jpg',
  },
  {
    'questionText': 'Who won the rain-soaked 2007 Japanese Grand Prix at Fuji Speedway?',
    'answers': ['Lewis Hamilton', 'Kimi Räikkönen', 'Fernando Alonso', 'Felipe Massa'],
    'correctAnswer': 'Lewis Hamilton',
    'imagePath': 'assets/images/49.jpg',
  },
  {
    'questionText': 'Which driver has the most second-place finishes in Formula 1 history?',
    'answers': ['Lewis Hamilton', 'Michael Schumacher', 'Sebastian Vettel', 'Ayrton Senna'],
    'correctAnswer': 'Lewis Hamilton',
    'imagePath': 'assets/images/50.jpg',
  },
  {
    'questionText': 'Which driver holds the record for the most consecutive race wins?',
    'answers': ['Sebastian Vettel', 'Michael Schumacher', 'Lewis Hamilton', 'Nico Rosberg'],
    'correctAnswer': 'Sebastian Vettel',
    'imagePath': 'assets/images/51.jpg',
  },
  {
    'questionText': 'Which driver won his first World Championship in 2016, then immediately retired?',
    'answers': ['Nico Rosberg', 'Lewis Hamilton', 'Sebastian Vettel', 'Fernando Alonso'],
    'correctAnswer': 'Nico Rosberg',
    'imagePath': 'assets/images/52.jpg',
  },
  {
    'questionText': 'Which team achieved the first turbocharged victory in Formula 1?',
    'answers': ['Renault', 'Ferrari', 'McLaren', 'Lotus'],
    'correctAnswer': 'Renault',
    'imagePath': 'assets/images/53.jpg',
  },
  {
    'questionText': 'In 1988, McLaren won all but one race. Which team won the other race?',
    'answers': ['Ferrari', 'Williams', 'Benetton', 'Lotus'],
    'correctAnswer': 'Ferrari',
    'imagePath': 'assets/images/54.jpg',
  },
  {
    'questionText': 'Which driver became the first to score points for Force India at the 2009 Belgian Grand Prix?',
    'answers': ['Giancarlo Fisichella', 'Adrian Sutil', 'Paul di Resta', 'Sergio Perez'],
    'correctAnswer': 'Giancarlo Fisichella',
    'imagePath': 'assets/images/55.jpg',
  },
  {
    'questionText': 'Which circuit features the famous "Eau Rouge" corner?',
    'answers': ['Spa-Francorchamps', 'Silverstone', 'Suzuka', 'Monza'],
    'correctAnswer': 'Spa-Francorchamps',
    'imagePath': 'assets/images/56.jpg',
  },
  {
    'questionText': 'Which driver survived a terrifying crash at the 2020 Bahrain Grand Prix, escaping from a burning car?',
    'answers': ['Romain Grosjean', 'Kevin Magnussen', 'Esteban Ocon', 'Nico Hülkenberg'],
    'correctAnswer': 'Romain Grosjean',
    'imagePath': 'assets/images/57.jpg',
  },
  {
    'questionText': 'In what year was the halo safety device introduced to Formula 1?',
    'answers': ['2018', '2017', '2019', '2016'],
    'correctAnswer': '2018',
    'imagePath': 'assets/images/58.jpg',
  },
];



  @override
  void initState() {
    super.initState();
    _loadHighScore(); // Load high score when the screen starts
  }

  // Load high score from SharedPreferences
  Future<void> _loadHighScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _highScore = prefs.getInt('highScoreLevel2') ?? 0; // Load the high score for Level 2
    });
  }

  // Save high score to SharedPreferences
  Future<void> _saveHighScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('highScoreLevel2', _highScore);
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
    bool isPassed = _score >= 20; // Modify passing score threshold as needed

    if (isPassed) {
      // Save the score for Level 2
      await _saveScore('level2Score', _score);

      // Check if the current score is higher than the high score and update if needed
      if (_score > _highScore) {
        setState(() {
          _highScore = _score; // Update high score in memory
        });
        await _saveHighScore(); // Save the new high score to SharedPreferences
      }

      // Unlock Level 3
      await _unlockNextLevel();
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text('Level 2 Finished!', style: TextStyle(color: Colors.red.shade900)),
        content: Text(
          'Your score is: $_score / ${_questions.length}\n${isPassed ? 'Level 3 Unlocked!' : 'You did not pass. Try again!'}',
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            child: Text(isPassed ? 'Next Level' : 'Retry', style: TextStyle(color: Colors.red.shade900)),
            onPressed: () {
              Navigator.of(context).pop();
              if (isPassed) {
                Navigator.pushReplacementNamed(context, '/level3'); // Navigate to Level 3
              } else {
                _resetQuiz();
              }
            },
          ),
        ],
      ),
    );
  }

  // Save the score for the current level
  Future<void> _saveScore(String levelKey, int score) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(levelKey, score);
  }

  // Unlock the next level (Level 3)
  Future<void> _unlockNextLevel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('level3Unlocked', true); // Unlock Level 3
  }

  void _resetQuiz() {
    setState(() {
      _score = 0;
      _currentQuestionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Level 2 Trivia'),
        backgroundColor: Colors.red.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              _questions[_currentQuestionIndex]['questionText'] as String,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
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
    );
  }
}
