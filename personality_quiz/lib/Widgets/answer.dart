import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback answered;
  final String answetText;
  const Answer({required this.answered,required this.answetText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: ElevatedButton(
        onPressed: answered,
        child: Text(
          answetText,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFc9fcff),
          fixedSize: Size(
            342,
            45,
          ),
        ),
      ),
    );
  }
}
