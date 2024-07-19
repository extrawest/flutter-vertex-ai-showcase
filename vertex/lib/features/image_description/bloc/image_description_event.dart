part of 'image_description_bloc.dart';

sealed class ImageDescriptionEvent extends Equatable {
  const ImageDescriptionEvent();
}

class ImageDescriptionFetchData extends ImageDescriptionEvent {
  final String text;
  final String imagePath;

  const ImageDescriptionFetchData({required this.text, required this.imagePath});

  @override
  List<Object> get props => [text, imagePath];
}
