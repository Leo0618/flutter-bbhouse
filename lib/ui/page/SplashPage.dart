import 'package:bbhouse/comm/c.dart';
import 'package:bbhouse/comm/const.dart';
import 'package:flog/flog.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../r.dart';
import '../../comm/info.dart';
import 'MainPage.dart';

/// function: SplashPage
/// <p>Created by Leo on 2019/5/8.</p>
class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  //延迟秒数
  double _delayTime = 2;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    int star = DateTime.now().millisecondsSinceEpoch;
    Flog.config(Const.DEBUG);
    bool deviceInitFinish = await Info.init();
    if (deviceInitFinish) {
      double costTime = (DateTime.now().millisecondsSinceEpoch - star) / 1000;
      costTime = (costTime < _delayTime) ? _delayTime - costTime : costTime;
      Observable.just(1).delay(new Duration(seconds: costTime.toInt())).listen((_) {
        Navigator.pushReplacement(context, new MaterialPageRoute(builder: (BuildContext ctx) => new MainPage()));
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: C.bg_window,
      child: Image.asset(
        R.assetsImgBgSplash,
        fit: BoxFit.fill,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
