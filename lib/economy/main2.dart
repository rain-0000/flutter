import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'SideBarDemoPage.dart';
import 'SideBarIndustrialPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Default Sidebar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 30,
          backgroundColor: Colors.green,
          title: Text(
            "首页",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),
          ),
          centerTitle: true, // 标题居中
        ),
        body: LayoutBuilder(
          builder: (context, containers) {
            return Container(
              padding: EdgeInsets.all(10),
              height: containers.maxHeight,
              width: containers.maxWidth,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft, // 渐变起始点
                  end: Alignment.bottomRight, // 渐变结束点
                  colors: [
                    Colors.green[200]!, // 起始颜色
                    Colors.green[50]!, // 结束颜色
                  ],
                ),
              ),
              child:
              Wrap(
                alignment: WrapAlignment.spaceAround, // 确保所有行靠左对齐
                spacing: 10.0, // 子元素之间的间距
                runSpacing: 10.0, // 行之间的间距
                children: [
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: SvgPicture.asset(
                              "images/sw.svg",
                            ),
                          ),
                          Text(
                            "生物篇",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 15,
                                color: Colors.black54),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return SideBarDemoPage(
                              constraints: containers); //返回的是需要跳转单页面
                        },
                      ));
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: SvgPicture.asset(
                              "images/sw.svg",
                            ),
                          ),
                          Text(
                            "工业篇",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 15,
                                color: Colors.black54),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return SideBarIndustrialPage(
                              constraints: containers); //返回的是需要跳转单页面
                        },
                      ));
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: SvgPicture.asset(
                              "images/sw.svg",
                            ),
                          ),
                          Text(
                            "生物篇",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 15,
                                color: Colors.black54),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return SideBarDemoPage(
                              constraints: containers); //返回的是需要跳转单页面
                        },
                      ));
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      // decoration: BoxDecoration(
                      //   // color: Colors.grey,
                      //   borderRadius: BorderRadius.circular(10),
                      // ),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            // child: SvgPicture.asset(
                            //   "images/sw.svg",
                            // ),
                          ),
                          // Text(
                          //   "生物篇",
                          //   style: TextStyle(
                          //       fontWeight: FontWeight.w900,
                          //       fontSize: 15,
                          //       color: Colors.black54),
                          // )
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return SideBarDemoPage(
                              constraints: containers); //返回的是需要跳转单页面
                        },
                      ));
                    },
                  )
                ],
              )
            );
          },
        ));
  }
}
