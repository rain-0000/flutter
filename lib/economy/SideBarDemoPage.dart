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
  final main_data = {
    "唇形目": {
      "唇形科": {
        "薄荷属·Mentha": {"椒样薄荷": null, "留兰香薄荷": null},
        "刺蕊草属·Pogostemon": {"广藿香": null},
        "仙草属·Platostoma": {"仙草": null},
        "紫苏属·Perilla": {"紫苏": null}
      },
      "木樨科": {
        "素馨属·Jasminum": {"茉莉花": null}
      },
      "脂麻科": {
        "脂麻属·Sesamum": {"芝麻粒": null}
      }
    },
    "豆科": {
      "菜豆属·Phaseolus": {"荷包豆": null, "四季豆": null},
      "大豆属·Glycine": {
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
        "黄豆芽": null
      },
      "豇豆属·Vigna": {
        "豇豆荚": null,
        "白豇豆": null,
        "绿豆": null,
        "绿豆芽": null,
        "绿豆淀粉": null,
        "红豆": null
      },
      "落花生属·Arachis": {"带壳花生": null, "花生仁": null, "花生油": null, "花生粕": null},
      "豌豆属·Pisum": {
        "豌豆荚": null,
        "豌豆": null,
        "豌豆藤": null,
        "豌豆芽": null,
        "豌豆淀粉": null
      },
      "甘草属·Glycyrrhiza": {"甘草": null}
    },
    "禾本目": {
      "凤梨科": {
        "凤梨属·Ananas": {"菠萝": null}
      },
      "禾本科": {
        "稻属·Oryza": {
          "籼米": null,
          "粘米粉": null,
          "糯米": null,
          "糯米粉": null,
          "米糠": null,
          "米酒": null,
          "米醋": null,
          "稻秆": null
        },
        "甘蔗属·Saccharum": {"甘蔗": null, "一级白糖": null, "三氯蔗糖": null, "蔗渣": null},
        "小麦属·Triticum": {
          "高筋面粉": null,
          "中筋面粉": null,
          "低筋面粉": null,
          "澄粉": null,
          "麦麸": null,
          "麦秆": null
        },
        "玉米属·Zea": {
          "饲料玉米棒": null,
          "饲料玉米粒": null,
          "水果玉米棒": null,
          "水果玉米粒": null,
          "糯玉米棒": null,
          "玉米淀粉": null,
          "玉米秆": null
        }
      },
      "竹亚科": {
        "竹亚科·Bambusoideae": {
          "竹笋": null,
          "竹浆": null,
          "竹木材": null,
          "竹叶": null,
          "竹篾": null
        }
      }
    },
    "葫芦科": {
      "黄瓜属·Cucumis": {"黄瓜": null, "哈密瓜": null, "香瓜": null},
      "罗汉果属·Siraitia": {"罗汉果": null},
      "西瓜属·Citrullus": {"西瓜": null, "西瓜籽": null},
      "南瓜属·Cucurbita": {"南瓜": null, "南瓜籽": null, "南瓜苗": null, "南瓜花": null},
      "丝瓜属·Luffa": {"丝瓜": null},
      "冬瓜属·Benincasa": {"冬瓜": null}
    },
    "姜目": {
      "芭蕉科": {
        "芭蕉属·Musa": {"Williams香蕉": null}
      },
      "竹芋科": {
        "柊叶属·Phrynium": {"柊叶": null}
      },
      "姜科": {
        "姜黄属·Curcuma": {"姜黄": null},
        "姜属·Zingiber": {"生姜": null},
        "砂仁属·Wurfbainia": {"爪哇白豆蔻": null},
        "草果属·Lanxangia": {"草果": null}
      }
    },
    "菊科": {
      "蒲公英属·Taraxacum": {"蒲公英": null},
      "莴苣属·Lactuca": {"生菜": null, "油麦菜": null, "莴笋": null},
      "向日葵属·Helianthus": {"葵花籽": null},
      "菊属·Chrysanthemum": {"菊花": null}
    },
    "胡桃科": {
      "胡桃属·Juglans": {"核桃": null},
      "黄杞属·Engelhardtia": {"大叶茶": null}
    },
    "栗科": {
      "栗属·Castanea": {"板栗": null}
    },
    "蔷薇目": {
      "蔷薇科": {
        "草莓属·Fragaria": {"草莓": null},
        "梨属·Pyrus": {"梨子": null},
        "李属·Prunus": {"扁桃仁": null, "桃子": null, "李子": null, "梅子": null},
        "枇杷属·Eriobotrya": {"枇杷": null, "枇杷叶": null},
        "苹果属·Malus": {"80mm红富士苹果": null},
        "蔷薇属·Rosa": {"卡罗拉玫瑰": null, "黑魔术玫瑰": null, "戴安娜玫瑰": null, "精油玫瑰": null},
        "山楂属·Crataegus": {"山楂": null}
      },
      "鼠李科": {
        "枣属·Ziziphus": {"一级红枣": null}
      }
    },
    "茄目": {
      "茄科": {
        "辣椒属·Capsicum": {"辣椒": null},
        "茄属·Solanum": {"番茄": null, "茄子": null, "土豆": null}
      },
      "旋花科": {
        "番薯属·Ipomoea": {"红薯": null, "紫薯": null, "红薯叶": null, "空心菜": null}
      }
    },
    "伞形科": {
      "当归属·Angelica": {"白芷": null},
      "胡萝卜属·Daucus": {"胡萝卜": null},
      "茴香属·Foeniculum": {"茴香籽": null},
      "芹属·Apium": {"细芹菜": null, "粗芹菜": null},
      "芫荽属·Coriandrum": {"芫荽": null, "芫荽籽": null},
      "孜然芹属·Cuminum": {"孜然籽": null}
    },
    "十字花科": {
      "萝卜属·Raphanus": {"萝卜": null},
      "菘蓝属·Isatis": {"大青叶": null, "板蓝根": null},
      "芸薹属_芥菜·Brassica_juncea": {
        "榨菜": null,
        "大头菜": null,
        "雪里蕻": null,
        "包心芥菜": null,
        "其它芥菜": null,
        "黄芥末籽": null
      },
      "芸薹属_甘蓝·Brassica_oleracea": {
        "西兰花": null,
        "花椰菜": null,
        "卷心菜": null,
        "其它甘蓝": null
      },
      "芸薹属_芸薹·Brassica_rapa": {
        "大白菜": null,
        "娃娃菜": null,
        "白菜苔": null,
        "其它白菜": null
      }
    },
    "松柏目": {
      "柏科": {
        "杉属·Cunninghamia": {"杉木材": null}
      },
      "松科": {
        "松属·Pinus": {"马尾松木材": null}
      }
    },
    "桃金娘科": {
      "桉属·Eucalyptus": {"尾叶桉木材": null},
      "蒲桃属·Syzygium": {"公丁香": null}
    },
    "石蒜科": {
      "葱属·Allium": {
        "葱": null,
        "韭菜": null,
        "蒜瓣": null,
        "蒜苗": null,
        "荞头": null,
        "洋葱": null,
        "红葱头": null
      }
    },
    "无患子目": {
      "漆树科": {
        "芒果属·Mangifera": {"芒果": null},
        "腰果属·Anacardium": {"腰果仁": null}
      },
      "无患子科": {
        "荔枝属·Litchi": {"荔枝": null},
        "龙眼属·Dimocarpus": {"龙眼": null}
      },
      "芸香科": {
        "柑橘属·Citrus": {
          "柚": null,
          "橘": null,
          "橙": null,
          "柑": null,
          "柠檬": null,
          "橘皮": null
        },
        "花椒属·Zanthoxylum": {"花椒": null}
      }
    },
    "樟科": {
      "肉桂属·Cinnamomum": {"肉桂": null},
      "月桂属·Laurus": {"月桂叶": null},
      "樟属·Camphora": {"樟树木材": null}
    },
    "棕榈科": {
      "椰属·Cocos": {"椰子油": null, "椰子壳": null},
      "油棕属·Elaeis": {"棕榈油": null, "棕榈仁油": null}
    },
    "其他植物": {
      "五味子科": {
        "八角属·Illicium": {"八角": null}
      },
      "锦葵科": {
        "棉花属·Gossypium": {"棉花": null, "棉纱": null}
      },
      "莲科": {
        "莲属·Nelumbo": {"莲藕": null}
      },
      "忍冬科": {
        "忍冬属·Lonicera": {"忍冬花": null}
      },
      "山茶科": {
        "山茶属·Camellia": {"茶叶": null, "红茶粉": null}
      },
      "茜草科": {
        "栀子属·Gardenia": {"栀子": null}
      },
      "葡萄科": {
        "葡萄属·Vitis": {"葡萄": null, "葡萄干": null}
      },
      "仙人掌科": {
        "蛇鞭柱属·Selenicereus": {"火龙果": null}
      },
      "大戟科": {
        "木薯属·Manihot": {"木薯淀粉": null}
      },
      "天南星科": {
        "芋属·Colocasia": {"芋头": null, "芋叶柄": null}
      }
    },
    "雉科": {
      "原鸡属·Gallus": {
        "活鸡": null,
        "白条鸡": null,
        "鸡胸肉": null,
        "鸡腿": null,
        "鸡翅": null,
        "鸡翅尖": null,
        "鸡翅根": null,
        "鸡爪": null,
        "鸡肠": null,
        "鸡胗": null,
        "鸡心": null,
        "鸡肝": null,
        "鸡皮": null,
        "鸡蛋": null,
        "鸡毛": null
      }
    },
    "鸭科": {
      "鸭属·Anas|疣鼻栖鸭属·Cairina": {
        "活鸭": null,
        "白条鸭": null,
        "鸭翅": null,
        "鸭腿": null,
        "鸭掌": null,
        "鸭肠": null,
        "鸭胗": null,
        "鸭舌": null,
        "鸭脖": null,
        "鸭心": null,
        "鸭肝": null,
        "鸭蛋": null,
        "皮蛋": null,
        "鸭毛": null
      }
    },
    "猪科": {
      "猪属·Sus": {
        "生猪": null,
        "白条猪": null,
        "猪皮": null,
        "猪板油": null,
        "肥膘肉": null,
        "猪面颊": null,
        "猪下巴": null,
        "猪颈肉": null,
        "猪舌头": null,
        "猪耳": null,
        "猪脑": null,
        "猪脊骨": null,
        "猪肋排骨": null,
        "猪外脊肉": null,
        "猪里脊肉": null,
        "五花肉": null,
        "猪肩胛肉": null,
        "猪前大腿": null,
        "猪后大腿": null,
        "猪大腿骨": null,
        "猪前肘": null,
        "猪后肘": null,
        "猪前蹄": null,
        "猪后蹄": null,
        "猪尾巴": null,
        "猪腰子": null,
        "猪心": null,
        "猪肝": null,
        "猪肺": null,
        "猪小肠": null,
        "猪大肠": null,
        "猪肚": null
      }
    },
    "其他动物": {
      "粉甲虫属": {
        "粉甲虫属·Tenebrio": {"面包虫": null}
      },
      "对虾科": {
        "对虾科·Penaeidae": {"对虾": null}
      },
      "田螺科": {
        "田螺科·Viviparidae": {"田螺": null}
      }
    },
    "菌类": {
      "菌类·味精": {
        "米曲霉菌": null,
        "酿酒酵母": null,
        "醋酸菌": null,
        "毛霉菌": null,
        "乳杆菌": null,
        "谷氨酸钠": null,
        "IMP": null,
        "GMP": null,
        "黑木耳": null,
        "金针菇": null,
        "香菇": null
      }
    }
  };

  // 用于记录当前选中的菜单项
  String? _selectedItem;

  // 用于记录当前展开的菜单项
  String? _expandedTitle;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _selectedItem = main_data.keys.toList()[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: Colors.green,
        title: Text(
          "生物篇",
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
      Map<String, dynamic>? selectDetailData2 = value;
      List<Widget> con = [];
      if (_selectedItem!.indexOf("目") > 0 ||
          _selectedItem == '其他植物' ||
          _selectedItem == '其他动物') {
        con.add(Container(
          decoration:BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(10.0),topLeft: Radius.circular(10.0)),

            color: Colors.black54,
          ) ,
          width: MediaQuery.of(context).size.width * 0.75,
          child:Center(child:  Text(key,style: TextStyle(fontSize: 20,color: Colors.white),),),
        ));
        selectDetailData2?.forEach((key2, value2) {
          con.add(SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            child: Padding(
              padding: const EdgeInsets.only(top: 4.0, bottom: 4, left: 10),
              child: Center(
                child: Text(
                  key2,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ));

          if (value2 != null) {
            List<Widget> widgets = value2.entries.map<Widget>((entry) {
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
        });

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
      } else {
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
      }
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
