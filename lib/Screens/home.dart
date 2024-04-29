import 'package:assignment/Screens/Widgets/appbar_back_icon.dart';
import 'package:assignment/Screens/Widgets/appbar_title.dart';
import 'package:assignment/Screens/Widgets/image_container.dart';
import 'package:assignment/Screens/Widgets/pop_menu.dart';
import 'package:assignment/Screens/selected_album.dart';
import 'package:assignment/data/card_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color appBarColor = const Color(0xFF2CAB00);
const double appBarPadding = 10.0;
const double gridViewPadding = 15.0;
const double mainAxisSpacing = 20.0;
const double crossAxisSpacing = 25.0;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int itemCount;
  late List<Map<String, String>> cards;

  @override
  void initState() {
    super.initState();
    cards = CardData.cards;
    itemCount = cards.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(appBarPadding),
          child: InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              SystemNavigator.pop();
            },
            child: backIcon(),
          ),
        ),
        title: appbarTitle("হিট এলার্ট"),
        centerTitle: true,
        actions: [
          popMenu(),
        ],
        backgroundColor: appBarColor,
      ),
      body: SafeArea(
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            return gridViewBuilder(orientation);
          },
        ),
      ),
    );
  }

  Widget gridViewBuilder(Orientation orientation) {
    return GridView.builder(
      padding: const EdgeInsets.all(gridViewPadding),
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: (orientation == Orientation.portrait ? 2 : 4),
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            _navigateToSelectedAlbum(context, index);
          },
          child: imageContainer(cards, index),
        );
      },
    );
  }

  void _navigateToSelectedAlbum(BuildContext context, int index) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            SelectedAlbum(index: index),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }
}
