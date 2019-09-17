import 'package:bbhouse/comm/const.dart';
import 'package:bbhouse/util/util_sp.dart';
import 'package:flutter/material.dart';

/// function: user_info_manager
/// <p>Created by Leo on 2019/5/21.</p>
class UserInfoManager {
  /// 当前是否已登录(已登录：返回本地缓存的登录信息)
  static Future<String> isLogin() async {
    return await SPUtil.getString(Const.KEY_USER_INFO);
  }

  /// 刷新用户信息，获取到后会发全局通知事件
  static void refreshUserInfo(BuildContext context) async {
    isLogin().then((userInfoStr) {
      if (userInfoStr.isEmpty) return;
//      DataRepo.getUserInfo().then((model) {
//        if (model != null) {
//          SPUtil.putString(Const.KEY_USER_INFO, jsonEncode(model));
//          BlocProvider.of<ApplicationBloc>(context).sendAppEvent(model);
//        }
//      });
    });
  }

  /// 退出登录
  static void logout(BuildContext context) {
    SPUtil.putString(Const.KEY_USER_INFO, '');
//    UserInfoModel model = new UserInfoModel(userInfo: UserInfo(), userConfig: UserConfig());
//    BlocProvider.of<ApplicationBloc>(context).sendAppEvent(model);
  }
}
