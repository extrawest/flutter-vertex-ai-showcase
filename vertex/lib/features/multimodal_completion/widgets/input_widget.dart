import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/multi_modal_bloc.dart';

class InputWidget extends StatelessWidget {
  final String selectedImage;

  InputWidget({super.key, required this.selectedImage});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> handleSubmit(String text) async {
      _controller.clear();
      BlocProvider.of<MultiModalBloc>(context).add(
        MultiModalFetchData(text: text, imagePath: selectedImage),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _controller,
        onSubmitted: handleSubmit,
        decoration: InputDecoration(
          labelText: 'Ask a question',
          suffixIcon: IconButton(
            icon: const Icon(Icons.send),
            onPressed: () => handleSubmit(_controller.text),
          ),
        ),
      ),
    );
  }
}
