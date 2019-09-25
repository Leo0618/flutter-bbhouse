import 'package:bbhouse/comm/c.dart';
import 'package:bbhouse/fmap.dart';
import 'package:bbhouse/ui/page/MapShowPage.dart';
import 'package:bbhouse/ui/page/OldHousePageTitlebar.dart';
import 'package:bbhouse/ui/widget/page_route_builders.dart';
import 'package:bbhouse/util/util_screen.dart';
import 'package:bbhouse/util/utils.dart';
import 'package:flutter/material.dart';

import '../../r.dart';

/// function: OldHousePage
/// <p>Created by Leo on 2019/9/23.</p>
class OldHousePage extends StatefulWidget {
  final String title;

  OldHousePage(String title) : this.title = title ?? '';

  @override
  State<StatefulWidget> createState() {
    return _OldHousePageState();
  }
}

class _OldHousePageState extends State<OldHousePage> with SingleTickerProviderStateMixin {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    if (_tabController != null) _tabController.dispose();
    super.dispose();
  }

  bool _hideStepIndicator = true;
  Color _stepIndicatorColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          //内容视图
          Padding(
            padding: EdgeInsets.only(bottom: 70),
            child: SingleChildScrollView(controller: _scrollController, child: _buildContentViews(context)),
          ),
          //标题栏
          OldHousePageTitlebar(_scrollController, 200, (offsetLast) {
            setState(() {
              _hideStepIndicator = offsetLast > 0;
            });
          }),
          //定位tab
          Offstage(
            offstage: _hideStepIndicator,
            child: Container(
              height: 50,
              margin: EdgeInsets.only(top: UtilScreen.getInstance().topBarHeight),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.only(left: 20, right: 30), child: Text('房源', style: TextStyle(fontSize: 15, color: _stepIndicatorColor))),
                          Padding(padding: EdgeInsets.only(left: 20, right: 30), child: Text('详情', style: TextStyle(fontSize: 15, color: _stepIndicatorColor))),
                          Padding(padding: EdgeInsets.only(left: 20, right: 30), child: Text('动态', style: TextStyle(fontSize: 15, color: _stepIndicatorColor))),
                          Padding(padding: EdgeInsets.only(left: 20, right: 30), child: Text('小区', style: TextStyle(fontSize: 15, color: _stepIndicatorColor))),
                          Padding(padding: EdgeInsets.only(left: 20, right: 30), child: Text('推荐', style: TextStyle(fontSize: 15, color: _stepIndicatorColor))),
                        ],
                      ),
                    ),
                  ),
                  Container(color: C.divider, height: 0.5),
                ],
              ),
            ),
          ),
          //销售联系
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              child: Image.asset(R.assetsImgSalerContact, width: double.infinity, height: 70, fit: BoxFit.fitWidth),
              onTap: () => Utils.wait('联系销售'),
            ),
          ),
        ],
      ),
    );
  }

  TabController _tabController;

  Widget _buildContentViews(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(height: 250, width: double.infinity, child: Image.asset(R.assetsImgHouseBig, width: double.infinity, fit: BoxFit.cover)),
        Image.asset(R.assetsImgDetail1, width: double.infinity, fit: BoxFit.fitWidth),
        Image.asset(R.assetsImgDetail2, width: double.infinity, fit: BoxFit.fitWidth),
        Image.asset(R.assetsImgDetail3, width: double.infinity, fit: BoxFit.fitWidth),
        Container(
          height: 200,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFfE7F0F7), Color(0xFFFFFFFF)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
            decoration: BoxDecoration(
              border: new Border.all(color: Color(0xFFE5E5E5), width: 0.5),
              color: Colors.white,
              borderRadius: BorderRadius.circular((5.0)),
              boxShadow: [BoxShadow(color: Color(0xFFE5E5E5), offset: Offset(0, 2), blurRadius: 3.0, spreadRadius: 1.0)],
            ),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Color(0xFF4C6CFD), Color(0xFF5787F7), Color(0xFF6BA9EE)]),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0), topRight: Radius.circular(5.0)),
                    boxShadow: [BoxShadow(color: Color(0xFFE5E5E5), offset: Offset(0, 2), blurRadius: 3.0, spreadRadius: 1.0)],
                  ),
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text('符合7项评选标准', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      Text('全部标准', style: TextStyle(color: Color(0xFFB2CFF2), fontSize: 15)),
                      Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 25),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TabBar(
                    controller: _tabController,
                    isScrollable: false,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: C.app_main,
                    indicatorPadding: EdgeInsets.only(left: 20, right: 20),
                    labelPadding: EdgeInsets.only(left: 10, right: 10),
                    tabs: <Widget>[
                      Image.asset(R.assetsImgDetailTab1),
                      Image.asset(R.assetsImgDetailTab2),
                      Image.asset(R.assetsImgDetailTab3),
                      Image.asset(R.assetsImgDetailTab4),
                    ],
                  ),
                ),
                Container(color: C.divider, height: 0.5, margin: EdgeInsets.only(left: 20, right: 20)),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: TabBarView(
                      controller: _tabController,
                      physics: NeverScrollableScrollPhysics(),
                      children: <Widget>[
                        Text('500米内有公交站，或1000米内有地铁', style: TextStyle(fontSize: 13)),
                        Text('近七日带看9次，在同商圈470套二手房中排名第2名', style: TextStyle(fontSize: 13)),
                        Text('得房率高于同商圈同居室50%的房源', style: TextStyle(fontSize: 13)),
                        Text('南北通透·全明格局·飘窗，增加空间使用率·明厨明卫·动静分明，休息活动互不干扰', style: TextStyle(fontSize: 13)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Image.asset(R.assetsImgDetailDivider1, width: double.infinity, fit: BoxFit.fitWidth),
        Image.asset(R.assetsImgDetail4, width: double.infinity, fit: BoxFit.fitWidth),
        InkWell(
          child: Image.asset(R.assetsImgDetail5, width: double.infinity, fit: BoxFit.fitWidth),
          // onTap: () => Navigator.of(context).push(RouteBuilders.slideFromRight(MapShowPage(113.953705, 22.535783))),
          onTap: () => Fmap.showOldHouseMapShow(113.893389,22.565497),
        ),
        Image.asset(R.assetsImgDetail6, width: double.infinity, fit: BoxFit.fitWidth),
      ],
    );
  }
}
