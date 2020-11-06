import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_my_ohmy/pages/choices.dart';
import 'dart:async';

class Pomodoro extends StatefulWidget {
  @override
  _PomodoroState createState() => _PomodoroState();
}

class _PomodoroState extends State<Pomodoro> {
  Map pomodoros = {};
  int a = 2, b = 5, c = 0, d = 0, _pomodoro_count = 0, counter = -1;
  String current = 'Pomodoro', message = "Let's start your ";
  Timer timer;
  bool isGoing = false; //this is to prevent calling reset on null
  String buttonName = 'Start';//we'll change this when clicked

  void initTimer () //actual timer starts counting in _start_timer
  {                         //but we'll use this function to display the starting point of timer
    if (counter <= 0) {     // ie 20, 25, 5
      c = 0;
      d = 0;
      if (current == 'Pomodoro') {
        counter = 1500;
        setState(() {
          a = 2;
          b = 5;
        });
      }
      else if (current == 'short break') {
        counter = 300;
        setState(() {
          a = 0;
          b = 5;
        });
      }
      else if (current == 'long break') {
        counter = 1200;
        setState(() {
          a = 2;
          b = 0;
        });
      }
    }
  }

  void updatePhase ()
  {
    setState(() {
      if (current == 'Pomodoro') {
        _pomodoro_count++;
        if(_pomodoro_count % 4 == 0) //every 4 pmds, 20 minute break
          current = 'long break';
        else
          current = 'short break';
      }
      else
        current = 'Pomodoro';
    });
  }

  void startTime ()
  {
    initTimer();
    isGoing = true;
    timer = Timer.periodic(Duration (seconds: 1), (timer) {
      setState(() {
        if(counter > 0)
          {
            if(counter % 10 != 0)
              d--;
            else
            {
              d = 9;
              if (counter % 60 != 0) {
                if(c > 0) c--;
              }
              else
                {
                  c = 5;
                  if(b == 0) {
                    b = 9;
                    a--;
                  }
                  else b--;
                }
            }
            counter--;
          }
        else
          {
            timer.cancel();
            isGoing = false;
            setState(() {
              buttonName = 'Start';
            });
            updatePhase();
            initTimer();
          }
      });
    });
  }

  void stopTime()
  {
    timer.cancel();
  }

  void resetTime()
  {
    if(isGoing == true)
      {
        timer.cancel();
        counter = -1;
        initTimer();
        setState(() {
          buttonName = 'Start';
        });
      }
  }

  @override
  void dispose() {
    if(counter > 0)
      timer.cancel();
    super.dispose();
  }
  Widget build(BuildContext context) {
    pomodoros = ModalRoute.of(context).settings.arguments;
    String setMessage () //change bottom message based on current status
    {
      String message = "";
      setState(() {
        if(_pomodoro_count == pomodoros['hours'] && pomodoros['hours'] != 100)
          message = 'Goal reached! Keep going, if you feel like it, or enjoy the rest of your productive day.';
        else if(_pomodoro_count == 0)
          message = 'Keep it up!';
        else
          message = 'Great job!';
      });
      return message;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Pomodoro App'),
        centerTitle: true,
        backgroundColor: Colors.green[200],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Text(a.toString() + b.toString() + ":" + c.toString() + d.toString(),
                style: TextStyle(
                  fontSize: 100.0,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text("Time left of your " + current,
              style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 2.0,
              ),
            ),
          ),
          Row (
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FlatButton(
                  onPressed: () { //change button name
                    if(buttonName == 'Start')
                    {
                      setState(() {
                        buttonName = 'Pause';
                      });
                      startTime();
                    }
                    else if (buttonName == 'Pause')
                    {
                      setState(() {
                        buttonName = 'Start';
                      });
                      stopTime();
                    }
                  },
                  color: Colors.green[200],
                  child: Text(buttonName,
                      style: TextStyle(
                        fontSize: 22.0,
                        letterSpacing: 2.0,
                      )
                  ),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(100.0),
                  ),
              ),
              FlatButton(
                  onPressed: () {
                      resetTime();
                  },
                  color: Colors.green[200],
                  child: Text('Reset',
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
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text("You worked for " + _pomodoro_count.toString() + " pomodoro(s). ",
              style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 2.0,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(setMessage(),
                style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 2.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}