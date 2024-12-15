import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/widgets/button/basic_button.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/presentation/choose_mode/pages/choose_mode.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.introBG),
                    fit: BoxFit.fitHeight)),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.7)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Column(
              children: [
                Transform.translate(
                  offset: const Offset(0, 75),
                  child: Align(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        AppVectors.longLogo,
                        width: 200,
                      )),
                ),
                const Spacer(),
                const Text('Enjoy listening to music',
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Satoshi',
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                const SizedBox(height: 10),
                const Text(
                    'Dive into a world of sound where every beat resonates with your soul, transporting you to new realms of emotion and inspiration.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Satoshi',
                        fontWeight: FontWeight.w400,
                        color: Colors.white)),
                const SizedBox(height: 20),
                BasicButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChooseModePage())),
                  text: 'Get Started',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
