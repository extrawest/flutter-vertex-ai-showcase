import 'dart:typed_data' as typed_data;
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:flutter/services.dart';

import '../services/vertex_service.dart';

part 'multi_modal_event.dart';

part 'multi_modal_state.dart';

class MultiModalBloc extends Bloc<MultiModalEvent, MultiModalState> {
  VertexService vertexService;

  MultiModalBloc({required this.vertexService}) : super(const MultiModalInitial()) {
    on<MultiModalFetchData>(_onMultiModalFetchData);
  }

  final List<({Image? image, String? text, bool fromUser})> _generatedContent = <({Image? image, String? text, bool fromUser})>[];
  String text = '';

  Future<void> _onMultiModalFetchData(
    MultiModalFetchData event,
    Emitter<MultiModalState> emit,
  ) async {
    emit(const MultiModalLoading());
    final model = await vertexService.initVertexAIModel();
    try {
      typed_data.ByteData catBytes = await rootBundle.load(event.imagePath);

      final content = [
        Content.multi([
          TextPart(event.text),
          DataPart('image/jpeg', catBytes.buffer.asUint8List()),
        ]),
      ];

      print('Sending content to model...');
      var response = await model.generateContent(content);

      print('Response received: ${response.text}');

      text = response.text ?? '';

      if (text.isNotEmpty) {
        _generatedContent.add((image: null, text: text, fromUser: false));
      }
      emit(MultiModalResponse(text));
    } catch (e) {
      print('Error sending image prompt: $e');
      emit(MultiModalError('$e'));
    }
  }
}
