import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srsp4/json_page/bloc/post_event.dart';
import 'package:srsp4/json_page/bloc/post_state.dart';
import 'package:srsp4/services/post_api.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final ApiService apiService;

  PostBloc({required this.apiService}) : super(PostInitial()) {
    on<FetchPost>((event, emit) async {
      emit(PostLoading());
      try {
        final posts = await apiService.getPosts();
        emit(PostLoaded(posts));
      } catch (e) {
        emit(PostError("Error fetching post: $e"));
      }
    });
  }
}
