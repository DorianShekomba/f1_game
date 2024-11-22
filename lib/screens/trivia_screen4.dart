import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TriviaScreen4 extends StatefulWidget {
  const TriviaScreen4({super.key});

  @override
  _TriviaScreen4State createState() => _TriviaScreen4State();
}

class _TriviaScreen4State extends State<TriviaScreen4> {
  int _score = 0; // Score tracking
  int _highScore = 0; // High score tracking
  
  int _currentQuestionIndex = 0;

final List<Map<String, Object>> _questions = [
  {
    'questionText': 'Which driver was famously stripped of his victory at the 1982 Brazilian Grand Prix for running underweight?',
    'answers': ['Nelson Piquet', 'Alain Prost', 'Nigel Mansell', 'Keke Rosberg'],
    'correctAnswer': 'Nelson Piquet',
    'imagePath': 'assets/images/34.jpg',
  },
  {
    'questionText': 'Which driver was disqualified from the 1997 Formula 1 World Championship for colliding with Jacques Villeneuve?',
    'answers': ['Michael Schumacher', 'Damon Hill', 'Mika Häkkinen', 'David Coulthard'],
    'correctAnswer': 'Michael Schumacher',
    'imagePath': 'assets/images/56.jpg',
  },
  {
    'questionText': 'Which F1 team did Red Bull purchase in 2004 to form their current team?',
    'answers': ['Jaguar', 'Minardi', 'Arrows', 'Sauber'],
    'correctAnswer': 'Jaguar',
    'imagePath': 'assets/images/78.jpg',
  },
  {
    'questionText': 'Which driver won the controversial 2005 United States Grand Prix, where only six cars started?',
    'answers': ['Michael Schumacher', 'Rubens Barrichello', 'Kimi Räikkönen', 'Fernando Alonso'],
    'correctAnswer': 'Michael Schumacher',
    'imagePath': 'assets/images/41.jpg',
  },
  {
    'questionText': 'Which team achieved the first turbocharged victory in Formula 1?',
    'answers': ['Renault', 'Ferrari', 'McLaren', 'Lotus'],
    'correctAnswer': 'Renault',
    'imagePath': 'assets/images/50.jpg',
  },
  {
    'questionText': 'In 1994, which controversial device was banned, forcing teams to revise their car setups?',
    'answers': ['Active suspension', 'Traction control', 'Turbo engines', 'Anti-lock brakes'],
    'correctAnswer': 'Active suspension',
    'imagePath': 'assets/images/63.jpg',
  },
  {
    'questionText': 'In 1988, McLaren won all but one race. Which team won the other race?',
    'answers': ['Ferrari', 'Williams', 'Benetton', 'Lotus'],
    'correctAnswer': 'Ferrari',
    'imagePath': 'assets/images/22.jpg',
  },
  {
    'questionText': 'Which circuit features the famous "Eau Rouge" corner?',
    'answers': ['Spa-Francorchamps', 'Silverstone', 'Suzuka', 'Monza'],
    'correctAnswer': 'Spa-Francorchamps',
    'imagePath': 'assets/images/55.jpg',
  },
  {
    'questionText': 'Which driver famously collided with Damon Hill in the 1994 Australian Grand Prix to win the title?',
    'answers': ['Michael Schumacher', 'Nigel Mansell', 'Mika Häkkinen', 'Jacques Villeneuve'],
    'correctAnswer': 'Michael Schumacher',
    'imagePath': 'assets/images/67.jpg',
  },
  {
    'questionText': 'Which driver holds the record for the most laps led in Formula 1 history?',
    'answers': ['Lewis Hamilton', 'Michael Schumacher', 'Sebastian Vettel', 'Ayrton Senna'],
    'correctAnswer': 'Lewis Hamilton',
    'imagePath': 'assets/images/12.jpg',
  },
  {
    'questionText': 'Which driver won the infamous 1994 European Grand Prix in rainy conditions?',
    'answers': ['Michael Schumacher', 'Ayrton Senna', 'Damon Hill', 'Rubens Barrichello'],
    'correctAnswer': 'Michael Schumacher',
    'imagePath': 'assets/images/38.jpg',
  },
  {
    'questionText': 'Which driver survived a terrifying crash at the 2020 Bahrain Grand Prix, escaping from a burning car?',
    'answers': ['Romain Grosjean', 'Kevin Magnussen', 'Esteban Ocon', 'Nico Hülkenberg'],
    'correctAnswer': 'Romain Grosjean',
    'imagePath': 'assets/images/74.jpg',
  },
  {
    'questionText': 'Which driver became the first to score points for Force India at the 2009 Belgian Grand Prix?',
    'answers': ['Giancarlo Fisichella', 'Adrian Sutil', 'Paul di Resta', 'Sergio Perez'],
    'correctAnswer': 'Giancarlo Fisichella',
    'imagePath': 'assets/images/90.jpg',
  },
  {
    'questionText': 'Which driver won the controversial 1997 Formula 1 World Championship?',
    'answers': ['Jacques Villeneuve', 'Damon Hill', 'Mika Häkkinen', 'Nigel Mansell'],
    'correctAnswer': 'Jacques Villeneuve',
    'imagePath': 'assets/images/58.jpg',
  },
  {
    'questionText': 'Which circuit is known for having the "Parabolica" corner?',
    'answers': ['Monza', 'Silverstone', 'Spa-Francorchamps', 'Interlagos'],
    'correctAnswer': 'Monza',
    'imagePath': 'assets/images/71.jpg',
  },
  {
    'questionText': 'Which driver set the record for the most laps led in a Formula 1 season?',
    'answers': ['Lewis Hamilton', 'Sebastian Vettel', 'Max Verstappen', 'Ayrton Senna'],
    'correctAnswer': 'Max Verstappen',
    'imagePath': 'assets/images/23.jpg',
  },
  {
    'questionText': 'In what year was the halo safety device introduced to Formula 1?',
    'answers': ['2018', '2017', '2019', '2016'],
    'correctAnswer': '2018',
    'imagePath': 'assets/images/83.jpg',
  },
  {
    'questionText': 'Which driver earned the nickname "The Professor" due to his methodical driving style?',
    'answers': ['Alain Prost', 'Niki Lauda', 'Nigel Mansell', 'Jackie Stewart'],
    'correctAnswer': 'Alain Prost',
    'imagePath': 'assets/images/19.jpg',
  },
  {
    'questionText': 'Which driver holds the record for the most pole positions in Formula 1 history?',
    'answers': ['Lewis Hamilton', 'Ayrton Senna', 'Sebastian Vettel', 'Michael Schumacher'],
    'correctAnswer': 'Lewis Hamilton',
    'imagePath': 'assets/images/60.jpg',
  },
  {
    'questionText': 'Which team introduced the "blown diffuser" in 2011 to improve downforce?',
    'answers': ['Red Bull Racing', 'McLaren', 'Ferrari', 'Mercedes'],
    'correctAnswer': 'Red Bull Racing',
    'imagePath': 'assets/images/66.jpg',
  },
  {
    'questionText': 'Who won the 2016 Formula 1 World Championship and immediately retired?',
    'answers': ['Nico Rosberg', 'Lewis Hamilton', 'Sebastian Vettel', 'Fernando Alonso'],
    'correctAnswer': 'Nico Rosberg',
    'imagePath': 'assets/images/17.jpg',
  },
  {
    'questionText': 'Which team did Michael Schumacher drive for when he returned to Formula 1 in 2010?',
    'answers': ['Mercedes', 'Ferrari', 'McLaren', 'Red Bull Racing'],
    'correctAnswer': 'Mercedes',
    'imagePath': 'assets/images/45.jpg',
  },
  {
    'questionText': 'Which driver won the 2010 Canadian Grand Prix after starting from pole?',
    'answers': ['Lewis Hamilton', 'Sebastian Vettel', 'Jenson Button', 'Fernando Alonso'],
    'correctAnswer': 'Lewis Hamilton',
    'imagePath': 'assets/images/20.jpg',
  },
  {
    'questionText': 'Which team has won the most Formula 1 Constructors’ Championships?',
    'answers': ['Ferrari', 'Mercedes', 'Red Bull', 'McLaren'],
    'correctAnswer': 'Ferrari',
    'imagePath': 'assets/images/61.jpg',
  },
  {
    'questionText': 'Who was the first-ever Formula 1 World Champion?',
    'answers': ['Giuseppe Farina', 'Juan Manuel Fangio', 'Stirling Moss', 'Alberto Ascari'],
    'correctAnswer': 'Giuseppe Farina',
    'imagePath': 'assets/images/28.jpg',
  },
  {
    'questionText': 'Which F1 driver holds the record for the most career points?',
    'answers': ['Lewis Hamilton', 'Sebastian Vettel', 'Fernando Alonso', 'Michael Schumacher'],
    'correctAnswer': 'Lewis Hamilton',
    'imagePath': 'assets/images/48.jpg',
  },
  {
    'questionText': 'Who won the 2012 Formula 1 World Championship?',
    'answers': ['Sebastian Vettel', 'Fernando Alonso', 'Lewis Hamilton', 'Kimi Räikkönen'],
    'correctAnswer': 'Sebastian Vettel',
    'imagePath': 'assets/images/31.jpg',
  },
  {
    'questionText': 'Which driver won his first Formula 1 race at the 2008 Canadian Grand Prix?',
    'answers': ['Robert Kubica', 'Lewis Hamilton', 'Felipe Massa', 'Sebastian Vettel'],
    'correctAnswer': 'Robert Kubica',
    'imagePath': 'assets/images/36.jpg',
  },
  {
    'questionText': 'Which driver holds the record for the most consecutive wins in Formula 1?',
    'answers': ['Sebastian Vettel', 'Michael Schumacher', 'Lewis Hamilton', 'Nico Rosberg'],
    'correctAnswer': 'Sebastian Vettel',
    'imagePath': 'assets/images/73.jpg',
  },
  {
    'questionText': 'Which circuit has hosted the most Formula 1 Grands Prix?',
    'answers': ['Monaco', 'Monza', 'Silverstone', 'Spa-Francorchamps'],
    'correctAnswer': 'Monza',
    'imagePath': 'assets/images/80.jpg',
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
      _highScore = prefs.getInt('highScoreLevel4') ?? 0; // Load high score for Level 4
    });
  }

  Future<void> _saveHighScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('highScoreLevel4', _highScore);
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
      await _saveScore('level4Score', _score);

      if (_score > _highScore) {
        setState(() {
          _highScore = _score;
        });
        await _saveHighScore();
      }

      // Since this is Level 4, no next level to unlock
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text('Level 4 Finished!', style: TextStyle(color: Colors.red.shade900)),
        content: Text(
          'Your score is: $_score / ${_questions.length}\n${isPassed ? 'Well done! You completed all levels!' : 'You did not pass. Try again!'}',
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            child: Text(isPassed ? 'Restart Quiz' : 'Retry', style: TextStyle(color: Colors.red.shade900)),
            onPressed: () {
              Navigator.of(context).pop();
              if (isPassed) {
                _resetQuiz(); // Reset the quiz on completion
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
        title: const Text('Level 4 Trivia'),
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
