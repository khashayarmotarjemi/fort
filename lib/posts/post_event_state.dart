part of 'posts_bloc.dart';

// states
@immutable
abstract class PostsState {}

class PostsLoaded extends PostsState {
  final List<Post> posts;

  PostsLoaded(this.posts);
}

class LoadingPosts extends PostsState {}

class LoadingAddEditDel extends PostsState {}

class AddEditDelSuccess extends PostsState {}

class AddEditDelFailed extends PostsState {}

class FailedLoadingPosts extends PostsState {
  final String error;

  FailedLoadingPosts({this.error = "Error loading posts"});
}

// events
@immutable
abstract class PostsEvent {}

class FetchPosts extends PostsEvent {}

class AddPost extends PostsEvent {
  final Post post;

  AddPost(this.post);
}

class EditPost extends PostsEvent {
  final Post post;

  EditPost(this.post);
}

class DeletePost extends PostsEvent {
  final int postId;

  DeletePost(this.postId);
}
