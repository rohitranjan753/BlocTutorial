import 'dart:convert';

import 'package:blocktutorial/api_bloc_example/post_modell.dart';
import 'package:http/http.dart' as http;

class PostRepo{
  Future<List<PostModel>> getPosts() async{
    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if(response.statusCode==200){
      final List data = jsonDecode(response.body);
       return data.map((e) => PostModel.fromJson(e)).toList();
    }
    else{
      throw Exception('Failed to load posts');
    }
  }
}