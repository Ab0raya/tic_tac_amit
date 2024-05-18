import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../../constants/media_query.dart';


class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key, required this.image, required this.child});
  final String image;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      width: screenWidth(context),
      height: screenHeight(context),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    ).animate().fadeIn(duration: 600.ms);
  }
}
