import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/services/vertex_service.dart';


part 'image_description_event.dart';
part 'image_description_state.dart';

class ImageDescriptionBloc extends Bloc<ImageDescriptionEvent, ImageDescriptionState> {
  final VertexService vertexService;

  ImageDescriptionBloc({required this.vertexService}) : super(const ImageDescriptionInitial()) {
    on<ImageDescriptionFetchData>(_onMultiModalFetchData);
  }

  Future<void> _onMultiModalFetchData(
    ImageDescriptionFetchData event,
    Emitter<ImageDescriptionState> emit,
  ) async {
    emit(const ImageDescriptionLoading());
    try {
      final responseText = await vertexService.getDescribeImageResponse(imagePath: event.imagePath, text: event.text);

      log('Response received: $responseText');
      emit(ImageDescriptionResponse(responseText));
    } catch (e) {
      log('Error sending image prompt: $e');
      emit(ImageDescriptionError('$e'));
    }
  }
}
