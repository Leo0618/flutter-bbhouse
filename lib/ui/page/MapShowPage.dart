import 'package:bbhouse/util/utils.dart';
import 'package:flutter/material.dart';

/// function: MapShowPage
/// <p>Created by Leo on 2019/9/24.</p>
class MapShowPage extends StatefulWidget {
  final double _lon;
  final double _lat;

  //113.953705 , 22.535783
  MapShowPage(this._lon, this._lat);

  @override
  State<StatefulWidget> createState() {
    return _MapShowPageState();
  }
}

class _MapShowPageState extends State<MapShowPage> {
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
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: Text('位置及周边', style: TextStyle(color: Colors.black)),
        actions: <Widget>[
          InkWell(
            child: Align(child: Text('导航', style: TextStyle(color: Colors.black)), alignment: Alignment.center),
            onTap: () => Utils.wait('导航'),
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
