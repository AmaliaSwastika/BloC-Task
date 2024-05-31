part of 'phone_validator_bloc.dart';

sealed class PhoneValidatorState extends Equatable {
  final String phoneValue;

  const PhoneValidatorState({required this.phoneValue});

  @override
  List<Object> get props => [phoneValue];
}

final class PhoneValidatorInitial extends PhoneValidatorState {
  const PhoneValidatorInitial({required super.phoneValue});
}

final class PhoneValidatorSuccess extends PhoneValidatorState {
  const PhoneValidatorSuccess({required super.phoneValue});
}

final class PhoneValidatorFailed extends PhoneValidatorState {
  final String errorMsg;

  const PhoneValidatorFailed(
      {required this.errorMsg, required super.phoneValue});

  @override
  List<Object> get props => [errorMsg];
}