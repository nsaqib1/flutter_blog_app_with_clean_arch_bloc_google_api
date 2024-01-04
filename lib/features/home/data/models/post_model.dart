import '../../domain/entities/post_entity.dart';
import 'post_author_model.dart';
import 'post_replies_model.dart';

class PostModel extends PostEntity {
  PostModel({
    required super.kind,
    required super.id,
    required super.published,
    required super.updated,
    required super.url,
    required super.selfLink,
    required super.title,
    required super.content,
    required super.author,
    required super.replies,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      kind: json["kind"],
      id: json["id"],
      published: json["published"],
      updated: json["updated"],
      url: json["url"],
      selfLink: json["selfLink"],
      title: json["title"],
      content: json["content"],
      author: PostAuthorModel.fromJson(json["author"]),
      replies: PostRepliesModel.fromJson(json["replies"]),
    );
  }
}
