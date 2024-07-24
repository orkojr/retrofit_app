import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit_app/core/models/post_model.dart';
import 'package:retrofit_app/core/services/post_service.dart';

class PostViewModel {
  static fetchPost() async {
    final client = ApiClient(
      Dio(
        BaseOptions(contentType: 'application/json'),
      ),
    );

    try {
      final response = await client.getPosts();
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static addPost({required PostModel post}) async {
    final client = ApiClient(
      Dio(
        BaseOptions(
          contentType: 'application/json',
          queryParameters: post.toJson(),
        ),
      ),
    );

    try {
      final response = await client.createPost(post);
      await client.getPosts();
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
