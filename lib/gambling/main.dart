import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'FormulaPage.dart';
import 'FormulaPage2.dart';
import 'Page4.dart';
import 'Ssq.dart';
import 'TwoColumnPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '走势图'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _checkAuthValidity() {
    // 设置目标日期和时间
    DateTime targetDate = DateTime.parse("2025-01-12 06:00");

    // 获取当前日期和时间
    DateTime now = DateTime.now();

    // 判断当前时间是否超过目标时间
    if (now.isAfter(targetDate)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Center(child: Text('已过授权有效期！')),
          duration: Duration(seconds: 1),
        ),
      );

      // 2秒后退出应用程序
      Timer(Duration(seconds: 2), () {
        exit(0); // 退出应用程序
      });
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     behavior: SnackBarBehavior.floating,
      //     content: Center(child: Text("授权有效期内")),
      //     duration: Duration(seconds: 1),
      //   ),
      // );
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // _checkAuthValidity();
    });
  }
  final PageController pageController = PageController(initialPage: 2);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(
          child: Text(widget.title),
        ),
        toolbarHeight: 30,
      ),
      body: LayoutBuilder(builder: (context, containers) {
        return Center(child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 均匀分布
          children: [
          SizedBox(
            width: containers.maxWidth*0.8,
            height: 60,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return TwoColumnPage(constraints: containers);//返回的是需要跳转单页面
                      },)).then((value){});
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff0062ff),
                  //聚焦后的颜色
                  foregroundColor:Color(0xff0062ff),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // 设置圆角半径
                  ),
                  //边框颜色
                  side: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                child: Text('页面1',style: TextStyle(color: Colors.white),)
            ),
          ),
          SizedBox(
            width: containers.maxWidth*0.8,
            height: 60,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return FormulaPage(constraints: containers);//返回的是需要跳转单页面
                      },)).then((value){});
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff0062ff),
                  //聚焦后的颜色
                  foregroundColor:Color(0xff0062ff),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // 设置圆角半径
                  ),
                  //边框颜色
                  side: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                child: Text('页面2',style: TextStyle(color: Colors.white),)
            ),
          ),
          SizedBox(
            width: containers.maxWidth*0.8,
            height: 60,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return FormulaPage2(constraints: containers);//返回的是需要跳转单页面
                      },)).then((value){});
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff0062ff),
                  //聚焦后的颜色
                  foregroundColor:Color(0xff0062ff),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // 设置圆角半径
                  ),
                  //边框颜色
                  side: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                child: Text('页面3',style: TextStyle(color: Colors.white),)
            ),
          ),
          SizedBox(
            width: containers.maxWidth*0.8,
            height: 60,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return Page4(constraints: containers,);//返回的是需要跳转单页面
                      },)).then((value){});
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff0062ff),
                  //聚焦后的颜色
                  foregroundColor:Color(0xff0062ff),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // 设置圆角半径
                  ),
                  //边框颜色
                  side: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                child: Text('页面4',style: TextStyle(color: Colors.white),)
            ),
          ),
            SizedBox(
              width: containers.maxWidth*0.8,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return Ssq(constraints: containers,);//返回的是需要跳转单页面
                        },)).then((value){});
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff0062ff),
                    //聚焦后的颜色
                    foregroundColor:Color(0xff0062ff),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // 设置圆角半径
                    ),
                    //边框颜色
                    side: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  child: Text('双色球',style: TextStyle(color: Colors.white),)
              ),
            )
        ],));
        // return PageView(
        //   controller: pageController,
        //   children: [
        //     TwoColumnPage(
        //       constraints: containers,
        //     ),
        //     FormulaPage(constraints: containers),
        //     FormulaPage2(constraints: containers)
        //   ],
        // );
      }),
    );
  }
}
