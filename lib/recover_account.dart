import 'package:dynamic_bottom_sheet/controller.dart';
import 'package:flutter/material.dart';

class RecoverAccount extends StatelessWidget {
  const RecoverAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 109, 155, 240),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Recover Account Page',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () async {
              await panelController.close();
            },
            child: const Text(
              'Close',
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
