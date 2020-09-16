import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz.dart';
import 'QnA.dart';

Quiz quiz = Quiz();
void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz App"),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        backgroundColor: Colors.amberAccent[100],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: MyApp(),
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> score = [];
  var totalscore = 0;
  void check(bool ans) {
    bool correctAns = quiz.getAnswer();
    setState(() {
      if (correctAns == ans) {
        score.add(
          CircleAvatar(
            backgroundColor: Colors.lightGreen[200],
            radius: 20,
            child: Icon(
              Icons.check,
              color: Colors.green,
            ),
          ),
        );
        totalscore += 1;
      } else {
        score.add(
          CircleAvatar(
            backgroundColor: Colors.red[100],
            radius: 20,
            child: Icon(
              Icons.close,
              color: Colors.red,
            ),
          ),
        );
      }
      if (quiz.isFinished() == true) {
        Alert(
          context: context,
          title: 'Done!',
          desc:
              'You\'ve reached the end of the quiz.\nYour score is ${totalscore}',
        ).show();
        quiz.reset();
        score = [];
        totalscore = 0;
      } else {
        quiz.nextquestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quiz.getQuestion(),
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                child: Text(
                  "True",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.lightGreen[200],
                  ),
                ),
                color: Colors.green,
                onPressed: () {
                  check(true);
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                child: Text(
                  "False",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.red[100],
                  ),
                ),
                color: Colors.redAccent,
                onPressed: () {
                  check(false);
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: score,
          ),
        ]);
  }
}
