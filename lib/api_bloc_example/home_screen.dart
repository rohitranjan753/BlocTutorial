import 'package:blocktutorial/api_bloc_example/post_screen.dart';
import 'package:flutter/material.dart';

class HomeScreenBloc extends StatefulWidget {
  const HomeScreenBloc({Key? key}) : super(key: key);

  @override
  State<HomeScreenBloc> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>PostScreen()));
        },
        child: Center(child: Container(
          child: Text('GET POSTS',style: TextStyle(fontSize: 30),),
        )),
      ),
    );
  }
}
