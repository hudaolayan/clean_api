class PostEntity {
  int userId;
  String title;
  String body;
  int id;
  bool? isLoading = false;

  PostEntity({
    required this.userId,
    required this.title,
    required this.body,
    required this.id,
    required this.isLoading
  });
}
