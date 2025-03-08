import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gambling_spider/util/HtmlUtil.dart';
import 'package:provider/provider.dart';

class TwoColumnPage extends StatefulWidget {
  final BoxConstraints constraints;

  const TwoColumnPage({super.key, required this.constraints});

  @override
  State<StatefulWidget> createState() {
    return _TwoColumnPage();
  }
}

class _TwoColumnPage extends State<TwoColumnPage> {

  @override
  void initState() {
    super.initState();
  }

  Future<Map<String, Object>?> getData1() async {
    Dio dio = Dio();
    var response = await dio.get('https://m.55128.cn/zs/2_22.htm');
    if (response.statusCode == 200) {
      return getData1ByHtml(response.data);
    }
  }

  Future<Map<String, Object>?> getData2() async {
    Dio dio = Dio();
    var response2 = await dio.get('https://m.cz89.com/kaijiang/3d/sjh');
    if (response2.statusCode == 200) {
      return getData2ByHtml(response2.data);
    }
  }

  @override
  Widget build(BuildContext context) {
    double columnWidth = MediaQuery.of(context).size.width * 0.45;
    return Scaffold(
      appBar: AppBar(
        title: Text("页面1"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8,8,8,30),
        child: Row(
          children: [
            Spacer(),
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black12)),
              width: columnWidth,
              child: FutureProvider(
                  create: (context) => getData1(),
                  initialData: {"data": [], "threeCount": 0, "zusanCount": 0},
                  builder: (context, snapshot) {
                    Map<String, Object>? r = context.watch<Map<String, Object>?>();
                    if(r==null || r.isEmpty){
                      r={"data": [], "threeCount": 0, "zusanCount": 0};
                    }
                    List<dynamic> data =
                        r?["data"] as List<dynamic>;
                    int two1 = r?["threeCount"] as int;
                    int three1 = r?["zusanCount"] as int;
                    return Column(
                      children: [
                        Text(
                          "排列3",
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                        Container(
                          color: Color(0xff4cb050),
                          child: Table(
                            border: TableBorder.all(color: Colors.black),
                            columnWidths: const {
                              0: FlexColumnWidth(2), // 自适应宽度
                              1: FlexColumnWidth(1), // 自适应宽度
                              2: FlexColumnWidth(1), // 自适应宽度
                              3: FlexColumnWidth(0.8), // 自适应宽度
                              4: FlexColumnWidth(0.8), // 自适应宽度
                            },
                            children: [
                              TableRow(
                                children: [
                                  TableCell(
                                      child: Center(
                                          child: Text("期数"))),
                                  TableCell(
                                      child: Center(
                                          child: FittedBox(
                                              child: Text(maxLines: 1, "试机")))),
                                  TableCell(
                                      child: Center(
                                          child: FittedBox(
                                              child: Text(maxLines: 1, "奖号")))),
                                  TableCell(
                                      child: Center(
                                          child: FittedBox(
                                              child: Text(maxLines: 1, "二")))),
                                  TableCell(
                                      child: Center(
                                          child: FittedBox(
                                              child: Text(maxLines: 1, "三")))),
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            children: [
                              Table(
                                border: TableBorder.all(color: Colors.black),
                                // 表格边框
                                columnWidths: const {
                                  0: FlexColumnWidth(2), // 自适应宽度
                                  1: FlexColumnWidth(1), // 自适应宽度
                                  2: FlexColumnWidth(1), // 自适应宽度
                                  3: FlexColumnWidth(0.8), // 自适应宽度
                                  4: FlexColumnWidth(0.8), // 自适应宽度
                                },
                                children: [
                                  // 表格数据
                                  for (var row in data)
                                    TableRow(
                                      children: [
                                        TableCell(
                                            child: Center(
                                                child: Text(row["qs"]!))),
                                        TableCell(
                                            child: Center(
                                                child: Text(row["sj"]!))),
                                        TableCell(
                                            child: Center(
                                                child: Text(row["jh"]!))),
                                        TableCell(
                                            child: Center(
                                                child: Text(row["two"]!))),
                                        TableCell(
                                            child: Center(
                                                child: Text(row["three"]!))),
                                      ],
                                    ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Text("三对应出现次数：$two1"),
                        Text("组3应出现次数:$three1"),
                      ],
                    );
                  }),
            ),
            Spacer(),
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black12)),
              width: columnWidth,
              child: FutureProvider(
                create: (context) => getData2(),
                initialData: {"data": [], "threeCount": 0, "zusanCount": 0},
                child: Builder(builder: (context) {
                  Map<String, Object>? r =
                      context.watch<Map<String, Object>?>();
                  if(r==null || r.isEmpty){
                    r={"data": [], "threeCount": 0, "zusanCount": 0};
                  }
                  List<dynamic> data =
                      r?["data"] as List<dynamic>;

                  int two2 = r?["threeCount"] as int;
                  int three2 = r?["zusanCount"] as int;
                  return Column(
                    children: [
                      Text(
                        "3D",
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                      Container(
                        color: Color(0xff4cb050),
                        child: Table(
                          columnWidths: const {
                            0: FlexColumnWidth(2), // 自适应宽度
                            1: FlexColumnWidth(1), // 自适应宽度
                            2: FlexColumnWidth(1), // 自适应宽度
                            3: FlexColumnWidth(0.8), // 自适应宽度
                            4: FlexColumnWidth(0.8), // 自适应宽度
                          },
                          children: [
                            TableRow(
                              children: [
                                TableCell(
                                    child: Center(
                                        child: FittedBox(
                                            child: Text(maxLines: 1, "期数")))),
                                TableCell(
                                    child: Center(
                                        child: FittedBox(
                                            child: Text(maxLines: 1, "试机")))),
                                TableCell(
                                    child: Center(
                                        child: FittedBox(
                                            child: Text(maxLines: 1, "奖号")))),
                                TableCell(
                                    child: Center(
                                        child: FittedBox(
                                            child: Text(maxLines: 1, "二")))),
                                TableCell(
                                    child: Center(
                                        child: FittedBox(
                                            child: Text(maxLines: 1, "三")))),
                              ],
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            Table(
                              border: TableBorder.all(color: Colors.black),
                              // 表格边框
                              columnWidths: const {
                                0: FlexColumnWidth(2), // 自适应宽度
                                1: FlexColumnWidth(1), // 自适应宽度
                                2: FlexColumnWidth(1), // 自适应宽度
                                3: FlexColumnWidth(0.8), // 自适应宽度
                                4: FlexColumnWidth(0.8), // 自适应宽度
                              },
                              children: [
                                // 表格数据
                                for (var row in data)
                                  TableRow(
                                    children: [
                                      TableCell(
                                          child:
                                              Center(child: Text(row["qs"]!))),
                                      TableCell(
                                          child:
                                              Center(child: Text(row["sj"]!))),
                                      TableCell(
                                          child:
                                              Center(child: Text(row["jh"]!))),
                                      TableCell(
                                          child:
                                              Center(child: Text(row["two"]!))),
                                      TableCell(
                                          child: Center(
                                              child: Text(row["three"]!))),
                                    ],
                                  ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Text("三对应出现次数：$two2"),
                      Text("组3应出现次数:$three2")
                    ],
                  );
                }),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
