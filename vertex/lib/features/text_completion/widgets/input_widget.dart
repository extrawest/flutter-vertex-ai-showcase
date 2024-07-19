import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/text_completion_bloc.dart';

class InputWidget extends StatelessWidget {
  final String selectedImage;

  InputWidget({super.key, required this.selectedImage});

  final TextEditingController _controller = TextEditingController();

  Future<void> handleSubmit({required BuildContext context, required String text}) async {
    _controller.clear();
    BlocProvider.of<TextCompletionBloc>(context).add(
      TextCompletionFetchData(text: text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _controller,
        onSubmitted: (text) => handleSubmit(context: context, text: text),
        decoration: InputDecoration(
          labelText: 'Ask a question',
          suffixIcon: IconButton(
            icon: const Icon(Icons.send),
            onPressed: () => handleSubmit(context: context, text: _controller.text),
          ),
        ),
      ),
    );
  }
}
