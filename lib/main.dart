import 'package:bloc_example/homework-24/add_ads_cubit.dart';
import 'package:bloc_example/homework/checker_cubit.dart';
import 'package:bloc_example/lesson-24/university_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'lesson-24/university_home_page.dart';
import 'lesson-24/university_model.dart';
import 'lesson/main_cubit.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UniversityAdapter());
  Hive.registerAdapter(UniverResponseAdapter());
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
          BlocProvider(create: (_) => UniversityCubit()),
        ],
        child: const UniversityHomePage(),
      ),
    );
  }
}
