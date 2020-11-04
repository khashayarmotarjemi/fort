import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fort/posts/posts_repository.dart';
import 'model.dart';

part 'post_event_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostsRepository _postsRepository;

  PostsBloc(PostsState initialState, this._postsRepository)
      : super(initialState);

  @override
  Stream<PostsState> mapEventToState(PostsEvent event) async* {
    if (event is AddPost) {
      yield LoadingAddEditDel();
      final addResult = await _postsRepository.add(event.post);
      if (addResult) {
        yield AddEditDelSuccess();
      } else {
        yield AddEditDelFailed();
      }
    } else if (event is EditPost) {
      yield LoadingAddEditDel();
      final editResult = await _postsRepository.edit(event.post);
      if (editResult) {
        yield AddEditDelSuccess();
      } else {
        yield AddEditDelFailed();
      }
    } else if (event is DeletePost) {
      yield LoadingAddEditDel();
      final deleteResult = await _postsRepository.delete(event.postId);
      if (deleteResult) {
        yield AddEditDelSuccess();
      } else {
        yield AddEditDelFailed();
      }
    } else if (event is FetchPosts) {
      yield LoadingPosts();
      final items = await _postsRepository.getPosts();
      if (items.isNotEmpty) {
        yield PostsLoaded(items);
      } else {
        yield FailedLoadingPosts();
      }
    } else {
      throw Exception("Unknown event $event");
    }
  }
}
