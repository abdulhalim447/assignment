import 'package:flutter/material.dart';
import '../../Theme/container_theme.dart';
import '../../Theme/text_theme.dart';

Widget imageContainer(List<Map<String, String>> cards, int index,
    {bool fromHome = true,
      double height = 180,
      double width = 180,
      EdgeInsets margin = const EdgeInsets.all(0),
      BoxShadow? boxShadow}) {
  return Container(
    width: width,
    height: height,
    margin: margin,
    decoration: ContainerTheme.getContainerBoxDecoration(
      cards: cards,
      index: index,
      boxShadow: boxShadow,
    ),
    alignment: Alignment.bottomLeft,
    child: (fromHome)
        ? _buildTextWidget(cards[index]["AlbumName"]!)
        : null,
  );
}

Widget _buildTextWidget(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
    child: Text(
      text,
      style: TextThemes.getTextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
