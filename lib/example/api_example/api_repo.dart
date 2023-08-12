import 'dart:convert';
import 'package:blocktutorial/example/api_example/api_model.dart';
import 'package:http/http.dart' as http;

class ApiRepo {
  final String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<PostsModel>> fetchPostApi() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((item) => PostsModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
