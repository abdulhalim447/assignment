import 'package:assignment/Screens/Widgets/appbar_back_icon.dart';
import 'package:assignment/Screens/Widgets/appbar_title.dart';
import 'package:assignment/Screens/Widgets/bottom_container.dart';
import 'package:assignment/Screens/Widgets/image_container.dart';
import 'package:assignment/Screens/Widgets/pop_menu.dart';
import 'package:assignment/Theme/text_theme.dart';
import 'package:assignment/data/card_data.dart';
import 'package:flutter/material.dart';

class SelectedAlbum extends StatelessWidget {
  final int index;
  final List<Map<String, String>> cards;

  SelectedAlbum({Key? key, required this.index}) : cards = CardData.cards;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              Navigator.pop(context);
            },
            child: backIcon(),
          ),
        ),
        title: appbarTitle(cards[index]["AlbumName"]!),
        centerTitle: true,
        actions: [
          popMenu(),
        ],
        backgroundColor: const Color(0xFF2CAB00),
      ),
      body: SafeArea(
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            return _buildBody(context, orientation);
          },
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      return _buildPortraitBody(context);
    } else {
      return _buildLandscapeBody(context);
    }
  }

  Widget _buildPortraitBody(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImageContainer(context),
          _buildText(cards[index]["AlbumHeader"]!),
          _buildText(cards[index]["AlbumDescription"]!),
          _buildSeeMoreButton(context),
          _buildSuggestionsTitle(),
          _buildBottomContainers(context),
        ],
      ),
    );
  }

  Widget _buildLandscapeBody(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImageContainer(context),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildText(cards[index]["AlbumHeader"]!),
                _buildText(cards[index]["AlbumDescription"]!),
                _buildSeeMoreButton(context),
                _buildSuggestionsTitle(),
                _buildBottomContainers(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageContainer(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        imageContainer(
          cards,
          index,
          fromHome: false,
          width: MediaQuery.of(context).size.width * 0.9,
          height: 325,
          margin: const EdgeInsets.all(10.00),
          boxShadow: BoxShadow(
            color: Colors.black.withOpacity(0.50),
            spreadRadius: 0,
            blurRadius: 35,
            offset: const Offset(5, 12),
            blurStyle: BlurStyle.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: Text(
        text,
        style: TextThemes.getTextStyle(
          fontSize: 24,
          fontFamily: 'Poppins',
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildSeeMoreButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 51,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2CAB00),
            foregroundColor: Colors.white,
            textStyle: TextThemes.getTextStyle(
              fontSize: 20,
              fontFamily: "Poppins",
              letterSpacing: 0.5,
            ),
            elevation: 15,
          ),
          child: const Text("See More"),
        ),
      ),
    );
  }

  Widget _buildSuggestionsTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Text(
        "Suggestions",
        style: TextThemes.getTextStyle(
          color: const Color(0xFF2CAB00),
          fontSize: 20,
          fontFamily: 'Poppins',
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildBottomContainers(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        bottomContainer(
          orientation: Orientation.portrait,
          context: context,
          containerLabel: "Dawn",
          containerImage:
          "https://images.pexels.com/photos/1008737/pexels-photo-1008737.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        ),
        bottomContainer(
          orientation: Orientation.portrait,
          context: context,
          containerLabel: "Leaves",
          containerImage:
          "https://images.pexels.com/photos/1687341/pexels-photo-1687341.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        ),
      ],
    );
  }
}
