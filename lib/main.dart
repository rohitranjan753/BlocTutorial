import 'package:blocktutorial/bloc/internet_bloc.dart';
import 'package:blocktutorial/cubit_example.dart';
import 'package:blocktutorial/cubits/internet_cubit.dart';
import 'package:blocktutorial/home_screen.dart';
import 'package:blocktutorial/routes/routes.dart';
import 'package:blocktutorial/sign_in/bloc/signin_bloc.dart';
import 'package:blocktutorial/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (context) => SignInBloc(),
    //   child: MaterialApp(
    //     theme: ThemeData(
    //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //       useMaterial3: true,
    //     ),
    //     home: SignInExample(),
    //   ),
    // );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.onGenerateRoute,initialRoute: "/first",
    );
  }
}
