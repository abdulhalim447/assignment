import 'package:flutter/material.dart';
import 'package:assignment/Theme/container_theme.dart';
import 'package:assignment/Theme/text_theme.dart';

Widget bottomContainer({
  required Orientation orientation,
  required BuildContext context,
  required String containerLabel,
  required String containerImage,
}) {
  final double screenWidth = MediaQuery.of(context).size.width;
  final double containerWidth =
  (orientation == Orientation.portrait) ? screenWidth * 0.45 : screenWidth * 0.22;
  final EdgeInsets margin = (orientation == Orientation.portrait)
      ? const EdgeInsets.only(top: 20.0, bottom: 10.0)
      : const EdgeInsets.only(bottom: 10.0);

  return Container(
    width: containerWidth,
    height: 180,
    margin: margin,
    decoration: _buildContainerDecoration(containerImage),
    alignment: Alignment.bottomLeft,
    child: _buildTextWidget(containerLabel),
  );
}

BoxDecoration _buildContainerDecoration(String containerImage) {
  return ContainerTheme.getBottomContainerBoxDecoration(
    containerImage: containerImage,
    boxShadow: BoxShadow(
      color: Colors.black.withOpacity(0.50),
      spreadRadius: 0,
      blurRadius: 30,
      offset: const Offset(0, 15),
      blurStyle: BlurStyle.normal,
    ),
  );
}

Widget _buildTextWidget(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
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
