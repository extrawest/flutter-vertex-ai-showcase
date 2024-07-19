part of 'text_completion_bloc.dart';

sealed class TextCompletionEvent extends Equatable {
  const TextCompletionEvent();
}

class TextCompletionFetchData extends TextCompletionEvent {
  final String text;


  const TextCompletionFetchData({required this.text});

  @override
  List<Object> get props => [text];
}
