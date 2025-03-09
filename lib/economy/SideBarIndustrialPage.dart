import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gambling_spider/economy/DetailPage.dart';

class SideBarIndustrialPage extends StatefulWidget {
  const SideBarIndustrialPage({super.key, required this.constraints});

  final BoxConstraints constraints;

  @override
  State<SideBarIndustrialPage> createState() => _SideBarIndustrialPageState();
}

class _SideBarIndustrialPageState extends State<SideBarIndustrialPage> {
  // 定义菜单项的数据
  final Map<String,Map<String,dynamic>>main_data = {
    "橡胶": {
      "异戊二烯": null,
      "苯乙烯": null,
      "丁二烯": null,
      "异戊橡胶": null,
      "丁苯橡胶": null,
      "顺丁橡胶": null,
      "SBS橡胶": null,
      "丁腈橡胶": null,
      "20号胶": null,
    },
    "树脂": {
      "PE树脂": null,
      "PP树脂": null,
      "PVC树脂": null,
      "PS树脂": null,
      "PC树脂": null,
      "双酚A": null,
      "聚四氟乙烯": null,
      "ABS树脂": null,
      "丙烯腈": null,
      "PMMA": null,
      "EVA树脂": null,
      "尼龙66": null,
      "己二胺": null,
      "己二酸": null,
      "尼龙6": null,
      "己内酰胺": null,
      "PET": null,
      "PBT": null,
      "TDI": null,
      "MDI": null,
      "聚四氢呋喃": null,
      "聚丙烯腈": null,
      "甲醛": null,
      "苯酚": null,
      "尿素": null,
      "三聚氰胺": null,
      "酚醛树脂": null,
      "脲醛树脂": null,
      "密胺树脂": null,
      "双酚A型环氧树脂": null,
      "二乙烯三胺": null,
    },
    "粘合": {
      "羟丙甲纤维素": null,
      "羧甲纤维素钠": null,
      "甲基苯酚": null,
      "白乳胶": null,
      "502胶水": null,
      "氯丁胶": null,
      "2-氯-1，3-丁二烯": null,
      "甲苯": null,
      "氯苯": null,
    },
    "制冷": {
      "氨": null,
      "氟利昂_12": null,
      "氟利昂_22": null,
      "氟利昂_134a": null,
      "环戊烷": null,
    },
    "食品添加": {
      "单硬脂酸甘油酯": null,
      "蔗糖脂肪酸酯": null,
      "硬脂酰乳酸钠": null,
      "卵磷脂": null,
      "植脂末T90": null,
      "酪蛋白": null,
      "L-赖氨酸": null,
      "葡萄糖酸-δ-内酯": null,
      "卡拉胶": null,
      "乙基麦芽酚": null,
    },
    "木材·纸": {
      "木粉": null,
      "胶合板": null,
      "刨花板": null,
      "纤维板": null,
      "漂白硫酸盐针叶木浆": null,
      "漂白硫酸盐阔叶木浆": null,
      "五层AB瓦楞纸": null,
      "五层BE瓦楞纸": null,
    },
    "建筑": {
      "铁矿石": null,
      "生铁": null,
      "不锈钢304": null,
      "废铁": null,
      "1#铬": null,
      "1#电解镍": null,
      "A00铝": null,
      "6063铝合金": null,
      "1#铜": null,
      "0#锌": null,
      "氧化钙": null,
      "氧化铝": null,
      "氧化钾": null,
      "氧化钠": null,
      "生石膏": null,
      "熟石膏": null,
      "氯化镁": null,
      "滑石": null,
      "石灰岩碎石": null,
      "石灰岩粗砂": null,
      "石灰岩细砂": null,
      "2#石英": null,
      "高岭土": null,
      "325水泥": null,
      "425水泥": null,
      "525水泥": null,
      "钠钙玻璃": null,
      "氯化钙": null,
      "标准红砖": null,
      "烧碱": null,
      "元明粉": null,
      "纯碱": null,
      "硅酸钠": null,
    },

    "电动车": {
      "钕铁硼": null,
      "钕": null,
      "1#锡": null,
      "1#铅": null,
      "磷酸亚铁锂": null,
      "1#钴": null,
      "1#电解锰": null,
      "碳酸锂": null,
      "六氟磷酸锂": null,
      "氮化镓": null,
    },
    "能源": {
      "液化石油气": null,
      "92#汽油": null,
      "95#汽油": null,
      "98#汽油": null,
      "0#柴油": null,
      "石蜡": null,
      "沥青": null,
      "伦敦brent原油": null,
      "纽约WTI原油": null,
      "天然气": null,
      "5500大卡动力煤": null,
    },
    "表面活性": {
      "月桂醇聚醚硫酸酯钠": null,
      "月桂醇硫酸酯钠": null,
      "月桂酰胺肌氨酸钠": null,
      "月桂酰胺谷氨酸钠": null,
      "月桂酰胺基丙基甜菜碱": null,
      "硬脂酸钠": null,
      "棕榈酸钠": null,
      "直链十二烷基苯磺酸钠": null,
      "椰油酰胺DEA": null,
      "椰油酰胺MEA": null,
      "鲸蜡硬脂基三甲基氯化铵": null,
      "直链烷基葡萄糖苷": null,
    },
    "助溶": {
      "鲸蜡硬脂醇": null,
      "甘油": null,
      "聚二甲基硅氧烷": null,
      "聚二甲基硅氧烷醇": null,
      "二甲醚": null,
      "乙醇": null,
      "丙二醇": null,
      "丁二醇": null,
      "异丙醇": null,
      "对甲苯磺酸钠": null,
      "二甲苯磺酸钠": null,
      "月桂酸": null,
      "肉豆蔻酸": null,
      "棕榈酸": null,
      "硬脂酸": null,
      "油酸": null,
      "亚油酸": null,
    },
    "香味": {
      "香芹酮": null,
      "薄荷醇": null,
      "β-苯乙醇": null,
      "月桂醇": null,
      "芳樟醇": null,
      "柠檬醛": null,
      "橙花醇": null,
      "牻牛儿醇": null,
      "丁香油酚": null,
      "玫瑰醚": null,
      "异戊酸异戊酯": null,
      "山梨糖醇": null,
      "木糖醇": null,
      "糖精钠": null,
    },
    "颜色": {
      "硅酸锆": null,
      "氧化镁": null,
      "氢氧化铝": null,
      "铬酸铅": null,
      "群青蓝": null,
      "金红石型钛白粉": null,
      "炭黑": null,
      "石墨": null,
      "氧化铁系颜料": null,
      "腻子粉": null,
      "CI_19140": null,
    },
    "自来水": {
      "活性炭": null,
      "聚合氯化铝": null,
      "聚合硫酸铝": null,
      "聚合氯化铁": null,
      "聚合硫酸铁": null,
      "PVC管": null,
      "PPR管": null,
    },
    "其他": {
      "氟氯醚菊酯": null,
      "靛蓝": null,
      "保险粉": null,
      "高锰酸钾": null,
      "草酸": null,
      "硫磺": null,
      "硝酸钾": null,
      "苯氧乙醇": null,
      "苯甲酸钠": null,
      "山梨酸钾": null,
      "柠檬酸": null,
      "氧化锌": null,
      "吡硫鎓锌": null,
      "磷酸氢钙": null,
      "聚乙二醇": null,
      "单氟磷酸钠": null,
      "次氯酸盐": null,
      "碱性蛋白酶": null,
      "EDTA二钠": null,
      "EDTA四钠": null,
      "乙二醇二硬脂酸钠": null,
      "泛醇": null,
    }
  };

  // 用于记录当前选中的菜单项
  String? _selectedItem;

  // 用于记录当前展开的菜单项
  String? _expandedTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: Colors.green,
        title: Text(
          "工业篇",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
        ),
        centerTitle: true, // 标题居中
      ),
      body: Row(
        children: [
          // 侧边栏
          Container(
            width: MediaQuery.of(context).size.width * 0.25, // 侧边栏宽度
            color: Colors.grey[200], // 侧边栏背景色
            child: ListView(
              padding: EdgeInsets.zero,
              children: main_data.entries.map((entry) {
                return _buildMenuItem(entry.key, []);
              }).toList(),
            ),
          ),

          Expanded(
            child: ListView(children: getWrapChildren()),
          ),
        ],
      ),
    );
  }

  List<Widget> getWrapChildren() {
    List<Widget> res = [];
    Map<String, dynamic>? select_detail_data = main_data[_selectedItem];
    if (select_detail_data == null) {
      select_detail_data = {};
    }
    select_detail_data.forEach((key, value) {
      List<Widget> con = [];

      con.add(SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
        child: Padding(
          padding: const EdgeInsets.only(top: 4.0, bottom: 4, left: 10),
          child: Center(
            child: Text(
              key,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
            ),
          ),
        ),
      ));

      if (value != null) {
        List<Widget> widgets = value.entries.map<Widget>((entry) {
          return SizedBox(
            width: (MediaQuery.of(context).size.width * 0.75 - 20) / 3,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: GestureDetector(
                  child: Text(
                      style: TextStyle(color: Colors.black54),
                      entry.key.toString()),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return Detailpage(
                          title: entry.key.toString(),
                        ); //返回的是需要跳转单页面
                      },
                    ));
                  },
                ),
              ),
            ),
          );
        }).toList();
        con.add(Directionality(
          textDirection: TextDirection.ltr,
          child: Wrap(
            alignment: WrapAlignment.start, // 主轴方向靠左对齐
            runAlignment: WrapAlignment.start, // 交叉轴方向靠左对齐
            children: widgets,
          ),
        ));
      }
      res.add(Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black12,
        ),
        margin: EdgeInsets.only(top: 10.0, bottom: 5, left: 10, right: 10),
        child: Column(
          children: con,
        ),
      ));
    });

    return res;
  }

  // 构建单个菜单项
  Widget _buildMenuItem(String title, dynamic children) {
    final hasChildren = children is Map;

    if (hasChildren) {
      // 如果有子菜单项，使用 ExpansionTile
      return ExpansionTile(
        trailing: null,
        key: ValueKey(title),
        // 为每个 ExpansionTile 设置唯一的 key
        iconColor: Colors.grey,
        title: Container(
          decoration: title == _selectedItem
              ? BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Colors.green, width: 5),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft, // 渐变起始点
                    end: Alignment.bottomRight, // 渐变结束点
                    colors: [
                      Colors.green[200]!, // 起始颜色
                      Colors.green[50]!, // 结束颜色
                    ],
                  ),
                )
              : null,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 10,
              color: _selectedItem == title ? Colors.black54 : Colors.black54,
            ),
          ),
        ),
        initiallyExpanded: _expandedTitle == title,
        // 默认展开状态
        childrenPadding: EdgeInsets.only(left: 0),
        // 子项缩进
        children: (children as Map<String, dynamic>).entries.map((entry) {
          return _buildMenuItem(entry.key, entry.value);
        }).toList(),
        onExpansionChanged: (isExpanded) {
          setState(() {
            if (isExpanded) {
              // 展开当前项，收起其他项
              _expandedTitle = title;
              // 选中第一个子项
              // if (menuItems[title] != null) {
              //   Map<String, dynamic> childNode = menuItems[title];
              //   _selectedItem = childNode.keys.first;
              // }
            } else {
              // 收起当前项
              _expandedTitle = null;
            }
          });
        },
      );
    } else {
      // 如果没有子菜单项，使用 ListTile
      return Container(
        decoration: title == _selectedItem
            ? BoxDecoration(
                border: Border(
                  left: BorderSide(color: Colors.green, width: 5),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft, // 渐变起始点
                  end: Alignment.bottomRight, // 渐变结束点
                  colors: [
                    Colors.green[200]!, // 起始颜色
                    Colors.green[50]!, // 结束颜色
                  ],
                ),
              )
            : null,
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              fontSize: 10,
              color: _selectedItem == title ? Colors.white : Colors.black54,
            ),
          ),
          onTap: () {
            setState(() {
              _selectedItem = title;
            });
          },
        ),
      );
    }
  }
}
