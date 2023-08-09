import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'blocs/counter/counter_bloc.dart';
import 'blocs/theme/theme_bloc.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (_) => CounterBloc(),
        ),
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Hydrated BLoC',
            theme: state.appTheme == AppTheme.light
                ? ThemeData.dark()
                : ThemeData.light(),
            // ThemeData(
            //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            //   useMaterial3: true,
            home: const MyHomePage(title: 'Flutter Hydrated BLoC Home Page'),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            context.watch<ThemeBloc>().state.appTheme == AppTheme.light
                ? Colors.black
                : Colors.white24,
        title: Text(title),
      ),
      body: Center(
        child: Text(
          '${context.watch<CounterBloc>().state.counter}',
          style: const TextStyle(color: Colors.blue, fontSize: 52.0),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<ThemeBloc>().add(ThemeToggledEvent());
            },
            child: const Icon(Icons.brightness_6),
          ),
          const SizedBox(width: 5.0),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(CounterIncreasedEvent());
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 5.0),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(CounterDecreasedEvent());
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 5.0),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.delete_forever),
          ),
        ],
      ),
    );
  }
}
