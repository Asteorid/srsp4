import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:srsp4/json_page/bloc/post_bloc.dart';
import 'package:srsp4/json_page/bloc/post_event.dart';
import 'package:srsp4/json_page/bloc/post_state.dart';
import 'package:srsp4/model/post_json.dart';
import 'package:srsp4/services/post_api.dart';

class SecondPage extends StatelessWidget {
  final int postId;
  final ApiService apiService = ApiService(Dio());

  SecondPage({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            PostBloc(apiService: apiService)..add(FetchPost(postId)),
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PostLoaded) {
              return _buildPostView(state.posts);
            } else if (state is PostError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return const Center(child: Text('Unknown state'));
            }
          },
        ),
      ),
    );
  }

  Widget _buildPostView(List<Post> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return ListTile(
          title: Text(
            'ID: ${post.id}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title: ${post.title}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Body: ${post.body}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      },
    );
  }
}
