import 'package:flutter/material.dart';
import 'package:retrofit_app/core/models/post_model.dart';
import 'package:retrofit_app/core/view_models/post_view_model.dart';

class AddPostView extends StatefulWidget {
  const AddPostView({super.key});

  @override
  State<AddPostView> createState() => _AddPostViewState();
}

class _AddPostViewState extends State<AddPostView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("add Post"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async{
            PostViewModel.addPost(
                post: PostModel(
              userId: 1,
              title: "Orko Jk",
              body: "Bonjour Orko jk",
            ));
          },
          child: const Text("Add Post"),
        ),
      ),
    );
  }
}
