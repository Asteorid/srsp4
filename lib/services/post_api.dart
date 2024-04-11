import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:srsp4/model/post_json.dart';

part 'post_api.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/posts")
  Future<List<Post>> getPosts();
}
