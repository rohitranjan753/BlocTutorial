import 'dart:math';

import 'package:blocktutorial/api_eample/data/models/PostModel.dart';
import 'package:blocktutorial/api_eample/logic/cubits/post_cubit/post_cubit.dart';
import 'package:blocktutorial/api_eample/presentation/screens/home_screen_api.dart';
import 'package:blocktutorial/api_eample/repositories/pots_repositories.dart';
import 'package:blocktutorial/bloc/home_screen.dart';
import 'package:blocktutorial/bloc/internet_bloc.dart';
import 'package:blocktutorial/example/api_example/api_bloc.dart';
import 'package:blocktutorial/example/api_example/api_repo.dart';
import 'package:blocktutorial/example/api_example/api_ui.dart';
import 'package:blocktutorial/example/example_cubit.dart';
import 'package:blocktutorial/example/examplebloc.dart';
import 'package:blocktutorial/example/examplescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // PostRepository postRepository = PostRepository();
  // List<PostModel> postModels = await postRepository.fetchPost();

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
      home: RepositoryProvider(
        create: (context) => ApiRepo(),
        child: const ApiScreen(),
      ),
    );

    // return BlocProvider(
    //   create: (context) => InternetBloc(),
    //   child: MaterialApp(
    //     theme: ThemeData(
    //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //       useMaterial3: true,
    //     ),
    //     home: HomeScreen(),
    //   ),
    // );


    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //     onGenerateRoute: Routes.onGenerateRoute,initialRoute: "/first",
    // );

    return BlocProvider(
      create: (context) => PostCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreenApi(),
      ),
    );
  }
}
