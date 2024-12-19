import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/helper/is_dark_mode.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/common/widgets/button/basic_button.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/presentation/authentication/pages/signin.dart';
import 'package:spotify/presentation/authentication/pages/signup.dart';

class SignUpInPage extends StatelessWidget {
  const SignUpInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppBar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.topRightUnion),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVectors.bottomRightUnion),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Transform.translate(
                offset: const Offset(-150, 80),
                child: Stack(
                  children: [
                    Image.asset(AppImages.signUpInBG),
                    if (context.isDarkMode)
                      Positioned.fill(
                        child: Container(
                          color: Colors.black
                              .withOpacity(0.5), // Adjust the opacity as needed
                        ),
                      ),
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Transform.translate(
              offset: const Offset(0, -50),
              child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppVectors.longLogo,
                        width: 200,
                      ),
                      const SizedBox(height: 18),
                      const Text(
                        'Enjoy Listening to Music',
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Satoshi',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 8.0),
                        child: Text(
                          'Spotify is premium music streaming service that gives you access to millions of songs.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey,
                            fontFamily: 'Satoshi',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: BasicButton(
                                  onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Signup())),
                                  text: 'Register'),
                              //doesn't have a defined width, hence wrapped with expanded
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                                flex: 1,
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                      minimumSize: const Size.fromHeight(70),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                    ),
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Signin())),
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                          color: context.isDarkMode
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )))
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
