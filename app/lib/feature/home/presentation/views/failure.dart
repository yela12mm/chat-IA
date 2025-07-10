import 'package:flutter/material.dart';

class FailureView extends StatelessWidget {
  final String message;

  const FailureView ({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text ("Error: $message")));
  }
}