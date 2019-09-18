import 'package:flutter/material.dart';

/// function: TagWidget
/// <p>Created by Leo on 2019/9/18.</p>
class TagWidget extends StatelessWidget {
  final String tagName;
  final double tagNameFontSize;
  final Color tagNameColor;
  final Color bgColor;
  final double cornerRadius;

  TagWidget(
    this.tagName, {
    double tagNameFontSize,
    Color tagNameColor,
    Color bgColor,
    double cornerRadius,
  })  : assert(tagName != null),
        this.tagNameFontSize = tagNameFontSize ?? 10.0,
        this.tagNameColor = tagNameColor ?? Colors.white,
        this.bgColor = bgColor ?? Colors.blueAccent,
        this.cornerRadius = cornerRadius ?? 3.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: this.bgColor,
        borderRadius: BorderRadius.circular(cornerRadius),
      ),
      padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
      child: Text(
        tagName,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: tagNameFontSize, color: tagNameColor),
      ),
    );
  }
}
