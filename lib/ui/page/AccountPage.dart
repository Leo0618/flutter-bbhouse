import 'dart:convert';

import 'package:bbhouse/bloc/index_bloc.dart';
import 'package:bbhouse/comm/c.dart';
import 'package:bbhouse/data/UserInfoModel.dart';
import 'package:bbhouse/data/user_info_manager.dart';
import 'package:bbhouse/ui/page/LoginPage.dart';
import 'package:bbhouse/ui/page/SettingsPage.dart';
import 'package:bbhouse/ui/widget/page_route_builders.dart';
import 'package:bbhouse/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../r.dart';

/// function: AccountPage
/// <p>Created by Leo on 2019/9/16.</p>
class AccountPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AccountPageState();
  }
}

class _AccountPageState extends State<AccountPage> {
  bool _dataLoaded = false;

  _initData(MineBloc _bloc, BuildContext context) {
    if (_dataLoaded) return;
    _dataLoaded = true;
    ApplicationBloc _appBloc = BlocProvider.of<ApplicationBloc>(context);
    _appBloc.appEventStream.listen((userInfoModel) {
      if (userInfoModel is UserInfoModel) {
        _bloc.userInfoSink.add(userInfoModel);
      }
    });

    UserInfoManager.isLogin().then((userInfoStr) {
      if (userInfoStr.isEmpty) return;
      UserInfoModel model = UserInfoModel.fromJson(jsonDecode(userInfoStr));
      if (model == null) return;
      _bloc.userInfoSink.add(model);
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      double currentOffset = _scrollController.offset;
      setState(() {
        if (currentOffset >= 120) {
          _title = '我的';
        } else {
          _title = '';
        }
      });
      lastOffset = currentOffset;
    });
  }

  @override
  void dispose() {
    if (_scrollController != null) _scrollController.dispose();
    super.dispose();
  }

  double lastOffset = 0;
  String _title = '';
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    MineBloc _bloc = BlocProvider.of<MineBloc>(context);
    _initData(_bloc, context);
    return Scaffold(
      appBar: AppBar(
        title: Text(_title, style: TextStyle(color: Colors.white)),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: C.app_main,
        actions: <Widget>[
          InkWell(
            child: Container(padding: EdgeInsets.all(15), child: Icon(Icons.settings)),
            onTap: () {
              UserInfoManager.isLogin().then((userInfo) {
                if (userInfo == null || userInfo.length == 0) {
                  Navigator.of(context).push(RouteBuilders.slideFromRight(LoginPage()));
                } else {
                  Navigator.of(context).push(RouteBuilders.slideFromRight(SettingsPage()));
                }
              });
            },
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(height: double.infinity, color: C.app_main),
          EasyRefresh(
            scrollController: _scrollController,
            bottomBouncing: false,
            child: Column(
              children: <Widget>[
                Container(
                  height: 120,
                  color: C.app_main,
                  padding: EdgeInsets.all(20),
                  child: InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(width: 20),
                        Image.asset(R.assetsImgDefaultAvatar, width: 60, height: 60),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(top: 15),
                            child: StreamBuilder(
                              stream: _bloc.userInfoStream,
                              builder: (BuildContext context, AsyncSnapshot<UserInfoModel> snapshot) {
                                String phone;
                                try {
                                  phone = snapshot.data.phone;
                                } catch (e) {}
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      phone == null ? '登录/注册' : phone.substring(0, 4) + '****' + phone.substring(phone.length - 4),
                                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: 7),
                                    Text(
                                      phone == null ? '注册手机号不会透露给经纪人' : '查看并编辑个人资料',
                                      style: TextStyle(color: Color(0xFFBAD0FD), fontSize: 12),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      UserInfoManager.isLogin().then((userInfo) {
                        if (userInfo == null || userInfo.length == 0) {
                          Navigator.of(context).push(RouteBuilders.slideFromRight(LoginPage()));
                        } else {
                          Utils.wait('个人资料');
                        }
                      });
                    },
                  ),
                ),
                Image.asset(R.assetsImgMine1, fit: BoxFit.fitWidth),
                Image.asset(R.assetsImgMine2, fit: BoxFit.fitWidth),
                Image.asset(R.assetsImgMine3, fit: BoxFit.fitWidth),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
