import 'dart:developer';
import 'dart:typed_data' as typed_data;
import 'dart:ui';

import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:flutter/services.dart';

class VertexService {
  Future<GenerativeModel> initVertexAIModel() async {
    final model = FirebaseVertexAI.instance.generativeModel(
      model: 'gemini-1.5-flash-preview-0514',
    );
    return model;
  }

  Future<String> getDescribeImageResponse({required String imagePath, required String text}) async {
    final model = await initVertexAIModel();
    final List<({Image? image, String? text, bool fromUser})> generatedContent = <({Image? image, String? text, bool fromUser})>[];

    final typed_data.ByteData catBytes = await rootBundle.load(imagePath);

    final content = [
      Content.multi([
        TextPart(text),
        DataPart('image/jpeg', catBytes.buffer.asUint8List()),
      ]),
    ];

    log('Sending content to model...');
    final response = await model.generateContent(content);

    log('Response received: ${response.text}');
    if (text.isNotEmpty) {
      generatedContent.add((image: null, text: text, fromUser: false));
    }
    return response.text ?? '';
  }

  Future<String> getCompletionResponse( String text) async {
    final model = await initVertexAIModel();

    final prompt = [Content.text(text)];

    final response = await model.generateContent(prompt);

    return response.text ?? '';
  }
}
