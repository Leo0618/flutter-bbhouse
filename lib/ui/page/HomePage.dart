import 'dart:async';

import 'package:bbhouse/bloc/index_bloc.dart';
import 'package:bbhouse/comm/c.dart';
import 'package:bbhouse/data/HomeModel.dart';
import 'package:bbhouse/ui/page/HomePageCateTab.dart';
import 'package:bbhouse/ui/page/HomePageHotTopic.dart';
import 'package:bbhouse/ui/page/HomePageZhishu.dart';
import 'package:bbhouse/ui/page/WebViewPage.dart';
import 'package:bbhouse/ui/widget/marquee/flutter_marquee.dart';
import 'package:bbhouse/ui/widget/page_route_builders.dart';
import 'package:bbhouse/util/util_screen.dart';
import 'package:bbhouse/util/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../r.dart';

/// function: HomePage
/// <p>Created by Leo on 2019/9/16.</p>
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (_bloc != null) _bloc.dispose();
    if (_controller != null) _controller.dispose();
  }

  HomeBloc _bloc;
  bool _dataLoaded = false;

  _initDataOnce() {
    if (_dataLoaded) return;
    _dataLoaded = true;
    Future.delayed(Duration(seconds: 1), () {
      _bloc.getHomeData();
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<HomeBloc>(context);
    _initDataOnce();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
        child: SafeArea(top: true, child: Offstage()),
      ),
      body: Column(
        children: <Widget>[
          _buildTitleSearch(context),
          Expanded(child: _buildContent(context)),
        ],
      ),
    );
  }

  EasyRefreshController _controller = EasyRefreshController();

  //可刷新内容视图
  Widget _buildContent(BuildContext context) {
    return EasyRefresh(
      controller: _controller,
      header: BallPulseHeader(),
      child: StreamBuilder(
          stream: _bloc.homeStream,
          builder: (BuildContext context, AsyncSnapshot<HomeModel> snapshot) {
            if (snapshot == null || snapshot.data == null) {
              return Center(child: Image.asset(R.assetsImgEmpty));
            } else {
              HomeModel model = snapshot.data;
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    _buildIconsGridList(model.icons),
                    _createSlogan(),
                    HomePageZhishu(),
                    HomePageCateTab(model.cateTab),
                    HomePageHotTopic(),
                  ],
                ),
              );
            }
          }),
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 1), () {
          _bloc.getHomeData();
          _controller.resetRefreshState();
        });
      },
    );
  }

  //slogan
  Widget _createSlogan() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: InkWell(
        child: Image.asset(R.assetsImgSlogan),
        onTap: () => Navigator.of(context).push(
          RouteBuilders.slideFromRight(WebViewPage('https://activity.ke.com/tercen_purase/mainroom?activityId=130&city_id=440300')),
        ),
      ),
    );
  }

  //图标grid入口
  Widget _buildIconsGridList(List<IconsListBean> icons) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: GridView.count(
        crossAxisSpacing: 25.0,
        mainAxisSpacing: 20.0,
        primary: false,
        crossAxisCount: 5,
        shrinkWrap: true,
        children: icons.map((item) {
          return InkWell(
            splashColor: Colors.transparent,
            child: Column(
              children: <Widget>[
                Expanded(child: FadeInImage.assetNetwork(placeholder: R.assetsImgImgDefaultSquarSmall, image: item.imgUrl)),
                SizedBox(height: 7),
                Text(item.title, style: TextStyle(color: Color(0xFF333333), fontSize: 10)),
              ],
            ),
            onTap: () => Utils.wait(item.title),
          );
        }).toList(),
      ),
    );
  }

  //搜索标题栏
  Widget _buildTitleSearch(BuildContext context) {
    return Row(
      children: <Widget>[
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
                  child: FlutterMarquee(
                    children: ["龙珠花园", "阳光花园", "尚水天成", "万象天成"].map((item) {
                      return Text(item, style: TextStyle(fontSize: 17, color: C.app_gray), softWrap: true, overflow: TextOverflow.fade);
                    }).toList(),
                    duration: 4,
                    itemDuration: 1200,
                    singleLine: true,
                  ),
                ),
              ],
            ),
          ),
          onTap: () => Utils.wait('搜索'),
        )),
        new InkWell(
          child: Row(
            children: <Widget>[
              new Image.asset(R.assetsImgIconNavLocation, width: 30, height: 30, fit: BoxFit.fill),
              Text('深圳', style: TextStyle(fontSize: 16)),
            ],
          ),
          onTap: () => Utils.wait('定位'),
        ),
        SizedBox(width: 20),
      ],
    );
  }
}
