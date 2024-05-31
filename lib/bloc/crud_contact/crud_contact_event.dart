part of 'crud_contact_bloc.dart';

sealed class CrudContactEvent extends Equatable {
  const CrudContactEvent();
}

class CreateContact extends CrudContactEvent {
  final String name;
  final String phone;

  const CreateContact(
      {required this.name,
      required this.phone});

  @override
  List<Object> get props => [name, phone];
}

class UpdateContact extends CrudContactEvent {
  final String name;
  final String phone;
  final int index;

  const UpdateContact({
    required this.name,
    required this.phone,
    required this.index,
  });

  @override
  List<Object> get props => [name, phone, index];
}

class DeleteContact extends CrudContactEvent {
  final int id;

  const DeleteContact({required this.id});

  @override
  List<Object> get props => [id];
}