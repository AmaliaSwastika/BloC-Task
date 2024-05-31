part of 'name_validator_bloc.dart';

sealed class NameValidatorState extends Equatable {
  final String nameValue;

  const NameValidatorState({required this.nameValue});

  @override
  List<Object> get props => [nameValue];
}

final class NameValidatorInitial extends NameValidatorState {
  const NameValidatorInitial({required super.nameValue});
}

final class NameValidatorSuccess extends NameValidatorState {
  const NameValidatorSuccess({required super.nameValue});
}

final class NameValidatorFailed extends NameValidatorState {
  final String errorMsg;

  const NameValidatorFailed({required this.errorMsg, required super.nameValue});

  @override
  List<Object> get props => [errorMsg];
}