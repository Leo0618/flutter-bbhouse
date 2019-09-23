import 'package:bbhouse/r.dart';
import 'package:bbhouse/util/util_screen.dart';
import 'package:bbhouse/util/utils.dart';
import 'package:flutter/material.dart';

/// function: OldHousePageTitlebar
/// <p>Created by Leo on 2019/9/23.</p>
class OldHousePageTitlebar extends PreferredSize {
  final ScrollController _scrollController;

  OldHousePageTitlebar(
    this._scrollController,
    double _headerContentHeight,
    ValueChanged changed,
  )   : assert(_scrollController != null),
        super(
          child: _OldHousePageTitlebarImpl(_scrollController, _headerContentHeight, changed),
          preferredSize: Size.fromHeight(UtilScreen.getInstance().appBarHeight),
        );
}

class _OldHousePageTitlebarImpl extends StatefulWidget {
  final ScrollController _scrollController;
  final double _headerContentHeight;
  final ValueChanged _changed;

  _OldHousePageTitlebarImpl(this._scrollController, this._headerContentHeight, this._changed);

  @override
  State<StatefulWidget> createState() {
    return _OldHousePageTitlebarImplState();
  }
}

class _OldHousePageTitlebarImplState extends State<_OldHousePageTitlebarImpl> {
  double _barHeight;

  @override
  void initState() {
    super.initState();
    _barHeight = UtilScreen.getInstance().topBarHeight;
    widget._scrollController.addListener(_onScrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    if (widget._scrollController != null) {
      widget._scrollController.dispose();
      widget._scrollController.removeListener(_onScrollListener);
    }
  }

  void _onScrollListener() {
    if (widget._headerContentHeight <= _barHeight) return;
    var offset = widget._scrollController.offset;
    double usefulHeight = widget._headerContentHeight - _barHeight;
    setState(() {
      _isAlphaBackground = offset < widget._headerContentHeight / 2;
      if (offset > usefulHeight) offset = usefulHeight;
      int alpha = offset * 255 ~/ (widget._headerContentHeight - _barHeight);
      _appbarBackgroundColor = Color.fromARGB(alpha, 255, 255, 255);
      if (widget._changed != null) widget._changed(usefulHeight - offset);
    });
  }

  bool _isAlphaBackground = true;
  Color _appbarBackgroundColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _barHeight,
      child: AppBar(
        elevation: 0,
        backgroundColor: _appbarBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: (_isAlphaBackground ? Colors.white : Colors.black)),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        actions: <Widget>[
          InkWell(
            child: Image.asset(_isAlphaBackground ? R.assetsImgIcCompareWhite : R.assetsImgIcCompareDark, width: 25, height: 25),
            onTap: () => Utils.wait('对比'),
          ),
          SizedBox(width: 30),
          InkWell(
            child: Image.asset(_isAlphaBackground ? R.assetsImgIcHeartWhite : R.assetsImgIcHeartDark, width: 25, height: 25),
            onTap: () => Utils.wait('关注'),
          ),
          SizedBox(width: 30),
          InkWell(
            child: Image.asset(_isAlphaBackground ? R.assetsImgIcChatWhite : R.assetsImgIcChatDark, width: 25, height: 25),
            onTap: () => Utils.wait('聊天'),
          ),
          SizedBox(width: 30),
          InkWell(
            child: Image.asset(_isAlphaBackground ? R.assetsImgIcShareWhite : R.assetsImgIcShareDark, width: 25, height: 25),
            onTap: () => Utils.wait('分享'),
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
