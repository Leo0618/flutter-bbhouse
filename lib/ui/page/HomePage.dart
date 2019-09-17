import 'dart:async';

import 'package:bbhouse/bloc/index_bloc.dart';
import 'package:bbhouse/comm/c.dart';
import 'package:bbhouse/data/HomeModel.dart';
import 'package:bbhouse/ui/widget/marquee/flutter_marquee.dart';
import 'package:bbhouse/util/util_screen.dart';
import 'package:bbhouse/util/utils.dart';
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
  }

  HomeBloc _bloc;
  bool _dataLoaded = false;
  GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>(debugLabel: '_HomePageState');

  _initDataOnce() {
    if (_dataLoaded) return;
    _dataLoaded = true;
    Future.delayed(Duration(seconds: 2), () {
      _bloc.getHomeData();
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<HomeBloc>(context);
    _initDataOnce();
    return Scaffold(
      key: _globalKey,
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

  Widget _buildContent(BuildContext context) {
    return EasyRefresh(
      controller: _controller,
      header: BallPulseHeader(),
      child: _buildContentView(context),
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 2), () {
          _controller.resetRefreshState();
        });
      },
    );
  }

  Widget _buildContentView(BuildContext context) {
    return StreamBuilder(
        stream: _bloc.homeStream,
        builder: (BuildContext context, AsyncSnapshot<HomeModel> snapshot) {
          if (snapshot == null || snapshot.data == null) {
            return Center(child: Image.asset(R.assetsImgEmpty));
          } else {
            return new CustomScrollView(
              shrinkWrap: true,
              slivers: <Widget>[
                new SliverPadding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  sliver: new SliverList(
                    delegate: new SliverChildListDelegate(
                      <Widget>[], //TODO
                    ),
                  ),
                ),
              ],
            );
          }
        });
  }

  Widget _buildTitleSearch(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
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
                FlutterMarquee(
                  texts: ["龙珠花园", "阳光花园", "尚水天成", "万象天成"].toList(),
                  seletedTextColor: C.app_gray,
                  textColor: C.app_gray,
                  duration: 4,
                  itemDuration: 1200,
                  singleLine: true,
                ),
              ],
            ),
          ),
        ),
        new InkWell(
          child: Row(
            children: <Widget>[
              new Image.asset(R.assetsImgIconNavLocation, width: 30, height: 30, fit: BoxFit.fill),
              Text('深圳', style: TextStyle(fontSize: 16)),
            ],
          ),
          onTap: () {
            Utils.showWaiting(_globalKey);
          },
        ),
        SizedBox(width: 20),
      ],
    );
  }
}
