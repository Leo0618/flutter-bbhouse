import 'package:bbhouse/comm/c.dart';
import 'package:bbhouse/ui/widget/TagWidget.dart';
import 'package:bbhouse/ui/widget/page_route_builders.dart';
import 'package:bbhouse/util/utils.dart';
import 'package:flutter/material.dart';

import '../../r.dart';
import 'WebViewPage.dart';

/// function: HomePageRecommZu
/// <p>Created by Leo on 2019/9/18.</p>
class HomePageRecommZu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('为你推荐租房', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black)),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Expanded(
                  child: InkWell(
                    child: Image.asset(R.assetsImgHomezu1),
                    onTap: () => Navigator.of(context).push(RouteBuilders.slideFromRight(WebViewPage('https://m.lianjia.com/subject/24666.h5'))),
                  ),
                  flex: 1),
              SizedBox(width: 5),
              Expanded(
                  child: InkWell(
                    child: Image.asset(R.assetsImgHomezu2),
                    onTap: () => Navigator.of(context).push(RouteBuilders.slideFromRight(WebViewPage('https://m.lianjia.com/subject/24666.h5'))),
                  ),
                  flex: 1),
              SizedBox(width: 5),
              Expanded(
                  child: InkWell(
                    child: Image.asset(R.assetsImgHomezu3),
                    onTap: () => Navigator.of(context).push(RouteBuilders.slideFromRight(WebViewPage('https://m.lianjia.com/subject/24666.h5'))),
                  ),
                  flex: 1),
            ],
          ),
          SizedBox(height: 10),
          _buildList(context),
          InkWell(
            splashColor: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF4F7FE),
                borderRadius: BorderRadius.circular(7.0),
              ),
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: Center(child: Text('更多租房', style: TextStyle(fontSize: 16, color: C.app_main, fontWeight: FontWeight.w600))),
            ),
            onTap: () => Utils.wait('更多租房'),
          )
        ],
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(width: double.infinity, height: 0.5, color: Color(0xFFDDDDDD)),
        _buildListItem(
          context,
          R.assetsImgHouse7,
          '整租·常福楼 1室1厅 西南',
          '链家30㎡翻身 距新安站1.2km',
          '1200元/月',
          '',
          ['近地铁', '新上'],
        ),
        _buildListItem(
          context,
          R.assetsImgHouse8,
          '整租·富通蟠龙居 1室0厅 东南',
          '职业房东 23㎡ 西乡 距西乡站0.8km',
          '1698元/月',
          '',
          ['月租', '近地铁', '精装', '新上', '随时看房'],
        ),
        _buildListItem(
          context,
          R.assetsImgHouse9,
          '合·冠名花园 4居室 南卧',
          '四季时代酒店公寓 9㎡ 西丽',
          '1930元/月',
          '',
          ['精装', '押一付一', '新上', '随时看房'],
        ),
      ],
    );
  }

  Widget _buildListItem(
    BuildContext context,
    String img,
    String title,
    String desc,
    String priceTotal,
    String priceUnit,
    List<String> tags,
  ) {
    return InkWell(
      child: Column(
        children: <Widget>[
          SizedBox(height: 15),
          Row(
            children: <Widget>[
              Expanded(child: Image.asset(img), flex: 1),
              SizedBox(width: 15),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        desc,
                        style: TextStyle(fontSize: 12, color: Colors.black),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: tags.map((item) {
                          return Row(
                            children: <Widget>[
                              TagWidget(item, tagNameColor: Color(0xFF9EAFBF), bgColor: Color(0xFFECEFF2)),
                              SizedBox(width: 5),
                            ],
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: <Widget>[
                          Text(priceTotal, style: TextStyle(fontSize: 14, color: Colors.redAccent)),
                          SizedBox(width: 10),
                          Expanded(child: Text(priceUnit, style: TextStyle(fontSize: 12, color: C.app_gray))),
                          Text('···', style: TextStyle(color: C.app_gray, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                  flex: 2),
            ],
          ),
          Container(width: double.infinity, height: 0.5, color: Color(0xFFDDDDDD), margin: EdgeInsets.only(top: 15)),
        ],
      ),
      onTap: () => Navigator.of(context).push(RouteBuilders.slideFromRight(WebViewPage('https://m.lianjia.com/subject/24666.h5'))),
      onLongPress: () => Utils.wait('长按-' + title),
    );
  }
}
