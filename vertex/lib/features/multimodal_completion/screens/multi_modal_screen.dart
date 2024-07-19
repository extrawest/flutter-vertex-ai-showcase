import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/multi_modal_bloc.dart';
import '../utils/image_picker.dart';
import '../widgets/input_widget.dart';

class MultiModalScreen extends StatefulWidget {
  const MultiModalScreen({super.key, required this.title});

  final String title;

  @override
  State<MultiModalScreen> createState() => _MultiModalScreenState();
}

class _MultiModalScreenState extends State<MultiModalScreen> {
  String selectedImage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              String imagePath = await pickImage();
              setState(() {
                selectedImage = imagePath;
              });
            },
            child: const Text('Upload Image'),
          ),
          InputWidget(
            selectedImage: selectedImage,
          ),
          BlocBuilder<MultiModalBloc, MultiModalState>(
            builder: (context, state) {
              if (state is MultiModalLoading) {
                return const SizedBox(
                  width: 50,
                  height: 50,
                  child: Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (state is MultiModalResponse) {
                return Expanded(
                  child: Text(state.responseText),
                );
              } else if (state is MultiModalError) {
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
                    child: Text('Add Image and text'),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
