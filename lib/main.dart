import 'package:bloc_example/homework-24/add_ads_cubit.dart';
import 'package:bloc_example/homework/checker_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'homework-24/add_ads_page.dart';
import 'lesson/main_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CounterCubit()),
          BlocProvider(create: (_) => CheckerCubit()),
          BlocProvider(create: (_) => AddAdsCubit()),
        ],
        child: const AddAdsScreen(),
      ),
    );
  }
}
