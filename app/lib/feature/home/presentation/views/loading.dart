import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView ({super.key});

  @override
  Widget build (BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 224, 245),
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: Color.fromARGB(255, 255, 126, 212),
          strokeWidth: 6,

        )
      )   
    );
  }
}