import 'package:bbhouse/bloc/index_bloc.dart';
import 'package:bbhouse/comm/c.dart';
import 'package:bbhouse/data/user_info_manager.dart';
import 'package:bbhouse/generated/i18n.dart';
import 'package:bbhouse/ui/page/AccountPage.dart';
import 'package:bbhouse/ui/page/FeedPage.dart';
import 'package:bbhouse/ui/page/NewsPage.dart';
import 'package:bbhouse/ui/widget/page_route_builders.dart';
import 'package:flutter/material.dart';

import '../../r.dart';
import 'HomePage.dart';
import 'LoginPage.dart';

/// function: MainPage
/// <p>Created by Leo on 2019/9/12.</p>
class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  int _tabIndex = 0;
  var _tabImages;
  var _appBarTitles;
  var _pageList;

  @override
  void initState() {
    super.initState();
    _tabImages = [
      [createTabImage(R.assetsImgIconHomeNormal), createTabImage(R.assetsImgIconHomeSelected)],
      [createTabImage(R.assetsImgIconFeedlistNormal), createTabImage(R.assetsImgIconFeedlistSelected)],
      [createTabImage(R.assetsImgIconNewsNormal), createTabImage(R.assetsImgIconNewsSelected)],
      [createTabImage(R.assetsImgIconAccountNormal), createTabImage(R.assetsImgIconAccountSelected)]
    ];
    _pageList = [
      BlocProvider(child: new HomePage(), bloc: new HomeBloc()),
      FeedPage(),
      NewsPage(),
      AccountPage(),
    ];
  }

  //根据image路径获取图片
  Image tabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return _tabImages[curIndex][1];
    }
    return _tabImages[curIndex][0];
  }

  //获取bottomTab的颜色和文字
  Text tabTitle(int curIndex) {
    if (curIndex == _tabIndex) {
      return new Text(_appBarTitles[curIndex], style: new TextStyle(fontSize: 12.0, color: C.app_main));
    } else {
      return new Text(_appBarTitles[curIndex], style: new TextStyle(fontSize: 12.0, color: C.app_gray));
    }
  }

  Image createTabImage(img) {
    return new Image.asset(img, width: 24, height: 24);
  }

  @override
  Widget build(BuildContext context) {
    _appBarTitles = [S.current.main_tab_home, S.current.main_tab_feedlist, S.current.main_tab_news, S.current.main_tab_account];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
            child: IndexedStack(
          index: _tabIndex,
          children: _pageList,
        )),
        new BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedFontSize: 12.0,
          unselectedFontSize: 12.0,
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(icon: tabIcon(0), title: tabTitle(0)),
            new BottomNavigationBarItem(icon: tabIcon(1), title: tabTitle(1)),
            new BottomNavigationBarItem(icon: tabIcon(2), title: tabTitle(2)),
            new BottomNavigationBarItem(icon: tabIcon(3), title: tabTitle(3)),
          ],
          currentIndex: _tabIndex,
          iconSize: 24,
          onTap: (index) {
            if (index == 2) {
              UserInfoManager.isLogin().then((userInfo) {
                if (userInfo == null || userInfo.length == 0) {
                  Navigator.of(context).push(RouteBuilders.slideFromRight(LoginPage()));
                } else {
                  setState(() {
                    _tabIndex = index;
                  });
                }
              });
            } else {
              setState(() {
                _tabIndex = index;
              });
            }
          },
        ),
      ],
    );
  }
}
