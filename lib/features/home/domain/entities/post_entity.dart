import 'post_author_entity.dart';
import 'post_replies_entity.dart';

class PostEntity {
  final String kind;
  final String id;
  final String published;
  final String updated;
  final String url;
  final String selfLink;
  final String title;
  final String content;
  final PostAuthorEntity author;
  final PostRepliesEntity replies;

  PostEntity({
    required this.kind,
    required this.id,
    required this.published,
    required this.updated,
    required this.url,
    required this.selfLink,
    required this.title,
    required this.content,
    required this.author,
    required this.replies,
  });
}
