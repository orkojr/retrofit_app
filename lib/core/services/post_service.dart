import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit_app/core/models/post_model.dart';

part 'post_service.g.dart';

class Apis {
  static const String posts = '/posts';
}

@RestApi(
  baseUrl: 'https://jsonplaceholder.typicode.com',
  parser: Parser.JsonSerializable,
)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET(Apis.posts)
  Future<List<PostModel>> getPosts();

  @POST(Apis.posts)
  Future<void> createPost(PostModel post);

  @PUT(Apis.posts)
  Future<PostModel> updatePost(int id, PostModel post);

  @DELETE(Apis.posts)
  Future<void> deletePost(int id);
}
