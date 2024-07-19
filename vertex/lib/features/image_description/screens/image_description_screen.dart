import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/image_description_bloc.dart';
import '../utils/image_picker.dart';

class ImageDescriptionScreen extends StatefulWidget {
  const ImageDescriptionScreen({super.key});

  @override
  State<ImageDescriptionScreen> createState() => _ImageDescriptionScreenState();
}

class _ImageDescriptionScreenState extends State<ImageDescriptionScreen> {
  String selectedImage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Image description'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              final String imagePath = await pickImage();
              setState(() {
                selectedImage = imagePath;
              });
            },
            child: const Text('Upload Image'),
          ),
          if (selectedImage.isNotEmpty) Image.asset(selectedImage),
          if (selectedImage.isNotEmpty)
            ElevatedButton(
              onPressed: () async {
                BlocProvider.of<ImageDescriptionBloc>(context).add(
                  ImageDescriptionFetchData(imagePath: selectedImage, text: 'Describe Image'),
                );
              },
              child: const Text('Describe Image'),
            ),
          BlocBuilder<ImageDescriptionBloc, ImageDescriptionState>(
            builder: (context, state) {
              if (state is ImageDescriptionLoading) {
                return const SizedBox(
                  width: 50,
                  height: 50,
                  child: Align(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (state is ImageDescriptionResponse) {
                return Expanded(
                  child: Text(state.responseText),
                );
              } else if (state is ImageDescriptionError) {
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
          ),
        ],
      ),
    );
  }
}
