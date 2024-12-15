import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(AppVectors.longLogo),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [_registerText(), _fullNameField()],
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
          fontSize: 24,
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _fullNameField() {
    return TextFormField(
      decoration: const InputDecoration(
          hintText: 'Full Name', filled: true, fillColor: Colors.transparent),
    );
  }
}
