import 'package:bbhouse/ui/widget/page_route_builders.dart';
import 'package:flutter/material.dart';

import '../../r.dart';
import 'WebViewPage.dart';

/// function: HomePageNews
/// <p>Created by Leo on 2019/9/18.</p>
class HomePageNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('资讯速递', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black)),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Expanded(
                  child: InkWell(
                    child: Image.asset(R.assetsImgHomeNews1),
                    onTap: () => Navigator.of(context).push(RouteBuilders.slideFromRight(WebViewPage('https://m.lianjia.com/subject/24666.h5'))),
                  ),
                  flex: 1),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: <Widget>[
                    InkWell(
                      child: Image.asset(R.assetsImgHomeNews2),
                      onTap: () => Navigator.of(context).push(RouteBuilders.slideFromRight(WebViewPage('https://m.lianjia.com/subject/24666.h5'))),
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      child: Image.asset(R.assetsImgHomeNews3),
                      onTap: () => Navigator.of(context).push(RouteBuilders.slideFromRight(WebViewPage('https://m.lianjia.com/subject/24666.h5'))),
                    ),
                  ],
                ),
                flex: 2,
              )
            ],
          ),
        ],
      ),
    );
  }
}
