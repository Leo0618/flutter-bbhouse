import 'dart:convert';

import 'package:bbhouse/data/HomeModel.dart';
import 'package:flutter/services.dart';

/// function: data_repository
/// <p>Created by Leo on 2019/5/10.</p>
///

class Api {
  static const test = 'test.json';
}

class DataRepo {
  static Future<HomeModel> getHomeData() async {
    //模拟网络请求数据
    String homeStr = await rootBundle.loadString('assets/data_home.json');
    return HomeModel.fromJson(json.decode(homeStr));
  }
}
