import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/button/basic_button.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/presentation/authentication/pages/signup_in.dart';
import 'package:spotify/presentation/choose_mode/bloc/theme_cubit.dart';
import 'package:spotify/presentation/choose_mode/widgets/blurred_button.dart';

class ChooseModePage extends StatefulWidget {
  const ChooseModePage({super.key});

  @override
  State<ChooseModePage> createState() => _ChooseModePageState();
}

class _ChooseModePageState extends State<ChooseModePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppImages.choseModeBG),
                      fit: BoxFit.fitHeight)),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.7)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        AppVectors.longLogo,
                        width: 160,
                      )),
                  const Spacer(),
                  const Text('Choose Mode',
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Satoshi',
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          /*we injected the ThemeCubit into global widget tree, hence we can just perform context.read
                          or we can create a ThemeCubit instance to call the updateMethod */

                          // final ThemeCubit themeCubit = ThemeCubit();
                          // themeCubit.updateTheme(ThemeMode.light);

                          context
                              .read<ThemeCubit>()
                              .updateTheme(ThemeMode.light);

                          /*we are retrieving the context of the ThemeCubit provided by the 
                          global MultiBlocProvider and calling the updateTheme method*/
                        },
                        child: BlurredButton(
                          iconData: Icons.wb_sunny,
                          onPressed: () {},
                          text: 'Light Mode',
                        ),
                      ),
                      const SizedBox(width: 25),
                      GestureDetector(
                        onTap: () {
                          context
                              .read<ThemeCubit>()
                              .updateTheme(ThemeMode.dark);
                        },
                        child: BlurredButton(
                          iconData: Icons.nightlight_rounded,
                          onPressed: () {},
                          text: 'Dark Mode',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  BasicButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpInPage())),
                    text: 'Continue',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
