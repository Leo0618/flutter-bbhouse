import 'package:bbhouse/comm/c.dart';
import 'package:bbhouse/data/user_info_manager.dart';
import 'package:bbhouse/util/utils.dart';
import 'package:flutter/material.dart';

/// function: SettingsPage
/// <p>Created by Leo on 2019/9/19.</p>
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('设置', style: TextStyle(color: Colors.black)),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
            splashColor: Colors.transparent,
            child: Container(
              height: 60,
              decoration: BoxDecoration(color: Color(0xFFF4F7FE), borderRadius: BorderRadius.circular(7.0)),
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: Center(child: Text('退出登录', style: TextStyle(fontSize: 16, color: C.app_main, fontWeight: FontWeight.w600))),
            ),
            onTap: () {
              UserInfoManager.logout(context);
              Utils.toast('已退出登录');
            },
          ),
        ],
      ),
    );
  }
}
