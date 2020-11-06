import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pomodoro App'),
        centerTitle: true,
        backgroundColor: Colors.green[200],
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
            child: Text(
              'The Pomodoro Technique is a time management method developed by Francesco Cirillo in the late 1980s. The technique uses a timer to break down work into 25 minute intervals, separated by 5 minute breaks. \nEach interval is known as a pomodoro, from the Italian word for tomato, after the tomato-shaped kitchen timer that Cirillo used as a university student.\nEvery four pomodoros, a longer, 20 minute break is needed.',
              style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 2.0,
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, '/choices');
            },
            color: Colors.green[200],
            child: Text('Start working!',
                style: TextStyle(
                  fontSize: 22.0,
                  letterSpacing: 2.0,
                )
            ),
                shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(100.0),
                )
          )
        ],
      ),
    );
  }
}

