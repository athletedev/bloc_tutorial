// ignore_for_file: public_member_api_docs, sort_constructors_firstimport 'package:bloc_course_dev/features/fetch_data/data/data_repository.dart';
import 'package:bloc_course_dev/features/fetch_data/cubit/freezed_data_cubit.dart';
import 'package:bloc_course_dev/features/fetch_data/data/data_repository.dart';
import 'package:bloc_course_dev/features/fetch_data/data/remote_data_source.dart';
import 'package:bloc_course_dev/features/fetch_data/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_course_dev/couter_cubit.dart';
import 'package:bloc_course_dev/data_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FreezedDataCubit>(
            create: (context) => FreezedDataCubit(
                  DataRepository(
                    RemoteDataSource(),
                  ),
                )),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
        BlocProvider<DataCubit>(
          create: (context) => DataCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Builder(builder: (context) {
          return const MyHomePage(title: 'Flutter Demo Home Page');
        }),
      ),
    );
  }
}
