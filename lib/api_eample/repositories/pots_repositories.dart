//fucntion related to post such as fetch, update, delete

import 'dart:developer';

import 'package:blocktutorial/api_eample/data/models/PostModel.dart';
import 'package:dio/dio.dart';

import 'api/api.dart';

class PostRepository{
  API api = API();

  Future<List<PostModel>> fetchPost() async{
    try{
      Response response = await api.sendRequest.get("/posts");
      List<dynamic> postMaps = response.data;
      return postMaps.map((postMap) => PostModel.fromJson(postMap)).toList();

    }
    catch(ex){
      throw ex;
    }
  }
}
