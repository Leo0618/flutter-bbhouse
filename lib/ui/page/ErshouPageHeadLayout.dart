import 'package:bbhouse/ui/widget/page_route_builders.dart';
import 'package:bbhouse/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../r.dart';
import 'WebViewPage.dart';

/// function: ErshouPageHeadLayout
/// <p>Created by Leo on 2019/9/20.</p>
class ErshouPageHeadLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ErshouPageHeadLayoutState();
  }
}

class _ErshouPageHeadLayoutState extends State<ErshouPageHeadLayout> {
  List<String> _bannerList;
  List<String> _subjectList;

  @override
  void initState() {
    super.initState();
    _bannerList = [R.assetsImgBanner1, R.assetsImgBanner2, R.assetsImgBanner3, R.assetsImgBanner4, R.assetsImgBanner5];
    _subjectList = [R.assetsImgErshouList1, R.assetsImgErshouList2, R.assetsImgErshouList3, R.assetsImgErshouList4];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 120,
          child: new Swiper(
            itemCount: _bannerList.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                child: Container(
                  margin: EdgeInsets.only(left: 7, right: 7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular((10.0)),
                    image: DecorationImage(image: AssetImage(_bannerList[index]), fit: BoxFit.cover),
                  ),
                ),
                onTap: () => Utils.wait('banner'),
              );
            },
            autoplay: true,
            autoplayDelay: 4000,
            duration: 1000,
            viewportFraction: 0.8,
            pagination: SwiperPagination(builder: DotSwiperPaginationBuilder(activeColor: Color(0xFFFEFEFE), color: Color(0xAAEEEEEE))),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Row(
            children: <Widget>[
              Expanded(child: InkWell(child: Image.asset(R.assetsImgErshouHot1, width: 60, height: 60), onTap: () => Utils.wait('地图找房'))),
              Expanded(child: InkWell(child: Image.asset(R.assetsImgErshouHot2, width: 60, height: 60), onTap: () => Utils.wait('找小区'))),
              Expanded(child: InkWell(child: Image.asset(R.assetsImgErshouHot3, width: 60, height: 60), onTap: () => Utils.wait('查成交'))),
              Expanded(child: InkWell(child: Image.asset(R.assetsImgErshouHot4, width: 60, height: 60), onTap: () => Utils.wait('房贷计算'))),
              Expanded(child: InkWell(child: Image.asset(R.assetsImgErshouHot5, width: 60, height: 60), onTap: () => Utils.wait('全部房源'))),
            ],
          ),
        ),
        InkWell(
          child: Image.asset(R.assetsImgErshouTabA, width: double.infinity),
          onTap: () => Navigator.of(context).push(RouteBuilders.slideFromRight(WebViewPage('https://m.ke.com/sz/fangjia'))),
        ),
        InkWell(
          child: Image.asset(R.assetsImgErshouTabB, width: double.infinity),
          onTap: () => Navigator.of(context).push(RouteBuilders.slideFromRight(WebViewPage('https://m.ke.com/sz/fangjia'))),
        ),
        Container(
          padding: EdgeInsets.only(left: 20),
          height: 90,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: _subjectList.map((item) {
              return InkWell(
                child: Image.asset(item),
                onTap: () => Navigator.of(context).push(RouteBuilders.slideFromRight(WebViewPage('https://m.ke.com/sz/fangjia'))),
              );
            }).toList(),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text('全部房源', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black)),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
