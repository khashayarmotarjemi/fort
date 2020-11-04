class Post {
  final int id;
  final String title;
  final String text;
  final String imageUrl;

  Post(this.title, this.text, this.imageUrl, {this.id = -1});
}
