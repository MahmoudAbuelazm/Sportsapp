import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app/Data/Cubit/GetTeamsCubit/cubit/get_teams_cubit.dart';
import 'package:sports_app/Data/Cubit/GetTopScorerCubit/cubit/get_top_scorer_cubit.dart';
import 'package:sports_app/Data/Cubit/Leagues%20Cubit/leagues_cubit.dart';
import 'package:sports_app/Data/Cubit/cubit/git_country_cubit.dart';
import 'package:sports_app/Data/Cubit/playersCubit/get_players_data_cubit.dart';
import 'package:sports_app/Screen/home_screen.dart';
import 'package:sports_app/Screen/login_screen.dart';
import 'package:sports_app/Screen/onboarding_screen.dart';
import 'package:sports_app/Screen/splashscreen.dart';
import 'package:sports_app/Screen/tabBar_screen.dart';

import 'Screen/country_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GitCountryCubit>(
          create: (BuildContext context) => GitCountryCubit(),
        ),
        BlocProvider<LeaguesCubit>(
          create: (BuildContext context) => LeaguesCubit(),
        ),
        BlocProvider<GetPlayersDataCubit>(
          create: (BuildContext context) => GetPlayersDataCubit(),
        ),
        BlocProvider<GetTeamsCubit>(
          create: (BuildContext context) => GetTeamsCubit(),
        ),
        BlocProvider<GetTopScorerCubit>(
          create: (BuildContext context) => GetTopScorerCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: tabBarScreen(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
