import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TriviaScreen3 extends StatefulWidget {
  const TriviaScreen3({super.key});

  @override
  _TriviaScreen3State createState() => _TriviaScreen3State();
}

class _TriviaScreen3State extends State<TriviaScreen3> {
  int _score = 0; // Score tracking
  int _highScore = 0; // High score tracking
  int _currentQuestionIndex = 0;

final List<Map<String, Object>> _questions = [
  // 60th question
  {
    'questionText': 'Which team was disqualified from the 2007 Formula 1 Constructors’ Championship due to the "Spygate" scandal?',
    'answers': ['McLaren', 'Ferrari', 'Renault', 'Williams'],
    'correctAnswer': 'McLaren',
    'imagePath': 'assets/images/60.jpg',
  },
  {
    'questionText': 'What was the last year when Formula 1 cars were allowed to refuel during races?',
    'answers': ['2009', '2010', '2008', '2011'],
    'correctAnswer': '2009',
    'imagePath': 'assets/images/61.jpg',
  },
  {
    'questionText': 'In 1982, which team had both of its drivers tragically killed during the season?',
    'answers': ['Ferrari', 'Lotus', 'Williams', 'McLaren'],
    'correctAnswer': 'Ferrari',
    'imagePath': 'assets/images/62.jpg',
  },
  {
    'questionText': 'Which team achieved the first turbocharged victory in Formula 1?',
    'answers': ['Renault', 'Ferrari', 'McLaren', 'Lotus'],
    'correctAnswer': 'Renault',
    'imagePath': 'assets/images/63.jpg',
  },
  {
    'questionText': 'In 1994, which controversial device was banned, forcing teams to revise their car setups?',
    'answers': ['Active suspension', 'Traction control', 'Turbo engines', 'Anti-lock brakes'],
    'correctAnswer': 'Active suspension',
    'imagePath': 'assets/images/64.jpg',
  },
  {
    'questionText': 'Which driver was famously stripped of his victory at the 1982 Brazilian Grand Prix for running underweight?',
    'answers': ['Nelson Piquet', 'Alain Prost', 'Nigel Mansell', 'Keke Rosberg'],
    'correctAnswer': 'Nelson Piquet',
    'imagePath': 'assets/images/65.jpg',
  },
  {
    'questionText': 'In 1997, which driver was disqualified from the entire World Championship after colliding with Jacques Villeneuve?',
    'answers': ['Michael Schumacher', 'Damon Hill', 'Mika Häkkinen', 'David Coulthard'],
    'correctAnswer': 'Michael Schumacher',
    'imagePath': 'assets/images/66.jpg',
  },
  {
    'questionText': 'Which F1 team did Red Bull purchase in 2004 to form their current team?',
    'answers': ['Jaguar', 'Minardi', 'Arrows', 'Sauber'],
    'correctAnswer': 'Jaguar',
    'imagePath': 'assets/images/67.jpg',
  },
  {
    'questionText': 'Which circuit saw the tragic death of Ayrton Senna in 1994?',
    'answers': ['Imola', 'Monza', 'Silverstone', 'Spa-Francorchamps'],
    'correctAnswer': 'Imola',
    'imagePath': 'assets/images/68.jpg',
  },
  {
    'questionText': 'Which driver won the controversial 2005 United States Grand Prix, where only six cars started?',
    'answers': ['Michael Schumacher', 'Rubens Barrichello', 'Kimi Räikkönen', 'Fernando Alonso'],
    'correctAnswer': 'Michael Schumacher',
    'imagePath': 'assets/images/69.jpg',
  },
  {
    'questionText': 'In 1988, McLaren won all but one race. Which team won the other race?',
    'answers': ['Ferrari', 'Williams', 'Benetton', 'Lotus'],
    'correctAnswer': 'Ferrari',
    'imagePath': 'assets/images/70.jpg',
  },
  {
    'questionText': 'Which driver became the first to score points for Force India at the 2009 Belgian Grand Prix?',
    'answers': ['Giancarlo Fisichella', 'Adrian Sutil', 'Paul di Resta', 'Sergio Perez'],
    'correctAnswer': 'Giancarlo Fisichella',
    'imagePath': 'assets/images/71.jpg',
  },
  {
    'questionText': 'Which driver won the infamous 1994 European Grand Prix in rainy conditions?',
    'answers': ['Michael Schumacher', 'Ayrton Senna', 'Damon Hill', 'Rubens Barrichello'],
    'correctAnswer': 'Michael Schumacher',
    'imagePath': 'assets/images/72.jpg',
  },
  {
    'questionText': 'Which driver set the record for the most laps led in Formula 1 history?',
    'answers': ['Lewis Hamilton', 'Michael Schumacher', 'Sebastian Vettel', 'Ayrton Senna'],
    'correctAnswer': 'Lewis Hamilton',
    'imagePath': 'assets/images/73.jpg',
  },
  {
    'questionText': 'Who won the 1995 Formula 1 World Championship?',
    'answers': ['Michael Schumacher', 'Damon Hill', 'Mika Häkkinen', 'Jacques Villeneuve'],
    'correctAnswer': 'Michael Schumacher',
    'imagePath': 'assets/images/74.jpg',
  },
  {
    'questionText': 'Which driver won the 2018 Azerbaijan Grand Prix after two Red Bull cars collided?',
    'answers': ['Lewis Hamilton', 'Sebastian Vettel', 'Kimi Räikkönen', 'Daniel Ricciardo'],
    'correctAnswer': 'Lewis Hamilton',
    'imagePath': 'assets/images/75.jpg',
  },
  {
    'questionText': 'Which circuit is known for having the "Parabolica" corner?',
    'answers': ['Monza', 'Silverstone', 'Spa-Francorchamps', 'Interlagos'],
    'correctAnswer': 'Monza',
    'imagePath': 'assets/images/76.jpg',
  },
  {
    'questionText': 'Which driver famously collided with Damon Hill in the 1994 Australian Grand Prix to win the title?',
    'answers': ['Michael Schumacher', 'Nigel Mansell', 'Mika Häkkinen', 'Jacques Villeneuve'],
    'correctAnswer': 'Michael Schumacher',
    'imagePath': 'assets/images/77.jpg',
  },
  {
    'questionText': 'Which driver survived a terrifying crash at the 2020 Bahrain Grand Prix, escaping from a burning car?',
    'answers': ['Romain Grosjean', 'Kevin Magnussen', 'Esteban Ocon', 'Nico Hülkenberg'],
    'correctAnswer': 'Romain Grosjean',
    'imagePath': 'assets/images/78.jpg',
  },
  {
    'questionText': 'Which driver holds the record for the most pole positions in Formula 1 history?',
    'answers': ['Lewis Hamilton', 'Ayrton Senna', 'Sebastian Vettel', 'Michael Schumacher'],
    'correctAnswer': 'Lewis Hamilton',
    'imagePath': 'assets/images/79.jpg',
  },
  {
    'questionText': 'In what year was the halo safety device introduced to Formula 1?',
    'answers': ['2018', '2017', '2019', '2016'],
    'correctAnswer': '2018',
    'imagePath': 'assets/images/80.jpg',
  },
  {
    'questionText': 'Which F1 team was originally founded as Toleman in 1981?',
    'answers': ['Benetton', 'Red Bull Racing', 'Jordan', 'Toro Rosso'],
    'correctAnswer': 'Benetton',
    'imagePath': 'assets/images/81.jpg',
  },
  {
    'questionText': 'Who won the rain-soaked 2007 Japanese Grand Prix at Fuji Speedway?',
    'answers': ['Lewis Hamilton', 'Kimi Räikkönen', 'Fernando Alonso', 'Felipe Massa'],
    'correctAnswer': 'Lewis Hamilton',
    'imagePath': 'assets/images/82.jpg',
  },
  {
    'questionText': 'Which driver has the record for the most Grand Prix starts?',
    'answers': ['Fernando Alonso', 'Kimi Räikkönen', 'Rubens Barrichello', 'Lewis Hamilton'],
    'correctAnswer': 'Fernando Alonso',
    'imagePath': 'assets/images/83.jpg',
  },
  {
    'questionText': 'Who won the first-ever Formula 1 race held at the Circuit of the Americas in 2012?',
    'answers': ['Lewis Hamilton', 'Sebastian Vettel', 'Fernando Alonso', 'Mark Webber'],
    'correctAnswer': 'Lewis Hamilton',
    'imagePath': 'assets/images/84.jpg',
  },
];


  @override
  void initState() {
    super.initState();
    _loadHighScore(); // Load the high score when the app starts
  }

  Future<void> _loadHighScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _highScore = prefs.getInt('highScoreLevel3') ?? 0; // Load high score for Level 3
    });
  }

  Future<void> _saveHighScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('highScoreLevel3', _highScore);
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
    bool isPassed = _score >= 20; // Modify passing score as needed

    if (isPassed) {
      await _saveScore('level3Score', _score);

      if (_score > _highScore) {
        setState(() {
          _highScore = _score;
        });
        await _saveHighScore();
      }

      await _unlockNextLevel();
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text('Level 3 Finished!', style: TextStyle(color: Colors.red.shade900)),
        content: Text(
          'Your score is: $_score / ${_questions.length}\n${isPassed ? 'Level 4 Unlocked!' : 'You did not pass. Try again!'}',
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            child: Text(isPassed ? 'Next Level' : 'Retry', style: TextStyle(color: Colors.red.shade900)),
            onPressed: () {
              Navigator.of(context).pop();
              if (isPassed) {
                Navigator.pushReplacementNamed(context, '/level4'); // Navigate to Level 4
              } else {
                _resetQuiz();
              }
            },
          ),
        ],
      ),
    );
  }

  Future<void> _saveScore(String levelKey, int score) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(levelKey, score);
  }

  Future<void> _unlockNextLevel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('level4Unlocked', true); // Unlock Level 4
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
        title: const Text('Level 3 Trivia'),
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
