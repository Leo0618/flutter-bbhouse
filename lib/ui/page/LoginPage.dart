import 'dart:convert';

import 'package:bbhouse/bloc/index_bloc.dart';
import 'package:bbhouse/comm/c.dart';
import 'package:bbhouse/comm/const.dart';
import 'package:bbhouse/data/UserInfoModel.dart';
import 'package:bbhouse/generated/i18n.dart';
import 'package:bbhouse/ui/widget/app_dialog.dart';
import 'package:bbhouse/util/util_sp.dart';
import 'package:bbhouse/util/utils.dart';
import 'package:flutter/material.dart';

/// function: LoginPage
/// <p>Created by Leo on 2019/9/16.</p>
class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String phone;
  String password;

  void _loginNow() {
    if (phone == null || phone.length == 0) {
      Utils.toast(S.current.hint_login_input_account);
      return;
    }
    if (password == null || password.length == 0) {
      Utils.toast(S.current.hint_login_input_checkcode);
      return;
    }
    showDialog<Null>(context: context, barrierDismissible: false, builder: (c) => new LoadingDialog(text: '登录中'));
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pop(context);
      var model = UserInfoModel(phone: phone, password: password);
      SPUtil.putString(Const.KEY_USER_INFO, jsonEncode(model));
      BlocProvider.of<ApplicationBloc>(context).sendAppEvent(model);
      Utils.toast(S.current.hint_login_success);
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        title: Text(S.current.text_login),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            TextField(
              onChanged: (data) => phone = data,
              keyboardType: TextInputType.phone,
              style: TextStyle(fontSize: 17.0, color: C.app_main),
              decoration: InputDecoration(
                hintText: S.current.hint_login_input_account,
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(10.0),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: (data) => password = data,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 17.0, color: C.app_main),
              decoration: InputDecoration(
                hintText: S.current.hint_login_input_checkcode,
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(10.0),
              ),
            ),
            SizedBox(height: 50),
            InkWell(
              child: Container(
                width: double.infinity,
                height: 50,
                color: C.app_main,
                child: Center(child: Text(S.current.text_login, style: TextStyle(color: Colors.white, fontSize: 18))),
              ),
              onTap: _loginNow,
            ),
          ],
        ),
      ),
    );
  }
}
