import 'dart:async';

import 'package:bbhouse/comm/c.dart';
import 'package:bbhouse/data/HomeModel.dart';
import 'package:bbhouse/ui/widget/page_route_builders.dart';
import 'package:flutter/material.dart';

import '../../r.dart';
import 'WebViewPage.dart';

/// function: HomePageCateTab
/// <p>Created by Leo on 2019/9/18.</p>
class HomePageCateTab extends StatefulWidget {
  final List<CateTabListBean> data;

  HomePageCateTab(this.data);

  @override
  State<StatefulWidget> createState() {
    return _HomePageCateTabState();
  }
}

class _HomePageCateTabState extends State<HomePageCateTab> with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _currentSelectedIndex = 0;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: _currentSelectedIndex, length: widget.data.length, vsync: this);
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        _currentSelectedIndex = (_currentSelectedIndex + 1) % widget.data.length;
        _tabController.index = _currentSelectedIndex;
      });
    });
  }

  @override
  void dispose() {
    if (_tabController != null) _tabController.dispose();
    if (_timer != null) {
      _timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TabBar(
            controller: _tabController,
            isScrollable: true,
            labelColor: Colors.black,
            indicatorColor: Colors.transparent,
            unselectedLabelColor: C.app_gray,
            labelPadding: EdgeInsets.only(left: 5, right: 5),
            labelStyle: TextStyle(fontSize: 15),
            onTap: (index) {
              setState(() {
                _currentSelectedIndex = index;
              });
            },
            tabs: _buildTiltes(),
          ),
          SizedBox(height: 10),
          Container(
            constraints: BoxConstraints(maxHeight: 120),
            child: TabBarView(
              controller: _tabController,
              physics: NeverScrollableScrollPhysics(),
              children: _buildPages(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPages() {
    List<Widget> widgets = [];
    for (int x = 0; x < widget.data.length; x++) {
      List<TabListListBean> list = widget.data[x].tabList;
      widgets.add(
        GridView.count(
          crossAxisSpacing: 15.0,
          primary: false,
          crossAxisCount: 3,
          shrinkWrap: true,
          children: list.map((item) {
            int index = list.indexOf(item);
            return InkWell(
              splashColor: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF7F7F7),
                  borderRadius: BorderRadius.circular((5.0)),
                  boxShadow: [BoxShadow(color: Color(0xFFF7F7F7), blurRadius: 1.0, spreadRadius: 1.0)],
                ),
                padding: EdgeInsets.fromLTRB(15, 10, 10, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(item.txt1, style: TextStyle(color: index == 0 ? Color(0xFF971900) : index == 1 ? Color(0xFF3D5A6C) : Color(0xFF85653A), fontSize: 13)),
                    SizedBox(height: 20),
                    Text(item.txt2, style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text(item.txt3, style: TextStyle(color: Color(0xFF333333), fontSize: 13)),
                  ],
                ),
              ),
              onTap: () => Navigator.of(context).push(RouteBuilders.slideFromRight(WebViewPage(item.url))),
            );
          }).toList(),
        ),
      );
    }
    return widgets;
  }

  List<Widget> _buildTiltes() {
    List<Widget> widgets = [];
    for (int x = 0; x < widget.data.length; x++) {
      widgets.add(_buildTitle(_currentSelectedIndex == x, widget.data[x].title));
    }
    return widgets;
  }

  Widget _buildTitle(bool selected, String title) {
    return selected
        ? Container(
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage(R.assetsImgBgAlert))),
            padding: EdgeInsets.fromLTRB(12, 5, 12, 10),
            child: Text(title, style: TextStyle(color: Colors.white, fontSize: 13)),
          )
        : Container(
            decoration: BoxDecoration(
              border: new Border.all(color: Color(0xFFE5E5E5), width: 0.5),
              color: Colors.white,
              borderRadius: BorderRadius.circular((3.0)),
              boxShadow: [BoxShadow(color: Color(0xFFE5E5E5), offset: Offset(0, 2), blurRadius: 3.0, spreadRadius: 1.0)],
            ),
            margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
            padding: EdgeInsets.fromLTRB(12, 5, 12, 5),
            child: Text(title, style: TextStyle(color: Colors.black, fontSize: 13)),
          );
  }
}
