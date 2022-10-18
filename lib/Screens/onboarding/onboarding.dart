import 'package:flutter/material.dart';
import 'components/next_button.dart';
import 'components/skip_button.dart';
import 'components/slider_content.dart';
import '../../constants.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int selectedSlider = 0;
  // Slider Data
  List<Map<String, String>> sliders = [
    {
      "title": "Meeting Online",
      "text":
          "Stay home and complete all of your importance work and meeting for keeping safe you and your family member",
      "image": "assets/images/slider1.svg"
    },
    {
      "title": "Wear a Mask",
      "text":
          "When you go outside of your home then obviously you have to wear a mask for keeping safe from covid-19",
      "image": "assets/images/slider2.svg"
    },
    {
      "title": "Social Distance",
      "text":
          "By maintaining social distance you can kep safe from other covid virus affected people and keep safe from covid-19",
      "image": "assets/images/slider3.svg"
    },
  ];

  PageController sliderController =
      PageController(initialPage: 0, keepPage: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      selectedSlider = index;
                    });
                  },
                  controller: sliderController,
                  itemCount: sliders.length,
                  itemBuilder: (context, index) => SliderContent(
                    image: sliders[index]['image'],
                    title: sliders[index]['title'],
                    text: sliders[index]['text'],
                  ),
                ),
              ),
              const SizedBox(height: kDefaultPadding),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        sliders.length,
                        (index) => buildSliderNav(index: index),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      child: Row(
                        children: [
                          SkipButton(tapEvent: () {}),
                          const Spacer(),
                          NextButton(
                            tapEvent: () {
                              if (selectedSlider != (sliders.length - 1)) {
                                sliderController.animateToPage(
                                  selectedSlider + 1,
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.linear,
                                );
                              }
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildSliderNav({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
          color:
              selectedSlider == index ? kPrimaryColor : const Color(0xFFD7D7D7),
          borderRadius: BorderRadius.circular(5)),
    );
  }
}
