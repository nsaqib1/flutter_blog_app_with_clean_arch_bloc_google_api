import 'package:flutter/material.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/home/domain/entities/post_entity.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.postEntity,
  });

  final PostEntity postEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            blurRadius: 3,
            spreadRadius: 1,
            offset: Offset(0, 2),
            color: Colors.black12,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assets/images/flutter-logo.jpg",
              width: 110,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  postEntity.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text(
                  postEntity.content,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "0",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.comment_outlined,
                          size: 14,
                        ),
                      ],
                    ),
                    Text("Jan 01, 2024"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
