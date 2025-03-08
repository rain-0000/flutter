import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

// 05 16 27 38 49
Map<int, int> dict = {
  0: 5,
  5: 0,
  1: 6,
  6: 1,
  2: 7,
  7: 2,
  3: 8,
  8: 3,
  4: 9,
  9: 4
};

// 0-5尾=2378/1469 1-6尾=3489/0257    2-7尾=0459/1368   3-8尾=0156/2479 4-9尾=1267/0358
Map<String, List<String>> dict2 = {
  "0": ["1289", "3467"],
  "5": ["1289", "3467"],
  "1": ["0239", "4578"],
  "6": ["0239", "4578"],
  "2": ["0134", "5689"],
  "7": ["0134", "5689"],
  "3": ["0679", "1245"],
  "8": ["0679", "1245"],
  "4": ["0178", "2356"],
  "9": ["0178", "2356"],
};

String getAddGw(String jh) {
  return ((int.parse(jh[0]) + int.parse(jh[1]) + int.parse(jh[2])) % 10)
      .toString();
}

//
List<String> getPlzh(List<int> data) {
  // return data[0].toString()+data[1].toString()+"\n"+data[1].toString()+data[2].toString()+"\n"+data[0].toString()+data[2].toString();
  return [
    data[0].toString() + data[1].toString(),
    data[1].toString() + data[2].toString(),
    data[0].toString() + data[2].toString()
  ];
  // +"\n"+data[1].toString()+data[2].toString()+"\n"+data[0].toString()+data[2].toString();
}

List<String> getPlzh2(List<int> data) {
  // return data[0].toString()+data[1].toString()+"\n"+data[1].toString()+data[2].toString()+"\n"+data[0].toString()+data[2].toString();
  return [
    data[0].toString() + data[1].toString(),
    data[1].toString() + data[2].toString(),
    data[0].toString() + data[2].toString(),
    data[1].toString() + data[0].toString(),
    data[2].toString() + data[1].toString(),
    data[2].toString() + data[0].toString(),
  ];
  // +"\n"+data[1].toString()+data[2].toString()+"\n"+data[0].toString()+data[2].toString();
}

Map<String, Object> getData1ByHtml(String htmlContent, [type = 0]) {
  int threeCount = 0;
  int zusanCount = 0;
  Document document = parse(htmlContent);

  // 获取标题
  Element? table = document.querySelector('table');
  List<Map<String, String>> tableData = [];

  // 遍历每一行 (<tr>)
  for (var row in table!.querySelectorAll('tr')) {
    // 跳过表头
    if (row.querySelector('th') != null) {
      continue;
    }

    // 提取每一列 (<td>)
    var columns = row.querySelectorAll('td');
    if (columns.length >= 3) {
      String qh = columns[0].text; // 第一列
      String sj = columns[1].text; // 第二列
      String jh = columns[2].text; // 第三列
      String two = "";
      String three = "";
      if (type == 0) {
        if (jh != null && jh.length == 3) {
          Set<int> res = {};
          List<int> numbers =
              jh.split("").map((char) => int.parse(char)).toList();
          for (var value in numbers) {
            if (res.contains(value)) {
              zusanCount++;
            }
            if (res.contains(dict[value])) {
            } else {
              res.add(value);
            }
          }
          if (res.length == 2) {
            two = "2";
          } else if (res.length == 3) {
            three = "3";
            threeCount++;
          }
        }
      }

      // 将数据存储为 Map
      if (qh == '010') {
        tableData.insert(
            0, {'qs': qh, 'sj': sj, 'jh': jh, "two": two, "three": three});
      } else {
        // 将数据存储为 Map
        tableData
            .add({'qs': qh, 'sj': sj, 'jh': jh, "two": two, "three": three});
      }
    }
  }
  tableData.sort((a, b) {
    String qsA = a["qs"]!;
    String qsB = b["qs"]!;

    // 判断是否以 0 开头
    bool isAStartsWithZero = qsA.startsWith('0');
    bool isBStartsWithZero = qsB.startsWith('0');

    // 如果 a 以 0 开头而 b 不以 0 开头，a 排在前面
    if (isAStartsWithZero && !isBStartsWithZero) {
      return -1;
    }
    // 如果 b 以 0 开头而 a 不以 0 开头，b 排在前面
    if (!isAStartsWithZero && isBStartsWithZero) {
      return 1;
    }

    // 如果两者都以 0 开头或都不以 0 开头，按数字从大到小排序
    int numA = int.parse(qsA);
    int numB = int.parse(qsB);
    return numB.compareTo(numA); // 从大到小排序
  });
  if (tableData[0]["jh"]!.length == 3 && type != 0) {
    int maxQs = int.parse(tableData[0]["qs"]!);
    tableData.insert(0, {
      "qs": maxQs.toString().length == 3
          ? maxQs.toString()
          : "0" + maxQs.toString(),
      "sj": "-",
      "jh": "-",
      "tow": "",
      "three": ""
    });
  }
  if (type == 1) {
    int index = 0;
    for (index; index < tableData.length; index++) {
      /**公式1 */
      if (index < tableData.length - 2 &&
          tableData[index + 2]["jh"]?.length == 3 &&
          tableData[index + 1]["jh"]?.length == 3) {
        // 上上期期号
        var ssqqh = tableData[index + 2]["jh"];
        // 上期
        var sqqh = tableData[index + 1]["jh"];
        var ssq_gw = ssqqh?[2];
        var sq_gw = sqqh?[2];
        var sq_sw = sqqh?[1];
        var ssq_sw = ssqqh?[1];
        var sq_bw = sqqh?[0];
        var ssq_bw = ssqqh?[0];

        var bw_he = ((int.parse(ssq_bw!) + int.parse(sq_bw!)) % 10).toString() +
            (int.parse(ssq_bw) - int.parse(sq_bw)).abs().toString();
        var sw_he = ((int.parse(ssq_sw!) + int.parse(sq_sw!)) % 10).toString() +
            (int.parse(ssq_sw) - int.parse(sq_sw)).abs().toString();
        var gw_he = ((int.parse(ssq_gw!) + int.parse(sq_gw!)) % 10).toString() +
            (int.parse(ssq_gw) - int.parse(sq_gw)).abs().toString();
        var gs1Res = "√";
        var yyy = [bw_he, sw_he, gw_he];
        if (tableData[index]["jh"] != null &&
            tableData[index]["jh"]?.length == 3) {
          for (var x in yyy) {
            // if (tableData[index]["jh"]!.contains(x)) {
            //   gs1Res = "x";
            //   break;
            // }
            if(containsAtLeastTwo(tableData[index]["jh"]!,[int.parse(x[0]),int.parse(x[1])])){
              gs1Res = "x";
              break;
            }
          }
        }
        tableData[index]["gs1"] = yyy.join("\n") + "\n" + gs1Res;
      } else {
        tableData[index]["gs1"] = "";
      }

      if (index < tableData.length - 1 &&
          tableData[index + 1]["jh"]?.length == 3) {
        var sqqh = tableData[index + 1]["jh"];
        /**公式2*/
        var sq_sw = int.parse(sqqh![1]);
        var sq_he =
        getPlzh([(sq_sw + 1) % 10, (sq_sw - 1).abs(), (sq_sw + 2) % 10]);
        var gs2Res = "√";
        if (tableData[index]["jh"] != null &&
            tableData[index]["jh"]?.length == 3) {
          for (var x in sq_he) {
            // if (tableData[index]["jh"]!.contains(x)) {
            //   gs2Res = "x";
            //   break;
            // }
            if(containsAtLeastTwo(tableData[index]["jh"]!,[int.parse(x[0]),int.parse(x[1])])){
              gs2Res = "x";
              break;
            }
          }
        }
        tableData[index]["gs2"] = sq_he.join("\n") + "\n" + gs2Res;
        /** 公式3*/
        var gs3_he = getPlzh(
            [int.parse(sqqh[0]), int.parse(sqqh[1]), int.parse(sqqh[2])]);
        var gs3Res = "√";
        if (tableData[index]["jh"] != null &&
            tableData[index]["jh"]?.length == 3) {
          for (var x in gs3_he) {
            // if (tableData[index]["jh"]!.contains(x)) {
            //   gs3Res = "x";
            //   break;
            // }
            if(containsAtLeastTwo(tableData[index]["jh"]!,[int.parse(x[0]),int.parse(x[1])])){
              gs3Res = "x";
              break;
            }
          }
        }
        tableData[index]["gs3"] = gs3_he.join("\n") + "\n" + gs3Res;
        /** 公式4*/
        var gs4_he = getPlzh([
          dict[int.parse(sqqh[0])]!,
          dict[int.parse(sqqh[1])]!,
          dict[int.parse(sqqh[2])]!
        ]);
        var gs4Res = "√";
        if (tableData[index]["jh"] != null &&
            tableData[index]["jh"]?.length == 3) {
          for (var x in gs4_he) {
            // if (tableData[index]["jh"]!.contains(x)) {
            //   gs4Res = "x";
            //   break;
            // }
            if(containsAtLeastTwo(tableData[index]["jh"]!,[int.parse(x[0]),int.parse(x[1])])){
              gs4Res = "x";
              break;
            }
          }
        }
        tableData[index]["gs4"] = gs4_he.join("\n") + "\n" + gs4Res;
        /**公式5*/
        var gs5_he = (int.parse(sqqh![2]) * 3) % 10;
        var gs5Res = "√";
        if (tableData[index]["jh"] != null &&
            tableData[index]["jh"]?.length == 3) {
          if (tableData[index]["jh"]!.contains(gs5_he.toString())) {
            gs5Res = "x";
          }
        }
        tableData[index]["gs5"] = gs5_he.toString() + "\n" + gs5Res;
        /**杀本期*/
        var sbq = tableData[index]["qs"]?.substring(1, 3);
        var sbqRes = "√";
        if (tableData[index]["jh"] != null &&
            tableData[index]["jh"]?.length == 3) {
          if (tableData[index]["jh"]!.contains(sbq.toString())) {
            sbqRes = "x";
          }
        }
        tableData[index]["sbq"] = sbq! + "\n" + sbqRes;
        /**公式7*/
        var sq_gw = int.parse(sqqh![2]);
        var gs7 =
        getPlzh([(sq_gw + 1) % 10, (sq_gw - 1).abs(), (sq_gw + 2) % 10]);
        var gs7Res = "√";
        if (tableData[index]["jh"] != null &&
            tableData[index]["jh"]?.length == 3) {
          for (var x in gs7) {
            // if (tableData[index]["jh"]!.contains(x)) {
            //   gs7Res = "x";
            //   break;
            // }
            if(containsAtLeastTwo(tableData[index]["jh"]!,[int.parse(x[0]),int.parse(x[1])])){
              gs7Res = "x";
              break;
            }
          }
        }
        tableData[index]["gs7"] = gs7!.join("\n") + "\n" + gs7Res;
      } else {
        tableData[index]["gs2"] = "";
        tableData[index]["gs3"] = "";
        tableData[index]["gs4"] = "";
        tableData[index]["gs5"] = "";
        tableData[index]["sbq"] = "";
        tableData[index]["gs7"] = "";
      }
    }
  } else if (type == 2) {
    int index = 0;
    for (index; index < tableData.length; index++) {
      /**
       * gs1
       */
      if (index < tableData.length - 1 &&
          tableData[index + 1]["jh"]?.length == 3) {
        var sq_jh = tableData[index + 1]["jh"];
        var gs1res = "√";
        var gs1_he =
            ((int.parse(sq_jh![0]) + int.parse(sq_jh![2])) % 10).toString();
        if (tableData[index]["jh"]?.length == 3 &&
            getAddGw(tableData[index]["jh"]!) == gs1_he) {
          gs1res = "x";
        }
        tableData[index]["gs1"] = gs1_he + "\n" + gs1res;
      } else {
        tableData[index]["gs1"] = "";
      }
      /**
       * gs2
       */
      if (index < tableData.length - 1 &&
          tableData[index + 1]["jh"]?.length == 3) {
        var sq_jh = tableData[index + 1]["jh"];
        var gs2res = "√";

        List<int>? numbers =
            sq_jh!.split('').map((char) => int.parse(char)).toList();

        // 找到最大数字和最小数字
        int maxNumber = numbers.reduce((a, b) => a > b ? a : b);
        int minNumber = numbers.reduce((a, b) => a < b ? a : b);
        var gs2_he = (maxNumber - minNumber).abs().toString();
        if (tableData[index]["jh"]?.length == 3 &&
            getAddGw(tableData[index]["jh"]!) == gs2_he) {
          gs2res = "x";
        }
        tableData[index]["gs2"] = gs2_he + "\n" + gs2res;
      } else {
        tableData[index]["gs2"] = "";
      }
      /**
       * gs3
       */
      if (index < tableData.length - 1 &&
          tableData[index + 1]["jh"]?.length == 3) {
        var sq_jh = tableData[index + 1]["jh"];
        var gs3res = "√";

        List<int>? numbers =
            sq_jh!.split('').map((char) => int.parse(char)).toList();

        var gs3_he = (((numbers[0] - numbers[1]).abs() +
                    (numbers[1] - numbers[2]).abs() +
                    (numbers[0] - numbers[2]).abs()) %
                10)
            .toString();
        if (tableData[index]["jh"]?.length == 3 &&
            getAddGw(tableData[index]["jh"]!) == gs3_he) {
          gs3res = "x";
        }
        tableData[index]["gs3"] = gs3_he + "\n" + gs3res;
      } else {
        tableData[index]["gs3"] = "";
      }
      /**
       * gs4
       */
      if (index < tableData.length - 1 &&
          tableData[index + 1]["jh"]?.length == 3) {
        var sq_jh = tableData[index + 1]["jh"];
        var gs4res = "√";

        List<int>? numbers =
            sq_jh!.split('').map((char) => int.parse(char)).toList();
        var gs4_he = (((numbers[0] + numbers[1]).abs() +
                    (numbers[1] + numbers[2]).abs() +
                    (numbers[0] + numbers[2]).abs()) %
                10)
            .toString();
        if (tableData[index]["jh"]?.length == 3 &&
            getAddGw(tableData[index]["jh"]!) == gs4_he) {
          gs4res = "x";
        }
        tableData[index]["gs4"] = gs4_he + "\n" + gs4res;
      } else {
        tableData[index]["gs4"] = "";
      }
      /**
       * gs5
       */
      if (index < tableData.length - 2 &&
          tableData[index + 2]["jh"]?.length == 3 &&
          tableData[index + 1]["jh"]?.length == 3) {
        var sq_jh = tableData[index + 1]["jh"];
        var ssq_jh = tableData[index + 2]["jh"];
        var gs5res = "√";

        var gs5_he = ((int.parse(ssq_jh![2]) + int.parse(sq_jh![2]) + 1) % 10)
            .toString();
        if (tableData[index]["jh"]?.length == 3 &&
            getAddGw(tableData[index]["jh"]!) == gs5_he) {
          gs5res = "x";
        }
        tableData[index]["gs5"] = gs5_he + "\n" + gs5res;
      } else {
        tableData[index]["gs5"] = "";
      }
      /**
       * 杀和尾
       */
      if (index < tableData.length - 1 &&
          tableData[index + 1]["jh"]?.length == 3) {
        var sq_jh = tableData[index + 1]["jh"];
        List<int>? numbers =
            sq_jh!.split('').map((char) => int.parse(char)).toList();
        var sq_he_gw = ((numbers[0] + numbers[1] + numbers[2]) % 10).toString();
        var sq_res = "√";
        if (tableData[index]["jh"]?.length == 3 ) {
          var current_jh_data=tableData[index]["jh"];
          var current_jh_array=current_jh_data!.split('').map((char) => int.parse(char)).toList();
          var current_hzw=((current_jh_array[0] + current_jh_array[1] + current_jh_array[2]) % 10).toString();
          if(current_hzw==sq_he_gw) {
            sq_res = "x";
          }
        }

        tableData[index]["shw"] = sq_he_gw + "\n" + sq_res;
      } else {
        tableData[index]["shw"] = "";
      }
    }
  } else if (type == 3) {
    int index = 0;
    for (index; index < tableData.length; index++) {
      if (index < tableData.length - 1 &&
          tableData[index + 1]["jh"]?.length == 3) {
        var sq_jh = tableData[index + 1]["jh"];
        List<int>? numbers =
            sq_jh!.split('').map((char) => int.parse(char)).toList();
        var sq_he_gw = ((numbers[0] + numbers[1] + numbers[2]) % 10).toString();
        var sq_dict = dict2[sq_he_gw];
        var gs1 = sq_dict?.join("/");
        var res = "x";
        if (tableData[index]["jh"] != null &&
            tableData[index]["jh"]?.length == 3) {
          var sqqh = tableData[index]["jh"];
          var xxx = [
            dict[int.parse(sqqh![0])]!,
            dict[int.parse(sqqh[1])]!,
            dict[int.parse(sqqh[2])]!
          ];
          if (containsAtLeastTwo(sq_dict![0], xxx) ||
              containsAtLeastTwo(sq_dict![1], xxx)) {
            res = "√";
          }
        }
        tableData[index]["gs1"] = "$gs1\n$res";
      } else {
        tableData[index]["gs1"] = "";
      }
    }
  }

  return {
    "data": tableData,
    "threeCount": threeCount,
    "zusanCount": zusanCount
  };
}

bool containsAtLeastTwo(String input, List<int> numbers) {
  // 将输入字符串转换为字符集合
  Set<String> inputDigits = input.split('').toSet();

  // 将传入的数字列表转换为字符串集合
  Set<String> targetDigits = numbers.map((number) => number.toString()).toSet();

  // 计算两个集合的交集
  Set<String> intersection = inputDigits.intersection(targetDigits);

  // 如果交集的长度大于等于2，返回true
  return intersection.length >= 2;
}

/**
 * 3d数据
 */
Map<String, Object> getData2ByHtml(String htmlContent, [type = 0]) {
  int threeCount = 0;
  int zusanCount = 0;
  Document document = parse(htmlContent);

  // 获取标题
  Element? table = document.querySelector('table');
  List<Map<String, String>> tableData = [];

  // 遍历每一行 (<tr>)
  for (var row in table!.querySelectorAll('tr')) {
    // 跳过表头
    if (row.querySelector('th') != null) {
      continue;
    }

    // 提取每一列 (<td>)
    var columns = row.querySelectorAll('td');
    if (columns.length >= 3) {
      String qh = columns[0].text; // 第一列
      String sj = columns[1].text; // 第二列
      String jh = columns[3].text; // 第三列
      String two = "";
      String three = "";
      if (type == 0) {
        if (jh != null && jh.length == 3) {
          Set<int> res = {};
          List<int> numbers =
              jh.split("").map((char) => int.parse(char)).toList();
          for (var value in numbers) {
            if (res.contains(value)) {
              zusanCount++;
            }
            if (res.contains(dict[value])) {
            } else {
              res.add(value);
            }
          }
          if (res.length == 2) {
            two = "2";
          } else if (res.length == 3) {
            three = "3";
            threeCount++;
          }
        }
      }
      if (qh == '010') {
        tableData.insert(
            0, {'qs': qh, 'sj': sj, 'jh': jh, "two": two, "three": three});
      } else {
        // 将数据存储为 Map
        tableData
            .add({'qs': qh, 'sj': sj, 'jh': jh, "two": two, "three": three});
      }
    }
  }
  tableData.sort((a, b) {
    String qsA = a["qs"]!;
    String qsB = b["qs"]!;

    // 判断是否以 0 开头
    bool isAStartsWithZero = qsA.startsWith('0');
    bool isBStartsWithZero = qsB.startsWith('0');

    // 如果 a 以 0 开头而 b 不以 0 开头，a 排在前面
    if (isAStartsWithZero && !isBStartsWithZero) {
      return -1;
    }
    // 如果 b 以 0 开头而 a 不以 0 开头，b 排在前面
    if (!isAStartsWithZero && isBStartsWithZero) {
      return 1;
    }

    // 如果两者都以 0 开头或都不以 0 开头，按数字从大到小排序
    int numA = int.parse(qsA);
    int numB = int.parse(qsB);
    return numB.compareTo(numA); // 从大到小排序
  });
  if (tableData[0]["jh"]!.length == 3 && type != 0) {
    int maxQs = int.parse(tableData[0]["qs"]!);
    tableData.insert(0, {
      "qs": maxQs.toString().length == 3
          ? maxQs.toString()
          : "0" + maxQs.toString(),
      "sj": "-",
      "jh": "-",
      "tow": "",
      "three": ""
    });
  }
  if (type == 1) {
    int index = 0;
    for (index; index < tableData.length; index++) {
      /**公式1 */
      if (index < tableData.length - 2 &&
          tableData[index + 2]["jh"]?.length == 3 &&
          tableData[index + 1]["jh"]?.length == 3) {
        // 上上期期号
        var ssqqh = tableData[index + 2]["jh"];
        // 上期
        var sqqh = tableData[index + 1]["jh"];
        var ssq_gw = ssqqh?[2];
        var sq_gw = sqqh?[2];
        var sq_sw = sqqh?[1];
        var ssq_sw = ssqqh?[1];
        var sq_bw = sqqh?[0];
        var ssq_bw = ssqqh?[0];

        var bw_he = ((int.parse(ssq_bw!) + int.parse(sq_bw!)) % 10).toString() +
            (int.parse(ssq_bw) - int.parse(sq_bw)).abs().toString();
        var sw_he = ((int.parse(ssq_sw!) + int.parse(sq_sw!)) % 10).toString() +
            (int.parse(ssq_sw) - int.parse(sq_sw)).abs().toString();
        var gw_he = ((int.parse(ssq_gw!) + int.parse(sq_gw!)) % 10).toString() +
            (int.parse(ssq_gw) - int.parse(sq_gw)).abs().toString();
        var gs1Res = "√";
        var yyy = [bw_he, sw_he, gw_he];
        if (tableData[index]["jh"] != null &&
            tableData[index]["jh"]?.length == 3) {
          for (var x in yyy) {
            // if (tableData[index]["jh"]!.contains(x)) {
            //   gs1Res = "x";
            //   break;
            // }
            if(containsAtLeastTwo(tableData[index]["jh"]!,[int.parse(x[0]),int.parse(x[1])])){
              gs1Res = "x";
              break;
            }
          }
        }
        tableData[index]["gs1"] = yyy.join("\n") + "\n" + gs1Res;
      } else {
        tableData[index]["gs1"] = "";
      }

      if (index < tableData.length - 1 &&
          tableData[index + 1]["jh"]?.length == 3) {
        var sqqh = tableData[index + 1]["jh"];
        /**公式2*/
        var sq_sw = int.parse(sqqh![1]);
        var sq_he =
        getPlzh([(sq_sw + 1) % 10, (sq_sw - 1).abs(), (sq_sw + 2) % 10]);
        var gs2Res = "√";
        if (tableData[index]["jh"] != null &&
            tableData[index]["jh"]?.length == 3) {
          for (var x in sq_he) {
            // if (tableData[index]["jh"]!.contains(x)) {
            //   gs2Res = "x";
            //   break;
            // }
            if(containsAtLeastTwo(tableData[index]["jh"]!,[int.parse(x[0]),int.parse(x[1])])){
              gs2Res = "x";
              break;
            }
          }
        }
        tableData[index]["gs2"] = sq_he.join("\n") + "\n" + gs2Res;
        /** 公式3*/
        var gs3_he = getPlzh(
            [int.parse(sqqh[0]), int.parse(sqqh[1]), int.parse(sqqh[2])]);
        var gs3Res = "√";
        if (tableData[index]["jh"] != null &&
            tableData[index]["jh"]?.length == 3) {
          for (var x in gs3_he) {
            // if (tableData[index]["jh"]!.contains(x)) {
            //   gs3Res = "x";
            //   break;
            // }
            if(containsAtLeastTwo(tableData[index]["jh"]!,[int.parse(x[0]),int.parse(x[1])])){
              gs3Res = "x";
              break;
            }
          }
        }
        tableData[index]["gs3"] = gs3_he.join("\n") + "\n" + gs3Res;
        /** 公式4*/
        var gs4_he = getPlzh([
          dict[int.parse(sqqh[0])]!,
          dict[int.parse(sqqh[1])]!,
          dict[int.parse(sqqh[2])]!
        ]);
        var gs4Res = "√";
        if (tableData[index]["jh"] != null &&
            tableData[index]["jh"]?.length == 3) {
          for (var x in gs4_he) {
            // if (tableData[index]["jh"]!.contains(x)) {
            //   gs4Res = "x";
            //   break;
            // }
            if(containsAtLeastTwo(tableData[index]["jh"]!,[int.parse(x[0]),int.parse(x[1])])){
              gs4Res = "x";
              break;
            }
          }
        }
        tableData[index]["gs4"] = gs4_he.join("\n") + "\n" + gs4Res;
        /**公式5*/
        var gs5_he = (int.parse(sqqh![2]) * 3) % 10;
        var gs5Res = "√";
        if (tableData[index]["jh"] != null &&
            tableData[index]["jh"]?.length == 3) {
          if (tableData[index]["jh"]!.contains(gs5_he.toString())) {
            gs5Res = "x";
          }
        }
        tableData[index]["gs5"] = gs5_he.toString() + "\n" + gs5Res;
        /**杀本期*/
        var sbq = tableData[index]["qs"]?.substring(1, 3);
        var sbqRes = "√";
        if (tableData[index]["jh"] != null &&
            tableData[index]["jh"]?.length == 3) {
          if (tableData[index]["jh"]!.contains(sbq.toString())) {
            sbqRes = "x";
          }
        }
        tableData[index]["sbq"] = sbq! + "\n" + sbqRes;
        /**公式7*/
        var sq_gw = int.parse(sqqh![2]);
        var gs7 =
        getPlzh([(sq_gw + 1) % 10, (sq_gw - 1).abs(), (sq_gw + 2) % 10]);
        var gs7Res = "√";
        if (tableData[index]["jh"] != null &&
            tableData[index]["jh"]?.length == 3) {
          for (var x in gs7) {
            // if (tableData[index]["jh"]!.contains(x)) {
            //   gs7Res = "x";
            //   break;
            // }
            if(containsAtLeastTwo(tableData[index]["jh"]!,[int.parse(x[0]),int.parse(x[1])])){
              gs7Res = "x";
              break;
            }
          }
        }
        tableData[index]["gs7"] = gs7!.join("\n") + "\n" + gs7Res;
      } else {
        tableData[index]["gs2"] = "";
        tableData[index]["gs3"] = "";
        tableData[index]["gs4"] = "";
        tableData[index]["gs5"] = "";
        tableData[index]["sbq"] = "";
        tableData[index]["gs7"] = "";
      }
    }
  }
  else if (type == 2) {
    int index = 0;
    for (index; index < tableData.length; index++) {
      /**
       * gs1
       */
      if (index < tableData.length - 1 &&
          tableData[index + 1]["jh"]?.length == 3) {
        var sq_jh = tableData[index + 1]["jh"];
        var gs1res = "√";
        var gs1_he =
        ((int.parse(sq_jh![0]) + int.parse(sq_jh![2])) % 10).toString();
        if (tableData[index]["jh"]?.length == 3 &&
            getAddGw(tableData[index]["jh"]!) == gs1_he) {
          gs1res = "x";
        }
        tableData[index]["gs1"] = gs1_he + "\n" + gs1res;
      } else {
        tableData[index]["gs1"] = "";
      }
      /**
       * gs2
       */
      if (index < tableData.length - 1 &&
          tableData[index + 1]["jh"]?.length == 3) {
        var sq_jh = tableData[index + 1]["jh"];
        var gs2res = "√";

        List<int>? numbers =
        sq_jh!.split('').map((char) => int.parse(char)).toList();

        // 找到最大数字和最小数字
        int maxNumber = numbers.reduce((a, b) => a > b ? a : b);
        int minNumber = numbers.reduce((a, b) => a < b ? a : b);
        var gs2_he = (maxNumber - minNumber).abs().toString();
        if (tableData[index]["jh"]?.length == 3 &&
            getAddGw(tableData[index]["jh"]!) == gs2_he) {
          gs2res = "x";
        }
        tableData[index]["gs2"] = gs2_he + "\n" + gs2res;
      } else {
        tableData[index]["gs2"] = "";
      }
      /**
       * gs3
       */
      if (index < tableData.length - 1 &&
          tableData[index + 1]["jh"]?.length == 3) {
        var sq_jh = tableData[index + 1]["jh"];
        var gs3res = "√";

        List<int>? numbers =
        sq_jh!.split('').map((char) => int.parse(char)).toList();

        var gs3_he = (((numbers[0] - numbers[1]).abs() +
            (numbers[1] - numbers[2]).abs() +
            (numbers[0] - numbers[2]).abs()) %
            10)
            .toString();
        if (tableData[index]["jh"]?.length == 3 &&
            getAddGw(tableData[index]["jh"]!) == gs3_he) {
          gs3res = "x";
        }
        tableData[index]["gs3"] = gs3_he + "\n" + gs3res;
      } else {
        tableData[index]["gs3"] = "";
      }
      /**
       * gs4
       */
      if (index < tableData.length - 1 &&
          tableData[index + 1]["jh"]?.length == 3) {
        var sq_jh = tableData[index + 1]["jh"];
        var gs4res = "√";

        List<int>? numbers =
        sq_jh!.split('').map((char) => int.parse(char)).toList();
        var gs4_he = (((numbers[0] + numbers[1]).abs() +
            (numbers[1] + numbers[2]).abs() +
            (numbers[0] + numbers[2]).abs()) %
            10)
            .toString();
        if (tableData[index]["jh"]?.length == 3 &&
            getAddGw(tableData[index]["jh"]!) == gs4_he) {
          gs4res = "x";
        }
        tableData[index]["gs4"] = gs4_he + "\n" + gs4res;
      } else {
        tableData[index]["gs4"] = "";
      }
      /**
       * gs5
       */
      if (index < tableData.length - 2 &&
          tableData[index + 2]["jh"]?.length == 3 &&
          tableData[index + 1]["jh"]?.length == 3) {
        var sq_jh = tableData[index + 1]["jh"];
        var ssq_jh = tableData[index + 2]["jh"];
        var gs5res = "√";

        var gs5_he = ((int.parse(ssq_jh![2]) + int.parse(sq_jh![2]) + 1) % 10)
            .toString();
        if (tableData[index]["jh"]?.length == 3 &&
            getAddGw(tableData[index]["jh"]!) == gs5_he) {
          gs5res = "x";
        }
        tableData[index]["gs5"] = gs5_he + "\n" + gs5res;
      } else {
        tableData[index]["gs5"] = "";
      }
      /**
       * 杀和尾
       */
      if (index < tableData.length - 1 &&
          tableData[index + 1]["jh"]?.length == 3) {
        var sq_jh = tableData[index + 1]["jh"];
        List<int>? numbers =
        sq_jh!.split('').map((char) => int.parse(char)).toList();
        var sq_he_gw = ((numbers[0] + numbers[1] + numbers[2]) % 10).toString();
        var sq_res = "√";
        if (tableData[index]["jh"]?.length == 3 ) {
          var current_jh_data=tableData[index]["jh"];
          var current_jh_array=current_jh_data!.split('').map((char) => int.parse(char)).toList();
          var current_hzw=((current_jh_array[0] + current_jh_array[1] + current_jh_array[2]) % 10).toString();
          if(current_hzw==sq_he_gw) {
            sq_res = "x";
          }
        }

        tableData[index]["shw"] = sq_he_gw + "\n" + sq_res;
      } else {
        tableData[index]["shw"] = "";
      }
    }
  } else if (type == 3) {
    int index = 0;
    for (index; index < tableData.length; index++) {
      if (index < tableData.length - 1 &&
          tableData[index + 1]["jh"]?.length == 3) {
        var sq_jh = tableData[index + 1]["jh"];
        List<int>? numbers =
            sq_jh!.split('').map((char) => int.parse(char)).toList();
        var sq_he_gw = ((numbers[0] + numbers[1] + numbers[2]) % 10).toString();
        var sq_dict = dict2[sq_he_gw];
        var gs1 = sq_dict?.join("/");
        var res = "x";
        if (tableData[index]["jh"] != null &&
            tableData[index]["jh"]?.length == 3) {
          var sqqh = tableData[index]["jh"];
          var xxx = [
            dict[int.parse(sqqh![0])]!,
            dict[int.parse(sqqh[1])]!,
            dict[int.parse(sqqh[2])]!
          ];
          if (containsAtLeastTwo(sq_dict![0], xxx) ||
              containsAtLeastTwo(sq_dict![1], xxx)) {
            res = "√";
          }
        }
        tableData[index]["gs1"] = "$gs1\n$res";
      } else {
        tableData[index]["gs1"] = "";
      }
    }
  }
  return {
    "data": tableData,
    "threeCount": threeCount,
    "zusanCount": zusanCount
  };
}

void main() {
  print(containsAtLeastTwo("978",[6,2]));
}
