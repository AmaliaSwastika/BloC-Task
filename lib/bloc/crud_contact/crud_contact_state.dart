part of 'crud_contact_bloc.dart';

sealed class CrudContactState extends Equatable {
  final List<ContactModel> contactList;

  const CrudContactState({required this.contactList});

  @override
  List<Object> get props => [contactList];
}

final class CrudContactInitial extends CrudContactState {
  const CrudContactInitial({required super.contactList});
}

//start
final class CreateContactSuccess extends CrudContactState {
  const CreateContactSuccess({required super.contactList});
}

final class CreateContactFailed extends CrudContactState {
  const CreateContactFailed({required super.contactList});
}
//end


final class UpdateContactSuccess extends CrudContactState {
  const UpdateContactSuccess({required super.contactList});
}

final class UpdateContactFailed extends CrudContactState {
  const UpdateContactFailed({required super.contactList});
}


final class DeleteContactSuccess extends CrudContactState {
  const DeleteContactSuccess({required super.contactList});
}

final class DeleteContactFailed extends CrudContactState {
  const DeleteContactFailed({required super.contactList});
}