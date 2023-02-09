import 'package:bloc_example/counter/cubit/counter_cubit.dart';
import 'package:bloc_example/counter/counter_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 80, color: Colors.pink),
        )
      ),
      home: BlocProvider(
        create: (context) => CounterCubit()..initial(),
        child: const CounterPage(),
      ),
    );
  }
}
