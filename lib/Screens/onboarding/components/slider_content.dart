import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class SliderContent extends StatelessWidget {
  const SliderContent({
    Key? key,
    required this.image,
    required this.title,
    required this.text,
  }) : super(key: key);

  final String? image, title, text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Spacer(),
        // 896 is width that designer used, 270 is height of the image that designer used
        SvgPicture.asset(
          image!,
          height: (270 / 896) * size.height,
        ),
        const Spacer(),
        Text(
          title!,
          style: const TextStyle(
            fontSize: 24,
            color: kTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: kDefaultPadding / 2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
          child: Text(
            text!,
            textAlign: TextAlign.center,
            style: const TextStyle(color: kTextLightColor, fontSize: 18),
          ),
        )
      ],
    );
  }
}
