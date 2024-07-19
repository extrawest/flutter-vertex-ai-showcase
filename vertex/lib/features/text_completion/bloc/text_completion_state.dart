part of 'text_completion_bloc.dart';

sealed class TextCompletionState extends Equatable {
  final String responseText;

  const TextCompletionState(this.responseText);

  @override
  List<Object> get props => [responseText];
}

class TextCompletionInitial extends TextCompletionState {
  const TextCompletionInitial() : super('');
}

class TextCompletionResponse extends TextCompletionState {
  final String response;

  const TextCompletionResponse(this.response) : super(response);

  @override
  List<Object> get props => [responseText];
}

class TextCompletionLoading extends TextCompletionState {
  const TextCompletionLoading() : super('');
}

class TextCompletionError extends TextCompletionState {
  final String error;

  const TextCompletionError(this.error) : super('');

  @override
  List<Object> get props => [error];
}
