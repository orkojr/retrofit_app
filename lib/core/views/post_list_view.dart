import 'package:flutter/material.dart';
import 'package:retrofit_app/core/view_models/post_view_model.dart';

import '../models/post_model.dart';

class PostListView extends StatefulWidget {
  const PostListView({super.key});

  @override
  State<PostListView> createState() => _PostListViewState();
}

class _PostListViewState extends State<PostListView> {
  List<PostModel> posts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const AddPostView()),
          // );

          await PostViewModel.addPost(
              post: PostModel(
            userId: 1,
            title: "Orko Jk",
            body: "Bonjour Orko jk",
          ));

          posts = await PostViewModel.fetchPost();
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Retrofit App'),
      ),
      body: FutureBuilder(
        future: PostViewModel.fetchPost(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Une erreur s\'est produite'));
          } else if (snapshot.hasData) {
            posts = snapshot.data;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (BuildContext context, int index) {
                var post = posts[index];
                return ListTile(
                  title: Text(post.title!),
                  subtitle: Text(post.body!),
                  leading: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: Text(
                      "${post.id}",
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('Aucune donnée à afficher'));
          }
        },
      ),
    );
  }
}
