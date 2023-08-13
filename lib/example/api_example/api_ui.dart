// import 'package:blocktutorial/example/api_example/api_bloc.dart';
// import 'package:blocktutorial/example/api_example/api_event.dart';
// import 'package:blocktutorial/example/api_example/api_model.dart';
// import 'package:blocktutorial/example/api_example/api_repo.dart';
// import 'package:blocktutorial/example/api_example/api_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class ApiScreen extends StatefulWidget {
//   const ApiScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ApiScreen> createState() => _ApiScreenState();
// }
//
// class _ApiScreenState extends State<ApiScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ApiBloc(
//         RepositoryProvider.of<ApiRepo>(context),
//       )..add(ApiLoadingEvent()),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Ui'),
//         ),
//         body: BlocBuilder<ApiBloc, ApiState>(
//           builder: (BuildContext context, ApiState state) {
//             if (state is ApiLoadingState) {
//               return CircularProgressIndicator();
//             } else if (state is ApiLoadedState) {
//               List<PostsModel> list = state.postList;
//
//               return ListView.builder(
//                   itemCount: list.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       title: Text(list[index].title.toString()),
//                     );
//                   });
//             } else {
//               return Text('Error');
//             }
//           },
//         ),
//       ),
//     );
//   }
// }



import 'package:blocktutorial/example/api_example/api_bloc.dart';
import 'package:blocktutorial/example/api_example/api_event.dart';
import 'package:blocktutorial/example/api_example/api_model.dart';
import 'package:blocktutorial/example/api_example/api_repo.dart';
import 'package:blocktutorial/example/api_example/api_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({Key? key}) : super(key: key);

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  late ApiBloc _apiBloc; // Declare the API bloc

  @override
  void initState() {
    super.initState();
    _apiBloc = ApiBloc(RepositoryProvider.of<ApiRepo>(context));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _apiBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Ui'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                _apiBloc.add(ApiLoadingEvent());
              },
              child: Text('Load Data'), // Changed button label
            ),
            BlocBuilder<ApiBloc, ApiState>(
              builder: (BuildContext context, ApiState state) {
                if (state is ApiLoadingState) {
                  return CircularProgressIndicator();
                } else if (state is ApiLoadedState) {
                  List<PostsModel> list = state.postList;

                  return Container(
                    height: 300,
                    child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(list[index].title.toString()),
                        );
                      },
                    ),
                  );
                } else {
                  return Container(
                    height: 300,
                    alignment: Alignment.center,
                    child: Text('Press the "Load Data" button to fetch data.'),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _apiBloc.close(); // Close the bloc when disposing of the screen
    super.dispose();
  }
}
