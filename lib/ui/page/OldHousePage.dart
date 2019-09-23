import 'package:bbhouse/comm/c.dart';
import 'package:bbhouse/ui/page/OldHousePageTitlebar.dart';
import 'package:bbhouse/util/util_screen.dart';
import 'package:flutter/material.dart';

import '../../r.dart';

/// function: OldHousePage
/// <p>Created by Leo on 2019/9/23.</p>
class OldHousePage extends StatefulWidget {
  final String title;

  OldHousePage(String title) : this.title = title ?? '';

  @override
  State<StatefulWidget> createState() {
    return _OldHousePageState();
  }
}

class _OldHousePageState extends State<OldHousePage> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  bool _hideStepIndicator = true;
  Color _stepIndicatorColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          _buildContentView(context),
          OldHousePageTitlebar(_scrollController, 200, (offsetLast) {
            setState(() {
              _hideStepIndicator = offsetLast > 0;
            });
          }),
          Offstage(
            offstage: _hideStepIndicator,
            child: Container(
              height: 50,
              margin: EdgeInsets.only(top: UtilScreen.getInstance().topBarHeight),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        //TODO
                        Padding(padding: EdgeInsets.only(left: 20, right: 20), child: Text('房源', style: TextStyle(fontSize: 15, color: _stepIndicatorColor))),
                        Padding(padding: EdgeInsets.only(left: 20, right: 20), child: Text('动态', style: TextStyle(fontSize: 15, color: _stepIndicatorColor))),
                        Padding(padding: EdgeInsets.only(left: 20, right: 20), child: Text('小区', style: TextStyle(fontSize: 15, color: _stepIndicatorColor))),
                        Padding(padding: EdgeInsets.only(left: 20, right: 20), child: Text('推荐', style: TextStyle(fontSize: 15, color: _stepIndicatorColor))),
                      ],
                    ),
                  ),
                  Container(color: C.divider, height: 0.5),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildContentView(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: _list(),
      ),
    );
  }

  List<Widget> _list() {
    List<Widget> widgets = [];
    widgets.add(Container(height: 250, width: double.infinity, child: Image.asset(R.assetsImgHouseBig, fit: BoxFit.cover)));
    for (int i = 0; i < 50; i++) {
      widgets.add(Padding(padding: EdgeInsets.all(10), child: Text('Item==$i', style: TextStyle(fontSize: 14, color: Colors.black))));
    }
    return widgets;
  }
}
