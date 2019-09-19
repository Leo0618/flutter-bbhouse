import 'package:flutter/material.dart';

import '../../r.dart';

/// function: NewsPage
/// <p>Created by Leo on 2019/9/16.</p>
class NewsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewsPageState();
  }
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('消息', style: TextStyle(color: Colors.black)),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 100, right: 100),
          child: Image.asset(R.assetsImgNewsEmpty),
        ),
      ),
    );
  }
}
