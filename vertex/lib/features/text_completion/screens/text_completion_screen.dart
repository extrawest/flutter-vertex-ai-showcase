import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/text_completion_bloc.dart';
import '../widgets/input_widget.dart';

class TextCompletionScreen extends StatefulWidget {
  const TextCompletionScreen({super.key});


  @override
  State<TextCompletionScreen> createState() => _TextCompletionScreenState();
}

class _TextCompletionScreenState extends State<TextCompletionScreen> {
  String selectedImage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Text Completion'),
      ),
      body: Column(
        children: [
          InputWidget(
            selectedImage: selectedImage,
          ),
          BlocBuilder<TextCompletionBloc, TextCompletionState>(
            builder: (context, state) {
              if (state is TextCompletionLoading) {
                return const SizedBox(
                  width: 50,
                  height: 50,
                  child: Align(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (state is TextCompletionResponse) {
                return Expanded(
                  child: Text(state.responseText),
                );
              } else if (state is TextCompletionError) {
                // Return an error message widget
                return Expanded(
                  child: Center(
                    child: Text(state.error),
                  ),
                );
              } else {
                // Return an empty Container for the default case
                return const Expanded(
                  child: Center(
                    child: Text('Add text'),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
