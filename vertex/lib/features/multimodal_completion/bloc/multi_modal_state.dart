part of 'multi_modal_bloc.dart';

sealed class MultiModalState extends Equatable {
  final String responseText;

  const MultiModalState(this.responseText);

  @override
  List<Object> get props => [responseText];
}

class MultiModalInitial extends MultiModalState {
  const MultiModalInitial() : super('');
}

class MultiModalResponse extends MultiModalState {
  final String response;

  const MultiModalResponse(this.response) : super(response);

  @override
  List<Object> get props => [responseText];
}

class MultiModalLoading extends MultiModalState {
  const MultiModalLoading() : super('');
}

class MultiModalError extends MultiModalState {
  final String error;

  const MultiModalError(this.error) : super('');

  @override
  List<Object> get props => [error];
}
