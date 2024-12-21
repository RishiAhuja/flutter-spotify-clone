import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/common/widgets/button/basic_button.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/data/models/auth/create_user_request.dart';
import 'package:spotify/domain/usecases/auth/signup.dart';
import 'package:spotify/presentation/root/pages/root.dart';
import 'package:spotify/service_locator.dart';

class Signup extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Signup({super.key});

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
              onPressed: () async {
                var result = await sl<SignUpUsecase>().call(
                  params: CreateUserRequest(
                    name: _nameController.text.toString(),
                    email: _nameController.text.toString(),
                    password: _passwordController.text.toString(),
                  ),
                );

                //result is dynamic Either (left or right)
                result.fold((l) {
                  print(l.toString());
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(l.toString()),
                    ),
                  );
                }, (r) {
                  print(r.toString());
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => RootPage()));
                });
              },
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
      controller: _nameController,
      decoration: const InputDecoration(
        hintText: 'Full name',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextFormField(
      controller: _emailController,
      decoration: const InputDecoration(
        hintText: 'Email',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextFormField(
      controller: _passwordController,
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
