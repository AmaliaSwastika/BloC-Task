import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/bloc/crud_contact/crud_contact_bloc.dart';
import 'package:state_management_bloc/bloc/name_validator/name_validator_bloc.dart';
import 'package:state_management_bloc/bloc/phone_validator/phone_validator_bloc.dart';
import 'package:state_management_bloc/page/contact_bloc_page.dart';
import 'package:state_management_bloc/page/detail_page.dart';
import 'package:state_management_bloc/page/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NameValidatorBloc>(
          create: (context) => NameValidatorBloc(),
        ),
        BlocProvider<PhoneValidatorBloc>(
          create: (context) => PhoneValidatorBloc(),
        ),
        BlocProvider<CrudContactBloc>(
          create: (context) => CrudContactBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Soal BLoC',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
       routes: {
        '/': (_) => ContactPage(),
        '/gallery': (_) => Home(),
        '/detail-page': (_) => const DetailPage(imageUrl: '',)
      },
      ),
    );
  }
}