import 'package:flutter/material.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/home/domain/entities/post_entity.dart';
import 'package:html/parser.dart';

class PostViewScreen extends StatelessWidget {
  const PostViewScreen({
    super.key,
    required this.postEntity,
  });

  final PostEntity postEntity;

  @override
  Widget build(BuildContext context) {
    final document = parse(postEntity.content);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                "assets/images/header-background.jpg",
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
                alignment: const Alignment(0, -1),
              ),
              const Text(
                "Flutter Blog",
                style: TextStyle(
                  fontSize: 24,
                  letterSpacing: 4,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      child: Image.asset(
                        "assets/images/flutter-logo.jpg",
                        height: 140,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        alignment: const Alignment(0, 1),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            postEntity.title.trim(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            document.body?.text.trim() ?? "Error Showing Content!",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
