import 'package:bbhouse/comm/c.dart';
import 'package:bbhouse/ui/widget/TagWidget.dart';
import 'package:bbhouse/ui/widget/page_route_builders.dart';
import 'package:bbhouse/util/utils.dart';
import 'package:flutter/material.dart';

import '../../r.dart';
import 'WebViewPage.dart';

/// function: HomePageRecommXin
/// <p>Created by Leo on 2019/9/18.</p>
class HomePageRecommXin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('为你推荐新房', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black)),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Expanded(
                  child: InkWell(
                    child: Image.asset(R.assetsImgHomexin1),
                    onTap: () => Navigator.of(context).push(RouteBuilders.slideFromRight(WebViewPage('https://m.lianjia.com/subject/24666.h5'))),
                  ),
                  flex: 1),
              SizedBox(width: 5),
              Expanded(
                  child: InkWell(
                    child: Image.asset(R.assetsImgHomexin2),
                    onTap: () => Navigator.of(context).push(RouteBuilders.slideFromRight(WebViewPage('https://m.lianjia.com/subject/24666.h5'))),
                  ),
                  flex: 1),
              SizedBox(width: 5),
              Expanded(
                  child: InkWell(
                    child: Image.asset(R.assetsImgHomexin3),
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
              child: Center(child: Text('更多新房', style: TextStyle(fontSize: 16, color: C.app_main, fontWeight: FontWeight.w600))),
            ),
            onTap: () => Utils.wait('更多新房'),
          )
        ],
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildListItem(
          context,
          R.assetsImgHouse4,
          '华润城万象府',
          '地铁口，成熟片区，配套丰富',
          '102000元/平',
          '建面 90-400㎡',
          ['地铁沿线', '公交直达', '购物方便', '娱乐丰富'],
        ),
        _buildListItem(
          context,
          R.assetsImgHouse5,
          '中森公园华府',
          '住宅 龙华区 观澜',
          '45000元/平',
          '建面 69-121㎡',
          ['绿化率高'],
        ),
        _buildListItem(
          context,
          R.assetsImgHouse6,
          '佳兆业盐田城市广场',
          '山海间的百万建面综合体',
          '48000元/平',
          '建面 71-140㎡',
          ['品牌房企', '人车分离', '购物方便', '娱乐丰富'],
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
          Container(width: double.infinity, height: 0.5, color: Color(0xFFDDDDDD), margin: EdgeInsets.only(top: 15, bottom: 15)),
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
        ],
      ),
      onTap: () => Navigator.of(context).push(RouteBuilders.slideFromRight(WebViewPage('https://m.lianjia.com/subject/24666.h5'))),
      onLongPress: () => Utils.wait('长按-' + title),
    );
  }
}
