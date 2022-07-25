import 'package:dynamic_bottom_sheet/controller.dart';
import 'package:dynamic_bottom_sheet/recover_account.dart';
import 'package:dynamic_bottom_sheet/sign_up.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 234, 178, 174),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Sign In Page',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () async {
              slidePanelOn(const SignUp());
            },
            child: const Text(
              'Open Sign Up',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () async {
              slidePanelOn(const RecoverAccount());
            },
            child: const Text(
              'Open Recover Account',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
