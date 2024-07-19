import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/vertex_service.dart';

part 'multi_modal_event.dart';
part 'multi_modal_state.dart';

class MultiModalBloc extends Bloc<MultiModalEvent, MultiModalState> {
  final VertexService vertexService;

  MultiModalBloc({required this.vertexService}) : super(const MultiModalInitial()) {
    on<MultiModalFetchData>(_onMultiModalFetchData);
  }

  Future<void> _onMultiModalFetchData(
    MultiModalFetchData event,
    Emitter<MultiModalState> emit,
  ) async {
    emit(const MultiModalLoading());
    try {
      final responseText = await vertexService.getTextResponse(imagePath: event.imagePath, text: event.text);

      log('Response received: $responseText');
      emit(MultiModalResponse(responseText));
    } catch (e) {
      log('Error sending image prompt: $e');
      emit(MultiModalError('$e'));
    }
  }
}
