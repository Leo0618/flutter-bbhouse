import 'dart:ui' as ui;

import 'package:bbhouse/comm/c.dart';
import 'package:bbhouse/ui/widget/page_route_builders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../r.dart';
import 'WebViewPage.dart';

/// function: FeedPage
/// <p>Created by Leo on 2019/9/16.</p>
class FeedPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FeedPageState();
  }
}

class _FeedPageState extends State<FeedPage> with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<String> _listA, _listB, _listC, _listD;
  EasyRefreshController _controller = EasyRefreshController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _listA = [R.assetsImgFeeda1, R.assetsImgFeeda2, R.assetsImgFeeda3, R.assetsImgFeeda4, R.assetsImgFeeda5, R.assetsImgFeeda6, R.assetsImgFeeda7, R.assetsImgFeeda8];
    _listB = [R.assetsImgFeedb1, R.assetsImgFeedb2, R.assetsImgFeedb3, R.assetsImgFeedb4, R.assetsImgFeedb5, R.assetsImgFeedb6, R.assetsImgFeedb7, R.assetsImgFeedb8];
    _listC = [R.assetsImgFeedc1, R.assetsImgFeedc2, R.assetsImgFeedc3, R.assetsImgFeedc4, R.assetsImgFeedc5, R.assetsImgFeedc6, R.assetsImgFeedc7];
    _listD = [R.assetsImgFeedd1, R.assetsImgFeedd2, R.assetsImgFeedd3, R.assetsImgFeedd4, R.assetsImgFeedd5, R.assetsImgFeedd6];
  }

  @override
  void dispose() {
    super.dispose();
    if (_tabController != null) _tabController.dispose();
    if (_controller != null) _controller.dispose();
  }

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
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: C.app_main,
              indicatorColor: C.app_main,
              unselectedLabelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.only(left: 12, right: 12),
              labelPadding: EdgeInsets.only(left: 10, right: 10),
              labelStyle: TextStyle(fontSize: 18),
              tabs: <Widget>[Text('推荐'), Text('深圳'), Text('行情'), Text('大V观点')],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[_buildPage(_listA), _buildPage(_listB), _buildPage(_listC), _buildPage(_listD)],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(List<String> list) {
    return EasyRefresh(
      controller: _controller,
      header: BallPulseHeader(),
      child: Column(
        children: list.map((item) {
          return InkWell(
            splashColor: Colors.transparent,
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                Image.asset(item, fit: BoxFit.fitWidth, width: MediaQueryData.fromWindow(ui.window).size.width),
                Container(height: 0.5, color: Color(0xFFDDDDDD), margin: EdgeInsets.only(top: 10)),
              ],
            ),
            onTap: () => Navigator.of(context).push(RouteBuilders.slideFromRight(WebViewPage('https://m.lianjia.com/subject/24666.h5'))),
          );
        }).toList(),
      ),
      onRefresh: () async {
        List<String> temp = [];
        temp.addAll(_listA);
        _listA.clear();
        _listA.addAll(temp.reversed);
        temp.clear();
        temp.addAll(_listB);
        _listB.clear();
        _listB.addAll(temp.reversed);
        temp.clear();
        temp.addAll(_listD);
        _listD.clear();
        _listD.addAll(temp.reversed);
        await Future.delayed(Duration(seconds: 2), () {
          setState(() {});
        });
        await Future.delayed(Duration(milliseconds: 500), () {
          _controller.resetRefreshState();
        });
      },
    );
  }
}
