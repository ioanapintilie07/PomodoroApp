import 'package:flutter/material.dart';
import 'package:my_my_ohmy/pages/home.dart';
import 'package:my_my_ohmy/pages/choices.dart';
import 'package:my_my_ohmy/pages/pomodoro.dart';

void main() => runApp(MaterialApp(
  home: Home(),
  routes: {
    //'/' : (context) => Home(),
    '/home' : (context) => Home(), //this will explain the technique
    '/choices' : (context) => Choices(), //this is where we'll choose work time
    '/pomodoro' : (context) => Pomodoro(), //actual timer
  },
));