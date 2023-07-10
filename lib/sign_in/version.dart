import 'package:flutter/material.dart';

class VersionWidget extends StatelessWidget {
  const VersionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/A2U_logo_02.png",
            width: MediaQuery.of(context).size.width * 1 / 15,
            // height: 100,
            // fit: BoxFit.fitHeight,
          ),
          Text.rich(
            TextSpan(
              text: 'Version ', // default text style
              children: <TextSpan>[
                TextSpan(text: "1.1.0"),
              ],
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 1 / 15),
          // Spacer(),
        ],
      ),
    );
  }
}
