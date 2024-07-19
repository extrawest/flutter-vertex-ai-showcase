import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/services/vertex_service.dart';


part 'text_completion_event.dart';
part 'text_completion_state.dart';

class TextCompletionBloc extends Bloc<TextCompletionEvent, TextCompletionState> {
  final VertexService vertexService;

  TextCompletionBloc({required this.vertexService}) : super(const TextCompletionInitial()) {
    on<TextCompletionFetchData>(_onMultiModalFetchData);
  }

  Future<void> _onMultiModalFetchData(
    TextCompletionFetchData event,
    Emitter<TextCompletionState> emit,
  ) async {
    emit(const TextCompletionLoading());
    try {
      final responseText = await vertexService.getCompletionResponse( event.text);

      log('Response received: $responseText');
      emit(TextCompletionResponse(responseText));
    } catch (e) {
      log('Error sending image prompt: $e');
      emit(TextCompletionError('$e'));
    }
  }
}
