import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainButton extends StatelessWidget {
  const MainButton({Key? key, required this.tapEvent}) : super(key: key);

  final GestureTapCallback tapEvent;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: tapEvent,
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
      child: Container(
        width: (150 / 414) * size.width,
        height: 50,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
            color: kPrimaryColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Next',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            const SizedBox(width: kDefaultPadding),
            SvgPicture.asset('assets/icons/next.svg')
          ],
        ),
      ),
    );
  }
}
