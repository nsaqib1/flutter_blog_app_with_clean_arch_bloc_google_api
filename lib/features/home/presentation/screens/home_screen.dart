import 'package:flutter/material.dart';

import '../widgets/post_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      extendBody: true,
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
          Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  spreadRadius: 0,
                  color: Colors.black12,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              "Fluttering into the Future: Inspiring Innovation, Empowering Developers",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            alignment: Alignment.centerLeft,
            child: Text(
              "All Posts",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: 100,
              ),
              itemBuilder: (context, index) => const PostCard(),
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemCount: 5,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
