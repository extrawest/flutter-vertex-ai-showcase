part of 'image_description_bloc.dart';

sealed class ImageDescriptionState extends Equatable {
  final String responseText;

  const ImageDescriptionState(this.responseText);

  @override
  List<Object> get props => [responseText];
}

class ImageDescriptionInitial extends ImageDescriptionState {
  const ImageDescriptionInitial() : super('');
}

class ImageDescriptionResponse extends ImageDescriptionState {
  final String response;

  const ImageDescriptionResponse(this.response) : super(response);

  @override
  List<Object> get props => [responseText];
}

class ImageDescriptionLoading extends ImageDescriptionState {
  const ImageDescriptionLoading() : super('');
}

class ImageDescriptionError extends ImageDescriptionState {
  final String error;

  const ImageDescriptionError(this.error) : super('');

  @override
  List<Object> get props => [error];
}
