import '../../domain/entities/post_author_entity.dart';

class PostAuthorModel extends PostAuthorEntity {
  PostAuthorModel({
    required super.id,
    required super.displayName,
    required super.url,
    required super.image,
  });

  factory PostAuthorModel.fromJson(Map<String, dynamic> json) {
    return PostAuthorModel(
      id: json["id"],
      displayName: json["displayName"],
      url: json["url"],
      image: json["image"]["url"],
    );
  }
}
