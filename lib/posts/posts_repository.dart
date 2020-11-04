import 'package:fort/posts/model.dart';

abstract class PostsRepository {
  Future<List<Post>> getPosts();

  Future<bool> add(Post post);

  Future<bool> edit(Post post);

  Future<bool> delete(int postId);
}

class SimplePostsRepository implements PostsRepository {
  final List<Post> posts = [
    Post("first", "first text",
        "https://uploads4.wikiart.org/images/egon-schiele.jpg!Portrait.jpg"),
    Post("second", "second text",
        "https://www.tate.org.uk/sites/default/files/styles/width-600/public/egon_schiele_standing_male_figure_self-portrait_1914_5.jpg"),
    Post("third", "third text",
        "https://www.reproduction-gallery.com/catalogue/uploads/1140577811_large-image_1140577811_large-image_es56lg.jpg")
  ];

  @override
  Future<bool> add(Post post) {
    posts.add(post);
    return Future.delayed(Duration(milliseconds: 500), () {
      return true;
    });
  }

  @override
  Future<bool> edit(Post post) async {
    posts.add(post);
    if (posts.any((p) => p.id == post.id)) {
      posts.removeWhere((element) => element.id == post.id);
      posts.add(post);
      return Future.delayed(Duration(milliseconds: 500), () {
        return true;
      });
    } else {
      return false;
    }
  }

  @override
  Future<List<Post>> getPosts() async {
    return Future.delayed(Duration(milliseconds: 500), () {
      return posts;
    });
  }

  @override
  Future<bool> delete(int postId) async {
    if (posts.any((p) => p.id == postId)) {
      posts.removeWhere((element) => element.id == postId);
      return Future.delayed(Duration(milliseconds: 500), () {
        return true;
      });
    } else {
      return false;
    }
  }
}
