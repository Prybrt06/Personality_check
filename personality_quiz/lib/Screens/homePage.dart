import 'package:flutter/material.dart';
import 'package:personality_quiz/Widgets/answer.dart';
import 'package:personality_quiz/Widgets/drawer.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  var _questionIndex = 0;
  var totalScore = 0;
  var noOfQuestion;

  void answerQuestion(int score) {
    totalScore += score;
    setState(() {
      _questionIndex += 1;
      if (_questionIndex >= noOfQuestion) {
        print("Your Personality score is $totalScore");
        totalScore = 0;
        _questionIndex = 0;
      }
    });
  }

  void skipQuestion() {
    setState(() {
      _questionIndex += 1;
      if (_questionIndex >= noOfQuestion) {
        _questionIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final questions = [
      {
        'Question': 'Q. What is your name?',
        'answers': [
          {
            'text': 'Priyabrat Duarah',
            'score': 10,
          },
          {
            'text': 'Sintu',
            'score': 5,
          },
          {
            'text': 'Peter',
            'score': 3,
          },
          {
            'text': 'Smith',
            'score': 2,
          },
        ]
      },
      {
        'Question': 'Q. What is your favourite color?',
        'answers': [
          {
            'text': 'Blue',
            'score': 10,
          },
          {
            'text': 'Pink',
            'score': 5,
          },
          {
            'text': 'Red',
            'score': 3,
          },
          {
            'text': 'Green',
            'score': 7,
          },
        ]
      },
      {
        'Question': 'Q. What is your favourite animal?',
        'answers': [
          {
            'text': 'Tiger',
            'score': 10,
          },
          {
            'text': 'Lion',
            'score': 5,
          },
          {
            'text': 'Dog',
            'score': 3,
          },
          {
            'text': 'Cat',
            'score': 7,
          },
        ]
      },
      {
        'Question': 'Q. What is your favourite color?',
        'answers': [
          {
            'text': 'Blue',
            'score': 10,
          },
          {
            'text': 'Pink',
            'score': 5,
          },
          {
            'text': 'Red',
            'score': 3,
          },
          {
            'text': 'Green',
            'score': 7,
          },
        ]
      }
    ];

    noOfQuestion = questions.length;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF92F0F6),
          toolbarHeight: 80,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Personality Check",
            style: TextStyle(
              color: Colors.black,
              fontSize: 23,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        drawer: DrawerWidget(
          questionNo: _questionIndex,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 25,
          ),
          child: Column(
            children: [
              Text(
                questions[_questionIndex]['Question'] as String,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              ...(questions[_questionIndex]['answers']
                      as List<Map<String, Object>>)
                  .map((answer) {
                return Answer(
                    answered: () => answerQuestion(answer['score'] as int),
                    answetText: answer['text'] as String);
              }).toList(),
            ],
          ),
        ),
        floatingActionButton: ElevatedButton(
          onPressed: () => skipQuestion(),
          child: Wrap(
            children: [
              Icon(
                Icons.arrow_right,
                color: Colors.black,
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Text(
                  "Skip",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF92F0F6),
          ),
        ),
      ),
    );
  }
}
