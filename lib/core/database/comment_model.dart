// ignore_for_file: public_member_api_docs, sort_constructors_first
class CommentModel {
  final int commentId;
  final int postId;
  final String userId;
  final String commentCaption;
  final DateTime createdAt;
  
  // TODO(): add Foreign Key post_id

  CommentModel({
    required this.commentId,
    required this.postId,
    required this.userId,
    required this.commentCaption,
    required this.createdAt,
    // TODO(): add Foreign Key post_id
  });
  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      commentId: json['comment_id'],
      postId: json['post_id'],
      userId: json['user_id'],
      commentCaption: json['comment_caption'],
      createdAt: DateTime.parse(json['created_at'],
      )
      );
  }
}
