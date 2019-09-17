import 'package:bbhouse/comm/c.dart';
import 'package:bbhouse/ui/widget/marquee/flutter_marquee.dart';
import 'package:bbhouse/ui/widget/page_route_builders.dart';
import 'package:flutter/material.dart';

import '../../r.dart';
import 'WebViewPage.dart';

/// function: HomePageZhishu
/// <p>Created by Leo on 2019/9/17.</p>
class HomePageZhishu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageZhishuState();
  }
}

class _HomePageZhishuState extends State<HomePageZhishu> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    if (_tabController != null) _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox(height: 150, child: Container(color: Color(0xFF5C90F2))),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset(R.assetsImgZhishu, width: 100, height: 40),
                  FlutterMarquee(
                    children: <Widget>[_scrollZhishu(), _scrollZhishu(), _scrollZhishu()],
                    duration: 4,
                    itemDuration: 1200,
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 200,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  border: new Border.all(color: Color(0xFFE5E5E5), width: 0.5),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular((5.0)),
                  boxShadow: [BoxShadow(color: Color(0xFFE5E5E5), offset: Offset(0, 1), blurRadius: 2.0, spreadRadius: 1.0)],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 20),
                      child: TabBar(
                        controller: _tabController,
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelColor: Colors.black,
                        indicatorColor: Color(0xFFE4E5ED),
                        unselectedLabelColor: C.app_gray,
                        labelPadding: EdgeInsets.only(left: 5, right: 5, bottom: 10),
                        indicatorPadding: EdgeInsets.all(0),
                        indicatorWeight: 4,
                        labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        tabs: <Widget>[Text('帮我找房'), Text('我的房子')],
                      ),
                    ),
                    Container(width: double.infinity, height: 0.5, color: Color(0xFFDDDDDD), margin: EdgeInsets.only(left: 25, right: 20)),
                    SizedBox(height: 15),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: <Widget>[
                          InkWell(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text('全城经纪人为您在线找房', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 17)),
                                            Text('定制推荐/极速响应/专属推荐', style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 15)),
                                          ],
                                        ),
                                      ),
                                      Image.asset(R.assetsImgZhishu1, width: 80, height: 80),
                                    ],
                                  ),
                                ),
                                Container(width: double.infinity, height: 0.5, color: Color(0xFFDDDDDD)),
                                Expanded(child: Center(child: Text('立即找房', style: TextStyle(fontSize: 15, color: C.app_main)))),
                              ],
                            ),
                            onTap: () => Navigator.of(context).push(
                              RouteBuilders.slideFromRight(WebViewPage('https://m.ke.com/sz/fangjia')),
                            ),
                          ),
                          InkWell(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text('查看房屋估值走势', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 17)),
                                            Text('随时掌握小区均价与邻里动态', style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 15)),
                                          ],
                                        ),
                                      ),
                                      Image.asset(R.assetsImgZhishu2, width: 80, height: 80),
                                    ],
                                  ),
                                ),
                                Container(width: double.infinity, height: 0.5, color: Color(0xFFDDDDDD)),
                                Expanded(child: Center(child: Text('立即查看', style: TextStyle(fontSize: 15, color: C.app_main)))),
                              ],
                            ),
                            onTap: () => Navigator.of(context).push(
                              RouteBuilders.slideFromRight(WebViewPage('https://m.ke.com/sz/fangjia')),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _scrollZhishu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              color: Colors.black87,
              margin: EdgeInsets.only(left: 20),
              padding: EdgeInsets.fromLTRB(0.5, 1, 0.5, 1),
              child: Text('城市', style: TextStyle(color: Colors.white, fontSize: 9)),
            ),
            Container(
              margin: EdgeInsets.only(left: 7),
              child: Text('深圳·57368元/平，昨日成交70套', style: TextStyle(color: Colors.white, fontSize: 11)),
            ),
          ],
        ),
        SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              color: Colors.black87,
              margin: EdgeInsets.only(left: 20),
              padding: EdgeInsets.fromLTRB(0.5, 1, 0.5, 1),
              child: Text('附近', style: TextStyle(color: Colors.white, fontSize: 9)),
            ),
            Container(
              margin: EdgeInsets.only(left: 7),
              child: Text('80306元/平，向南瑞峰花园，24套在售', style: TextStyle(color: Colors.white, fontSize: 11)),
            ),
          ],
        ),
      ],
    );
  }
}
