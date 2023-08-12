import 'package:blocktutorial/routes/first_cubit.dart';
import 'package:blocktutorial/routes/screens/first_screen.dart';
import 'package:blocktutorial/routes/screens/second_screen.dart';
import 'package:blocktutorial/routes/screens/third_screen.dart';
import 'package:blocktutorial/routes/second_cubit.dart';
import 'package:blocktutorial/routes/third_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/first":
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => FirstCubit(),
                  child: FirstScreen(),
                ),);

      case "/second":
        Map<String,dynamic> arguments = settings.arguments as Map<String,dynamic>;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SecondCubit(),
            child: SecondScreen(title: arguments['title'],),
          ),);

      case "/third":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => ThirdCubit(),
            child: ThirdScreen(),
          ),);

      default : return null;
    }
  }
}
