import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Detailpage extends StatefulWidget {
  const Detailpage({super.key, required this.title});

  final String title;

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true, // 标题居中
        ),
        body: const Placeholder(),
        bottomNavigationBar: SizedBox(
          height: 60,
          child: BottomNavigationBar(
            onTap: (index) {

            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '功能1',
                // activeIcon: _tabImages[i][1],
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people_rounded),
                label: '功能1',
                // activeIcon: _tabImages[i][1],
              ),
            ],
          ),
        ));
  }
}
