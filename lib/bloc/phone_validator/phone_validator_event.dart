part of 'phone_validator_bloc.dart';

sealed class PhoneValidatorEvent extends Equatable {
  const PhoneValidatorEvent();
}

class PhoneFieldChanged extends PhoneValidatorEvent {
  final String phoneValue;

  const PhoneFieldChanged({required this.phoneValue});

  @override
  List<Object> get props => [phoneValue];
}

class ResetPhoneValue extends PhoneValidatorEvent {
  @override
  List<Object> get props => [];
}

class UpdatePhoneValue extends PhoneValidatorEvent {
  final String selectedPhone;

  const UpdatePhoneValue({required this.selectedPhone});

  @override
  List<Object> get props => [selectedPhone];
}