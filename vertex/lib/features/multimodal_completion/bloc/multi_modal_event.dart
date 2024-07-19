part of 'multi_modal_bloc.dart';

sealed class MultiModalEvent extends Equatable {
  const MultiModalEvent();
}

class MultiModalFetchData extends MultiModalEvent {
  final String text;
  final String imagePath;

  const MultiModalFetchData({required this.text, required this.imagePath});

  @override
  List<Object> get props => [text, imagePath];
}
