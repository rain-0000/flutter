import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gambling_spider/economy/DetailPage.dart';

class SideBarDemoPage extends StatefulWidget {
  const SideBarDemoPage({super.key, required this.constraints});

  final BoxConstraints constraints;

  @override
  State<SideBarDemoPage> createState() => _SideBarDemoPageState();
}

class _SideBarDemoPageState extends State<SideBarDemoPage> {
  // 定义菜单项的数据
  final Map<String, dynamic> menuItems = {
    "唇形目": {
      "唇形科": null,
      "木樨科": null,
      "脂麻科": null,
    },
    "豆科": null,
    "禾本目": {
      "凤梨科": null,
      "禾本科": null,
      "竹亚科": null,
    },
    "葫芦科": null,
    "姜目": {
      "芭蕉科": null,
      "竹芋科": null,
      "姜科": null,
    },
    "菊科": null,
    "壳斗目": {
      "胡桃科": null,
      "壳斗科": null,
    },
    "蔷薇目": {
      "蔷薇科": null,
      "鼠李科": null,
    },
    "茄目": {
      "茄科": null,
      "旋花科": null,
    },
    "伞形科": null,
    "十字花科": null,
    "松柏目": null,
    "桃金娘科": null,
    "石蒜科": null,
    "无患子目": {
      "漆树科": null,
      "无患子科": null,
      "芸香科": null,
    },
    "樟科": null,
    "棕榈科": null,
    "其它植物": null,
    "雉科": null,
    "鸭科": null,
    "猪科": null,
    "其它动物": null,
    "菌类·味精": null,
  };
  final Map<String, dynamic> lamiales =
  {
    "豆科":{
      "豆科＞菜豆属·Phaseolus": {
        "荷包豆": null,
        "四季豆": null,
      },
      "豆科＞大豆属·Glycine": {
        "毛豆": null,
        "青大豆": null,
        "黄大豆1号": null,
        "黑大豆": null,
        "黄大豆粉": null,
        "豆腐": null,
        "豆腐泡": null,
        "豆腐干": null,
        "腐竹": null,
        "大豆油": null,
        "酱油": null,
        "黑豆豉": null,
        "黄豆酱": null,
        "腐乳": null,
        "豆粕": null,
        "黄豆芽": null,
      },
      "豆科＞豇豆属·Vigna": {
        "豇豆荚": null,
        "白豇豆": null,
        "绿豆": null,
        "绿豆芽": null,
        "绿豆淀粉": null,
        "红豆": null,
      },
      "豆科＞落花生属·Arachis": {
        "带壳花生": null,
        "花生仁": null,
        "花生油": null,
        "花生粕": null,
      },
      "豆科＞豌豆属·Pisum": {
        "豌豆荚": null,
        "豌豆": null,
        "豌豆藤": null,
        "豌豆芽": null,
        "豌豆淀粉": null,
      },
      "豆科＞甘草属·Glycyrrhiza": {
        "甘草": null,
      }
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
          "生物篇",
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),
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
              children: menuItems.entries.map((entry) {
                return _buildMenuItem(entry.key, entry.value);
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
    Map<String,dynamic> select_detail_data=lamiales[_selectedItem];
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
        decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black12,
        ) ,
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
              if (menuItems[title] != null) {
                Map<String, dynamic> childNode = menuItems[title];
                _selectedItem = childNode.keys.first;
              }
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
