import 'package:flutter/material.dart';
import 'package:mvvm/View/HomeScreen/photo_screen.dart';
import 'package:mvvm/View/HomeScreen/posts_screen.dart';
import 'package:mvvm/View/HomeScreen/user_screen.dart';

import 'HomeScreen/album_screen.dart';
import 'HomeScreen/comments_screen.dart';
import 'HomeScreen/to_do_screen.dart';

class Bottommoney extends StatefulWidget {
  const Bottommoney({Key? key}) : super(key: key);

  @override
  State<Bottommoney> createState() => _BottommoneyState();
}

class _BottommoneyState extends State<Bottommoney> {
  int select = 0;
  List screen = [
    const PostsScreen(),
    const CommentsScreen(),
    const AlbumScreen(),
    const PhotoScreen(),
    const ToDoScreen(),
    const UsersScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: BottomNavigationBar(
          currentIndex: select,
          onTap: (value) {
            setState(
              () {
                select = value;
              },
            );
          },
          selectedFontSize: 18,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.post_add), label: "Post"),
            BottomNavigationBarItem(
                icon: Icon(Icons.comment), label: "Comments"),
            BottomNavigationBarItem(icon: Icon(Icons.album), label: "Albums"),
            BottomNavigationBarItem(icon: Icon(Icons.photo), label: "Photos"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today_outlined), label: "Todos"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: "Users"),
          ],
        ),
      ),
      body: screen[select],
    );
  }
}
