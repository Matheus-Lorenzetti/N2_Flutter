class Movie {
  String id; // Document ID in Firestore
  String title;
  bool watched;
  String comments;

  Movie({
    required this.id,
    required this.title,
    this.watched = false,
    this.comments = '',
  });
}
