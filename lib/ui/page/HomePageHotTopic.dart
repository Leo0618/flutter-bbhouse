import 'package:bbhouse/ui/widget/page_route_builders.dart';
import 'package:flutter/material.dart';

import '../../r.dart';
import 'WebViewPage.dart';

/// function: HomePageHotTopic
/// <p>Created by Leo on 2019/9/18.</p>
class HomePageHotTopic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('热门主题', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black)),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Expanded(child: _buildItem(context, '贝壳看房团', '带你看好房', R.assetsImgHotIc1)),
              SizedBox(width: 1),
              Expanded(child: _buildItem(context, '300万内', '降价两房', R.assetsImgHotIc2)),
              SizedBox(width: 1),
              Expanded(child: _buildItem(context, '地铁精装房', '450万内', R.assetsImgHotIc3)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, String title, String desc, String icon) {
    return InkWell(
      splashColor: Colors.transparent,
      child: Container(
        height: 70,
        padding: EdgeInsets.all(5),
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: new Border.all(color: Color(0xFFE5E5E5), width: 0.5),
                color: Colors.white,
                borderRadius: BorderRadius.circular((5.0)),
                boxShadow: [BoxShadow(color: Color(0xFFE5E5E5), blurRadius: 2.0, spreadRadius: 1.0)],
              ),
            ),
            Align(
              alignment: FractionalOffset.bottomRight,
              child: Image.asset(icon, width: 30, height: 30),
            ),
            Align(
              alignment: FractionalOffset.topLeft,
              child: Container(
                margin: EdgeInsets.only(left: 10, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(title, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15)),
                    Text(desc, style: TextStyle(color: Colors.black, fontSize: 11)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () => Navigator.of(context).push(RouteBuilders.slideFromRight(WebViewPage('https://m.lianjia.com/subject/24666.h5'))),
    );
  }
}
