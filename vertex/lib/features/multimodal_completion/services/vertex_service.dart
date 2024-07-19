import 'package:firebase_vertexai/firebase_vertexai.dart';

class VertexService {
  Future<GenerativeModel> initVertexAIModel() async {
    final model = FirebaseVertexAI.instance.generativeModel(
      model: 'gemini-1.5-flash-preview-0514',
    );
    return model;
  }
}
