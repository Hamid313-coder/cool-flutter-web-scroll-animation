import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

part 'home_view.widgets.dart';

const overlayDescriptionText =
    'I have to write some stuff to put in here so that it looks like there\'s something real written here. So lets write some real stuff here. A few weeks ago I concluded the biggest failure of my career. I founded a new startup and poured all my money and energy into it and it failed. The reasons for failure are clear and if you\'d like to hear I can make a video about that. For now that\'s all that I\'ll say.';
const backgroundImageUrl = 'https://source.unsplash.com/XO5qTnr0a50';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffFEE5CA),
      body: ScrollTransformView(
        children: [
          ScrollTransformItem(
            builder: (scrollOffset) {
              final screenOffsetPercent =
                  min(scrollOffset / screenSize.height, 1);

              return Image.network(
                height: screenSize.height -
                    (screenSize.height * 0.2 * screenOffsetPercent),
                width: screenSize.width -
                    (screenSize.width * 0.5 * screenOffsetPercent),
                backgroundImageUrl,
                fit: BoxFit.cover,
              );
            },
            offsetBuilder: (scrollOffset) {
              final screenOffsetPercent =
                  min(scrollOffset / screenSize.height, 1);
              final shrinkageAmount =
                  screenSize.height * 0.2 * screenOffsetPercent;

              final onScreenOffset = scrollOffset + shrinkageAmount / 2;

              final isStartMoving = scrollOffset >= screenSize.height * 0.85;

              return Offset(
                  0,
                  isStartMoving
                      ? onScreenOffset -
                          (scrollOffset - screenSize.height * 0.85)
                      : onScreenOffset);
            },
          ),
          ScrollTransformItem(
            builder: (scrollOffset) => const OverlayTextSection(),
            offsetBuilder: (scrollOffset) => Offset(0, -screenSize.height),
          ),
          ScrollTransformItem(builder: (scrollOffset) => const BottomSection()),
        ],
      ),
    );
  }
}
