import 'package:flutter/material.dart';

class HomeChatsPage extends StatelessWidget {
  const HomeChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chats"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_comment_sharp),
      ),
    );
  }
}
