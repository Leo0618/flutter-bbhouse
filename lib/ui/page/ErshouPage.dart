import 'package:bbhouse/comm/c.dart';
import 'package:bbhouse/r.dart';
import 'package:bbhouse/ui/page/ErshouPageHeadLayout.dart';
import 'package:bbhouse/ui/widget/TagWidget.dart';
import 'package:bbhouse/util/util_screen.dart';
import 'package:bbhouse/util/utils.dart';
import 'package:flog/flog.dart';
import 'package:flutter/material.dart';

/// function: ErshouPage
/// <p>Created by Leo on 2019/9/20.</p>
class ErshouPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ErshouPageState();
  }
}

class _ErshouPageState extends State<ErshouPage> {
  ScrollController _scrollController;
  final GlobalKey _allHouseKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController();
    _scrollController.addListener(_onScrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    if (_scrollController != null) {
      _scrollController.dispose();
      _scrollController.removeListener(_onScrollListener);
    }
  }

  void _onScrollListener() {
    //标题栏高度获取
    RenderBox renderBoxTitlebar = _titleBarKey.currentContext.findRenderObject();
    var offsetTitlebar = renderBoxTitlebar.localToGlobal(Offset(0, renderBoxTitlebar.size.height));
    //锚点位置获取
    RenderBox renderBoxAllhouseTop = _allHouseKey.currentContext.findRenderObject();
    var offsetAllhouseTop = renderBoxAllhouseTop.localToGlobal(Offset.zero);

    if (offsetAllhouseTop.dy <= offsetTitlebar.dy + 5) {
      Flog.i('===>OK');
    }
  }

  void _jump(int index) {
    Utils.toast('弹出菜单-$index');
    //标题栏高度获取
    RenderBox renderBoxTitlebar = _titleBarKey.currentContext.findRenderObject();
    var offsetTitlebar = renderBoxTitlebar.localToGlobal(Offset(0, renderBoxTitlebar.size.height));
    //锚点位置获取
    RenderBox renderBoxAllhouseTop = _allHouseKey.currentContext.findRenderObject();
    var offsetAllhouseTop = renderBoxAllhouseTop.localToGlobal(Offset.zero);
    //当前偏移 + 锚点位置 - 标题栏高度
    double offsetNew = _scrollController.offset + offsetAllhouseTop.dy - offsetTitlebar.dy;
    _scrollController.animateTo(offsetNew, duration: Duration(milliseconds: 1000), curve: Curves.fastLinearToSlowEaseIn);

    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        //_hideMenu = false;
      });
    });
  }

  bool _hideMenu = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
        child: SafeArea(top: true, child: Offstage()),
      ),
      body: Column(
        children: <Widget>[
          _buildTitleSearch(context),
          Expanded(
            child: Stack(
              children: <Widget>[
                SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: <Widget>[
                      ErshouPageHeadLayout(),
                      //筛选条件
                      Container(
                        key: _allHouseKey,
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 20),
                        child: Row(children: _buildMenuTabs()),
                      ),
                      Container(height: 0.5, width: double.infinity, color: Color(0xFFDDDDDD), margin: EdgeInsets.only(top: 15, bottom: 15)),
                      //直选条件
                      Container(
                        height: 35,
                        margin: EdgeInsets.only(left: 20, bottom: 10),
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: ['满五年', '满两年', '近地铁', 'VR看房', '7日新上'].map((item) {
                            return Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: InkWell(
                                child: TagWidget(
                                  item,
                                  tagNameColor: Colors.black,
                                  tagNameFontSize: 15,
                                  bgColor: Color(0xFFF7F7F7),
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                ),
                                onTap: () => Utils.wait(item),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      //列表
                      ListView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [R.assetsImgErshouHouse1, R.assetsImgErshouHouse2, R.assetsImgErshouHouse3, R.assetsImgErshouHouse4, R.assetsImgErshouHouse5, R.assetsImgErshouHouse6].map((item) {
                          return InkWell(
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 20),
                                  Image.asset(item, fit: BoxFit.fitWidth),
                                  SizedBox(height: 20),
                                  Container(height: 0.5, width: double.infinity, color: Color(0xFFDDDDDD)),
                                ],
                              ),
                              onTap: () => Utils.wait('house'));
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                Offstage(
                  offstage: _hideMenu,
                  child: Container(
                    height: 200,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildMenuTabs() {
    return <Widget>[
      Expanded(
        child: InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text('区域', style: TextStyle(color: Colors.black, fontSize: 15)), Icon(Icons.arrow_drop_down, color: Color(0xFFE3E5EF))],
          ),
          onTap: () => _jump(0),
        ),
      ),
      Expanded(
        child: InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text('价格', style: TextStyle(color: Colors.black, fontSize: 15)), Icon(Icons.arrow_drop_down, color: Color(0xFFE3E5EF))],
          ),
          onTap: () => _jump(1),
        ),
      ),
      Expanded(
        child: InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text('房型', style: TextStyle(color: Colors.black, fontSize: 15)), Icon(Icons.arrow_drop_down, color: Color(0xFFE3E5EF))],
          ),
          onTap: () => _jump(2),
        ),
      ),
      Expanded(
        child: InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text('更多', style: TextStyle(color: Colors.black, fontSize: 15)), Icon(Icons.arrow_drop_down, color: Color(0xFFE3E5EF))],
          ),
          onTap: () => _jump(3),
        ),
      ),
      Expanded(
        child: InkWell(
          child: Image.asset(R.assetsImgSort, width: 20, height: 20),
          onTap: () => _jump(4),
        ),
      ),
    ];
  }

  GlobalKey _titleBarKey = new GlobalKey();

  //搜索标题栏
  Widget _buildTitleSearch(BuildContext context) {
    return Row(
      key: _titleBarKey,
      children: <Widget>[
        SizedBox(width: 20),
        InkWell(child: Icon(Icons.arrow_back), onTap: () => Navigator.maybePop(context)),
        Expanded(
            child: InkWell(
          splashColor: Colors.transparent,
          child: Container(
            width: double.infinity,
            height: UtilScreen.getInstance().appBarHeight - 5,
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            decoration: BoxDecoration(
              border: new Border.all(color: Color(0xFFE5E5E5), width: 0.5),
              color: Colors.white,
              borderRadius: BorderRadius.circular((10.0)),
              boxShadow: [BoxShadow(color: Color(0xFFE5E5E5), offset: Offset(0, 2), blurRadius: 3.0, spreadRadius: 1.0)],
            ),
            child: Row(
              children: <Widget>[
                Icon(Icons.search, size: 20, color: C.app_gray),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    '请输入小区或商圈名',
                    style: TextStyle(fontSize: 17, color: C.app_gray),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
          ),
          onTap: () => Utils.wait('搜索'),
        )),
        InkWell(child: Icon(Icons.message), onTap: () => Utils.wait('消息')),
        SizedBox(width: 20),
      ],
    );
  }
}
