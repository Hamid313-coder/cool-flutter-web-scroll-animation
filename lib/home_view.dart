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
    print("ehlloooo");
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffFEE5CA),
      body: ScrollTransformView(
        children: [
          ScrollTransformItem(
            builder: (offset) {
              final screenOffPercentage = min(offset / screenSize.height, 1);

              return Image.network(
                backgroundImageUrl,
                height: screenSize.height -
                    (screenSize.height * 0.2 * screenOffPercentage),
                width: screenSize.width -
                    (screenSize.width * 0.5 * screenOffPercentage),
                fit: BoxFit.cover,
              );
            },
            offsetBuilder: (offset) {
              final screenOffPercentage = min(offset / screenSize.height, 1);
              final heightShrinkageAmount =
                  screenSize.height * 0.2 * screenOffPercentage;
              final double onScreenOffset = offset + heightShrinkageAmount / 2;
              return Offset(0, onScreenOffset);
            },
          ),
          ScrollTransformItem(
            builder: (offSet) {
              return const OverlayTextSection();
            },
            offsetBuilder: (offset) => Offset(0, -screenSize.height),
          ),
          ScrollTransformItem(builder: (offSet) => const BottomSection()),
        ],
      ),
    );
  }
}
