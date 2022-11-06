import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  final int questionNo;
  const DrawerWidget({required this.questionNo});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.7),
      child: Center(
        child: Text("Number of the question is : ${questionNo+1}"),
      ),
    );
  }
}
