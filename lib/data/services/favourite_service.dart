import 'package:wisal/data/models/post.dart';
import 'package:wisal/utils/helper.dart';
import 'package:http/src/multipart_file.dart';

import 'api_service.dart';

class PostsService extends ApiService {
  static PostsService? _instance;

  static PostsService get instance => _instance ??= PostsService._();

  PostsService._();

  Future<List<Post>?> getPosts({
    int? userId,
    int? categoryId,
    int? countryId,
    int? stateId,
  }) async {
    Uri uri = Uri.parse('posts');
    Map<String, dynamic> query = {};

    if (userId != null) {
      query['user_id'] = userId.toString();
    }
    if (categoryId != null) {
      query['category_id'] = categoryId.toString();
    }
    if (countryId != null) {
      query['country_id'] = countryId.toString();
    }
    if (stateId != null) {
      query['state_id'] = stateId.toString();
    }

    uri = uri.replace(queryParameters: query);
    final String url = uri.toString();

    var response = await get(url, auth: false);

    return getApiListData<Post>(response, Post.fromJson);
  }

  Future<List<Post>?> getSliders({int? userId,
    int? categoryId,
    int? countryId,
    int? stateId,}) async {
    Uri uri = Uri.parse('posts/sliders');
    Map<String, dynamic> query = {};

    if (userId != null) {
      query['user_id'] = userId.toString();
    }
    if (categoryId != null) {
      query['category_id'] = categoryId.toString();
    }
    if (countryId != null) {
      query['country_id'] = countryId.toString();
    }
    if (stateId != null) {
      query['state_id'] = stateId.toString();
    }

    uri = uri.replace(queryParameters: query);
    final String url = uri.toString();

    var response = await get(url, auth: false);

    return getApiListData<Post>(response, Post.fromJson);
  }

  Future<Post?> getPost(int? postId) async {
    final String url = "posts/$postId";

    var response = await get(url, auth: false);

    return getApiObjectData<Post>(response, Post.fromJson);
  }

  Future<bool> addPost({required Map<String, dynamic> data, required List<MultipartFile> images}) async {
    String url = "posts/store";

    var response = await multipart(url, images ,data, auth: true);

    return response["success"] == true;
  }

  Future<bool> updatePost({required int? postId,required Map<String, dynamic> data, required List<MultipartFile> images}) async {
    String url = "posts/owned/$postId/update";

    var response = await multipart(url, images ,data, auth: true);

    return response["success"] == true;
  }

}
