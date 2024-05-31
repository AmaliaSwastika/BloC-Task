part of 'name_validator_bloc.dart';

sealed class NameValidatorEvent extends Equatable {
  const NameValidatorEvent();
}

class NameFieldChanged extends NameValidatorEvent {
  final String nameValue;

  const NameFieldChanged({required this.nameValue});

  @override
  List<Object> get props => [nameValue];
}

class ResetNameValue extends NameValidatorEvent {
  @override
  List<Object> get props => [];
}

class UpdateNameValue extends NameValidatorEvent {
  final String selectedName;

  const UpdateNameValue({required this.selectedName});

  @override
  List<Object> get props => [selectedName];
}