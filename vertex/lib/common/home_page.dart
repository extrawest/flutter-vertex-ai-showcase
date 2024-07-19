import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vertex/common/router.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {
              context.push(imageDescriptionScreen);
            },
            child: const Text('Describe Image'),
          ),
          TextButton(
            onPressed: () {
              context.push(textCompletionScreen);
            },
            child: const Text('Text Completion'),
          ),
        ],
      ),
    );
  }
}
