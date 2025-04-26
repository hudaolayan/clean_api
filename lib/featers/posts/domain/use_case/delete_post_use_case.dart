import '../repositries/post_repostiry.dart';

class DeletePostUseCase {
  PostRepostiry postRepostiry;

  DeletePostUseCase({required this.postRepostiry});

  Future<bool> call({required int id}) async {
    return await postRepostiry.deletePost(id: id);
  }
}
