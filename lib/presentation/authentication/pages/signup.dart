import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/common/widgets/button/basic_button.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signInText(),
      appBar: BasicAppBar(
        title: SvgPicture.asset(AppVectors.longLogo),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            const SizedBox(
              height: 35,
            ),
            _registerText(),
            const SizedBox(
              height: 30,
            ),
            _fullNameField(context),
            const SizedBox(
              height: 15,
            ),
            _emailField(context),
            const SizedBox(
              height: 15,
            ),
            _passwordField(context),
            const SizedBox(
              height: 30,
            ),
            BasicButton(
              text: 'Register',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Align(
      alignment: Alignment.center,
      child: Text(
        'Register',
        style: TextStyle(
          fontSize: 30,
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _fullNameField(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Full name',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Email',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        hintText: 'Password',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _signInText() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Already have an account?',
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'Satoshi',
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(width: 10),
          Text(
            'Sign in',
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'Satoshi',
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
