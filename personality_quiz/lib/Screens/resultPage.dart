import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  Result({required this.totalScore});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Your personality score is $totalScore"),
      ),
    );
  }
}
