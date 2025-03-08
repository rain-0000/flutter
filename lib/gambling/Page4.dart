import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gambling_spider/util/HtmlUtil.dart';
import 'package:provider/provider.dart';

class Page4 extends StatefulWidget {
  const Page4({super.key, required this.constraints});
  final BoxConstraints constraints;
  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  // 1是列，2是3d
  int type = 1;
  late Future<List<Map<String, String>>> getData;
  UniqueKey key=UniqueKey();
  void _refreshData() {
    setState(() {
      getData=getData2();
    });
  }

  @override
  void initState() {
    _refreshData();
  }

  Future<List<Map<String, String>>> getData2() async {

    Dio dio = Dio();
    String url= 'https://m.55128.cn/zs/2_22.htm';
    if(type==2){
      url='https://m.cz89.com/kaijiang/3d/sjh';
    }
    var response = await dio.get(url);

    if (response.statusCode == 200) {
      var r =null;
      if(type==1){
        r=getData1ByHtml(response.data,3)["data"] as List<Map<String, String>>;
      }else{
        r=getData2ByHtml(response.data,3)["data"] as List<Map<String, String>>;
      }

      return r;
    } else {
      return [];
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("页面4"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: widget.constraints.maxWidth * 0.7,
                  height: 30,
                  child: ElevatedButton(
                      onPressed: () {
                        if(type==1){
                          type=2;
                        }else{
                          type=1;
                        }
                        _refreshData();
                        key=UniqueKey();

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff0062ff),
                        //聚焦后的颜色
                        foregroundColor: Color(0xff0062ff),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0), // 设置圆角半径
                        ),
                        //边框颜色
                        side: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      child: Text(
                        '点击切换',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                Text("当前:"+(type==2?"3d":"排列3"))
              ],
            ),
            Container(
              color: Color(0xff4cb050),
              child: Table(
                border: TableBorder.all(color: Colors.black),
                columnWidths: const {
                  0: FlexColumnWidth(1.2), // 自适应宽度
                  1: FlexColumnWidth(1.2), // 自适应宽度
                  2: FlexColumnWidth(1.2), // 自适应宽度
                  // 3: FlexColumnWidth(), // 自适应宽度
                  // 4: FlexColumnWidth(0.8), // 自适应宽度
                },
                children: [
                  TableRow(
                    children: [
                      TableCell(child: Center(child: FittedBox(child: Text("期数")))),
                      TableCell(child: Center(child: FittedBox(child: Text("试机")))),
                      TableCell(child: Center(child: FittedBox(child: Text("奖号")))),
                      TableCell(child: Center(child: FittedBox(child: Text("公式1")))),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
                child: ListView(
                  children: [
                    FutureProvider<List<Map<String, String>>>(
                      key: key,
                      builder: (context, snapshot) {
                        List<Map<String, String>> r =
                        context.watch<List<Map<String, String>>>();

                        return Table(
                            columnWidths: const {
                              0: FlexColumnWidth(1.2), // 自适应宽度
                              1: FlexColumnWidth(1.2), // 自适应宽度
                              2: FlexColumnWidth(1.2), // 自适应宽度
                              // 3: FlexColumnWidth(), // 自适应宽度
                              // 4: FlexColumnWidth(0.8), // 自适应宽度
                            },
                            border: TableBorder.all(color: Colors.black),
                            children: [
                              for (var row in r)
                                TableRow(children: [
                                  TableCell(
                                    child: Text(row["qs"]!),
                                  ),
                                  TableCell(
                                    child: Text(row["sj"]!),
                                  ),
                                  TableCell(
                                    child: Text(row["jh"]!),
                                  ),
                                  TableCell(
                                    child: Text(row["gs1"]!),
                                  ),
                                ])
                            ]);
                      },
                      create: (context) => getData,
                      initialData: [],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
