import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/bloc/crud_contact/crud_contact_bloc.dart';
import 'package:state_management_bloc/bloc/phone_validator/phone_validator_bloc.dart';
import 'package:state_management_bloc/model/contact_model.dart';
import 'package:state_management_bloc/theme/theme_color.dart';
import 'package:state_management_bloc/theme/theme_text_style.dart';
import 'package:state_management_bloc/widget/text_field_widget.dart';
import '../bloc/name_validator/name_validator_bloc.dart';

// ignore: must_be_immutable
class ContactPage extends StatelessWidget {
  ContactPage({super.key});

  int selectedIndex = -1;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  List<ContactModel> contact = [
    ContactModel(
        name: '',
        phone: '')
  ];

  @override
  Widget build(BuildContext context) {
    final currentNameValidatorState = context.watch<NameValidatorBloc>().state;
    final currentPhoneValidatorState =
        context.watch<PhoneValidatorBloc>().state;

    final nameValidatorBloc = context.read<NameValidatorBloc>();
    final phoneValidatorBloc = context.read<PhoneValidatorBloc>();
    final crudContactBloc = context.read<CrudContactBloc>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Contacts',
          style: ThemeTextStyle().m3AppBar,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      drawer: Drawer( 
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Navigation Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Contact'),
              onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/'); 
              },
            ),
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Gallery Menu'),
              onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/gallery'); 
              },
            ),
          ],
        ),
      ),

      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: Column(children: [
              const Icon(size: 24, Icons.smartphone),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Create New Contacts',
                style: ThemeTextStyle().m3HeadlineSmall,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                  textAlign: TextAlign.left,
                  style: ThemeTextStyle().m3BodyMedium,
                  'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made'),
              const SizedBox(
                height: 10,
              ),
              const Divider()
            ]),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      // TextField
                      BlocBuilder<NameValidatorBloc, NameValidatorState>(
                        builder: (context, state) {
                          return TextFieldWidget(
                            label: 'Name',
                            hint: 'Insert Your Name',
                            errorMsg: state is NameValidatorFailed
                                ? state.errorMsg
                                : '',
                            controller: nameController,
                            onChanged: (value) {
                              nameValidatorBloc
                                  .add(NameFieldChanged(nameValue: value));
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      BlocBuilder<PhoneValidatorBloc, PhoneValidatorState>(
                        builder: (context, state) {
                          return TextFieldWidget(
                              keyboardType: TextInputType.number,
                              label: 'Phone',
                              hint: '+62 ...',
                              errorMsg: state is PhoneValidatorFailed
                                  ? state.errorMsg
                                  : '',
                              controller: phoneController,
                              onChanged: (value) {
                                phoneValidatorBloc
                                    .add(PhoneFieldChanged(phoneValue: value));
                              });
                        },
                      ),
                    ],
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 14, right: 20),
                  child: ElevatedButton(
                      onPressed: currentNameValidatorState
                                  is NameValidatorSuccess &&
                              currentPhoneValidatorState
                                  is PhoneValidatorSuccess
                          ? () {
                              if (selectedIndex == -1) {
                                crudContactBloc.add(CreateContact(
                                    name: nameController.text,
                                    phone: phoneController.text));
                                nameController.clear();
                                phoneController.clear();
                                nameValidatorBloc.add(ResetNameValue());
                                phoneValidatorBloc.add(ResetPhoneValue());
                              } else {
                                crudContactBloc.add(UpdateContact(
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    index: selectedIndex));
                                nameController.clear();
                                phoneController.clear();
                                nameValidatorBloc.add(ResetNameValue());
                                phoneValidatorBloc.add(ResetPhoneValue());
                                selectedIndex = -1;
                              }
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ThemeColor().m3SysLightPurple,
                        disabledForegroundColor:
                            ThemeColor().whiteColor,
                        disabledBackgroundColor: ThemeColor()
                            .m3SysLightPurple
                            .withOpacity(0.20),
                      ),
                      child: Text(
                        selectedIndex == -1 ? 'Submit' : 'Update',
                        style: ThemeTextStyle().m3LabelLarge,
                      )))
            ],
          ),
          const SizedBox(
            height: 48,
          ),
          Text(
            'List Contacts',
            textAlign: TextAlign.center,
            style: ThemeTextStyle().m3HeadlineSmall,
          ),
          const SizedBox(
            height: 14,
          ),
          Container(
            color: ThemeColor().whiteColor,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocBuilder<CrudContactBloc, CrudContactState>(
              builder: (context, state) {
                return ListView.builder(
                    itemCount: state.contactList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var data = state.contactList[index];
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text(data.name[0]),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text(data.name), Text(data.phone)],
                        ),
                        trailing:
                            Row(mainAxisSize: MainAxisSize.min, children: [
                          IconButton(
                              onPressed: () {
                                selectedIndex = index;
                                nameController.text = data.name;
                                phoneController.text = data.phone;
                                nameValidatorBloc.add(
                                    UpdateNameValue(selectedName: data.name));
                                phoneValidatorBloc.add(UpdatePhoneValue(
                                    selectedPhone: data.phone));
                              },
                              icon: const Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {
                                crudContactBloc.add(DeleteContact(id: index));
                              },
                              icon: const Icon(Icons.delete)),
                        ]),
                      );
                    });
              },
            ),
          )
        ],
      ),
    );
  }
}