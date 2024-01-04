import '../../domain/entities/post_replies_entity.dart';

class PostRepliesModel extends PostRepliesEntity {
  PostRepliesModel({required super.totalItems, required super.selfLink});

  factory PostRepliesModel.fromJson(Map<String, dynamic> json) {
    return PostRepliesModel(
      totalItems: json["totalItems"],
      selfLink: json["selfLink"],
    );
  }
}
