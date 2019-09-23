import 'package:bbhouse/comm/c.dart';
import 'package:bbhouse/ui/widget/TagWidget.dart';
import 'package:bbhouse/ui/widget/page_route_builders.dart';
import 'package:bbhouse/util/utils.dart';
import 'package:flutter/material.dart';

import '../../r.dart';
import 'ErshouPage.dart';
import 'WebViewPage.dart';
import 'OldHousePage.dart';

/// function: HomePageRecommErshou
/// <p>Created by Leo on 2019/9/18.</p>
class HomePageRecommErshou extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('为你推荐二手房', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black)),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Expanded(
                  child: InkWell(
                    child: Image.asset(R.assetsImgHomeershou1),
                    onTap: () => Navigator.of(context).push(RouteBuilders.slideFromRight(WebViewPage('https://m.lianjia.com/subject/24666.h5'))),
                  ),
                  flex: 1),
              SizedBox(width: 5),
              Expanded(
                  child: InkWell(
                    child: Image.asset(R.assetsImgHomeershou2),
                    onTap: () => Navigator.of(context).push(RouteBuilders.slideFromRight(WebViewPage('https://m.lianjia.com/subject/24666.h5'))),
                  ),
                  flex: 1),
              SizedBox(width: 5),
              Expanded(
                  child: InkWell(
                    child: Image.asset(R.assetsImgHomeershou3),
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
              child: Center(child: Text('更多二手房', style: TextStyle(fontSize: 16, color: C.app_main, fontWeight: FontWeight.w600))),
            ),
            onTap: () => Navigator.push(context, RouteBuilders.slideFromRight(new ErshouPage())),
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
          R.assetsImgHouse1,
          '佳兆业大都汇 2室2厅 北',
          '龙岗区 布吉关 | 80㎡ | 高楼层 共33层',
          '242万',
          '30,250元/平',
          ['必看好房', '满五年', 'VR看房', '近地铁'],
        ),
        _buildListItem(
          context,
          R.assetsImgHouse2,
          '中海半山溪谷公园 2室1厅 东北',
          '盐田区 盐田港 | 74.5㎡ | 中楼层 共9层',
          '260万',
          '34,890元/平',
          ['必看好房', '满五年', 'VR看房', '随时可看'],
        ),
        _buildListItem(
          context,
          R.assetsImgHouse3,
          '领航城领尚花园 1室1厅 东',
          '宝安区 西乡 | 51.7㎡ | 低楼层 共31层',
          '289万',
          '55,921元/平',
          ['必看好房', '满五年', 'VR看房', '房主推荐'],
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
                          int index = tags.indexOf(item);
                          return Row(
                            children: <Widget>[
                              TagWidget(
                                item,
                                tagNameColor: index == 0 ? Colors.white : Color(0xFF9EAFBF),
                                bgColor: index == 0 ? C.app_main : Color(0xFFECEFF2),
                              ),
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
      onTap: () => Navigator.push(context, RouteBuilders.slideFromRight(OldHousePage(title.substring(0, title.indexOf(' '))))),
      onLongPress: () => Utils.wait('长按-' + title),
    );
  }
}
