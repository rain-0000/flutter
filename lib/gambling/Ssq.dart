import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gambling_spider/util/SsqUtil.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class Ssq extends StatefulWidget {
  const Ssq({super.key, required this.constraints});

  final BoxConstraints constraints;

  @override
  State<Ssq> createState() => _SsqState();
}

class _SsqState extends State<Ssq> {
  String res_str = "";
  int res_count=0;
  int he_value = 0;
  UniqueKey he_key = UniqueKey();

  int fq1 = 0;
  UniqueKey fq1_key = UniqueKey();
  int fq2 = 0;
  UniqueKey fq2_key = UniqueKey();
  int fq3 = 0;
  UniqueKey fq3_key = UniqueKey();

  int dt1 = 0;
  UniqueKey dt1_key = UniqueKey();
  int dt2 = 0;
  UniqueKey dt2_key = UniqueKey();
  int dt3 = 0;
  UniqueKey dt3_key = UniqueKey();
  int dt4 = 0;
  UniqueKey dt4_key = UniqueKey();

  int kuadu = 0;
  UniqueKey kuadu_key = UniqueKey();

  void cz_he() {
    setState(() {
      he_value = 0;
      he_key = UniqueKey();
    });
  }

  void cz_fq() {
    setState(() {
      fq1 = 0;
      fq1_key = UniqueKey();
      fq2 = 0;
      fq2_key = UniqueKey();
      fq3 = 0;
      fq3_key = UniqueKey();
    });
  }

  void cz_dt() {
    setState(() {
      dt1 = 0;
      dt1_key = UniqueKey();
      dt2 = 0;
      dt2_key = UniqueKey();
      dt3 = 0;
      dt3_key = UniqueKey();
      dt4 = 0;
      dt4_key = UniqueKey();
    });
  }

  void cz_kuadu() {
    setState(() {
      kuadu = 0;
      kuadu_key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("双色球"),
        actions: [
          PopupMenuButton<int>(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 1,
                  child: Text('清空和值'),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text('清空分区数量'),
                ),
                PopupMenuItem(
                  value: 3,
                  child: Text('清空胆拖'),
                ),
                PopupMenuItem(
                  value: 4,
                  child: Text('清空跨度'),
                ),
                PopupMenuDivider(),
                PopupMenuItem(
                  value: 0,
                  child: Text('全部清空'),
                ),
              ];
            },
            onSelected: (value) {
              if (value == 1) {
                cz_he();
              } else if (value == 2) {
                cz_fq();
              } else if (value == 3) {
                cz_dt();
              } else if (value == 4) {
                cz_kuadu();
              } else if (value == 0) {
                cz_he();
                cz_fq();
                cz_dt();
                cz_kuadu();
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TDDivider(
              text: '和值输入（必填）',
              alignment: TextAlignment.center,
            ),
            SizedBox(
              height: 10,
            ),
            TDStepper(
              key: he_key,
              size: TDStepperSize.large,
              theme: TDStepperTheme.filled,
              // defaultValue: 0,
              value: he_value,
              onChange: (value) {
                setState(() {
                  he_value = value;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            TDDivider(
              text: '分区数量输入(从左到右1，2，3)',
              alignment: TextAlignment.center,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TDStepper(
                  key: fq1_key,
                  size: TDStepperSize.large,
                  theme: TDStepperTheme.filled,
                  onChange: (value) {
                    setState(() {
                      fq1 = value;
                    });
                  },
                ),
                TDStepper(
                  key: fq2_key,
                  size: TDStepperSize.large,
                  theme: TDStepperTheme.filled,
                  onChange: (value) {
                    setState(() {
                      fq2 = value;
                    });
                  },
                ),
                TDStepper(
                  key: fq3_key,
                  size: TDStepperSize.large,
                  theme: TDStepperTheme.filled,
                  onChange: (value) {
                    setState(() {
                      fq3 = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TDDivider(
              text: '胆拖数字输入',
              alignment: TextAlignment.center,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("数字1："),
                TDStepper(
                  key: dt1_key,
                  size: TDStepperSize.large,
                  theme: TDStepperTheme.filled,
                  onChange: (value) {
                    setState(() {
                      dt1 = value;
                    });
                  },
                ),
                Text("数字2："),
                TDStepper(
                  key: dt2_key,
                  size: TDStepperSize.large,
                  theme: TDStepperTheme.filled,
                  onChange: (value) {
                    setState(() {
                      dt2 = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("数字3："),
                TDStepper(
                  key: dt3_key,
                  size: TDStepperSize.large,
                  theme: TDStepperTheme.filled,
                  onChange: (value) {
                    setState(() {
                      dt3 = value;
                    });
                  },
                ),
                Text("数字4："),
                TDStepper(
                  key: dt4_key,
                  size: TDStepperSize.large,
                  theme: TDStepperTheme.filled,
                  onChange: (value) {
                    setState(() {
                      dt4 = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TDDivider(
              text: '跨度输入',
              alignment: TextAlignment.center,
            ),
            SizedBox(
              height: 10,
            ),
            TDStepper(
              key: kuadu_key,
              size: TDStepperSize.large,
              theme: TDStepperTheme.filled,
              onChange: (value) {
                setState(() {
                  kuadu = value;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            if(res_str!=null && res_str.trim().length>0)
            Text("结果总数：$res_count"),
            Expanded(
              child: Scrollbar(
                thickness: 6,
                interactive: true,
                thumbVisibility: true, // 始终显示滚动条

                child: ListView(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4.0),
                      width: MediaQuery.of(context).size.width * 0.85,
                      color: Colors.green,
                      child: Text(res_str),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: TDButton(
                onTap: () {
                  if (he_value > 0) {
                    List<List<int>> res = get_he(he_value);
                    if (res.isNotEmpty) {
                      // 筛选胆拖
                      if (dt1 > 0 ||
                          dt2 > 0 ||
                          dt3 > 0 ||
                          dt4 > 0 ||
                          kuadu > 0 ||
                          fq1 > 0 ||
                          fq2 > 0 ||
                          fq3 > 0) {
                        res = res.where((v) {
                          bool dt_res = true;
                          bool fq_res = true;
                          bool kuadu_res = true;
                          if (dt1 > 0 || dt2 > 0 || dt3 > 0 || dt4 > 0) {
                            if (dt1 > 0 && v.contains(dt1) == false) {
                              dt_res = false;
                            }
                            if (dt2 > 0 && v.contains(dt2) == false) {
                              dt_res = false;
                            }
                            if (dt3 > 0 && v.contains(dt3) == false) {
                              dt_res = false;
                            }
                            if (dt4 > 0 && v.contains(dt4) == false) {
                              dt_res = false;
                            }
                          }
                          if (kuadu > 0) {
                            int kuadu_count = (v[5] - v[4]) +
                                (v[4] - v[3]) +
                                (v[3] - v[2]) +
                                (v[2] - v[1]) +
                                (v[1] - v[0]);
                            if (kuadu != kuadu_count) {
                              kuadu_res = false;
                            }
                          }
                          if (fq1 > 0 || fq2 > 0 || fq3 > 0) {
                            Map<int, int> fq_count = {1: 0, 2: 0, 3: 0};
                            for (var x in v) {
                              if (1 <= x && x <= 11) {
                                fq_count[1] = (fq_count[1]! + 1)!;
                              } else if (12 <= x && x <= 22) {
                                fq_count[2] = (fq_count[2]! + 1)!;
                              } else if (23 <= x && x <= 33) {
                                fq_count[3] = (fq_count[3]! + 1)!;
                              }
                            }
                            if (fq1 > 0 && fq_count[1] != fq1) {
                              fq_res = false;
                            }
                            if (fq2 > 0 && fq_count[2] != fq1) {
                              fq_res = false;
                            }
                            if (fq3 > 0 && fq_count[3] != fq1) {
                              fq_res = false;
                            }
                          }
                          return dt_res && fq_res && kuadu_res;
                        }).toList();
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Center(child: Text('无数据！')),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    }
                    setState(() {
                      res_count=res.length;
                      res_str = res.join("\n");
                    });
                  }
                },
                text: '生成结果',
                size: TDButtonSize.small,
                type: TDButtonType.fill,
                shape: TDButtonShape.rectangle,
                theme: TDButtonTheme.primary,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: TDButton(
                onTap: () async {
                  Clipboard.setData(
                      ClipboardData(text: res_str.toString()));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Center(child: Text('复制成功！')),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                text: '复制结果',
                size: TDButtonSize.small,
                type: TDButtonType.fill,
                shape: TDButtonShape.rectangle,
                theme: TDButtonTheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
