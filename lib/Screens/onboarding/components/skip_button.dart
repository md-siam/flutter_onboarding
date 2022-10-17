import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    Key? key,
    required this.tapEvent
  }) : super(key: key);

  final GestureTapCallback tapEvent;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: tapEvent,
      child: Container(
        width: (150 / 414) * size.width,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Skip',
              style: TextStyle(
                color: kTextLightColor,
                fontSize: 16
              ),
            ),
          ],
        ),
      ),
    );
  }
}