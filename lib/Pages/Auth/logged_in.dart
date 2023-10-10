import 'package:flutter/material.dart';
import 'package:tts/GlobalState/colorscheme.dart';
import 'package:tts/GlobalState/responsiveUtils.dart';

class LoggedIn extends StatelessWidget {
  const LoggedIn({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 40, 15, 25),
                    width: Responsiveness.screenWidth(context) * 0.5,
                    child: const Image(
                        image: AssetImage('assets/images/logged-in.webp')),
                  ),
                  Container(
                    child: const Column(
                      children: [
                        Text(
                          " Logged In Successfully ",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: ColorSchemes.orangeC),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            ColorSchemes.orangeC),
                        fixedSize: MaterialStateProperty.all<Size>(Size(
                            Responsiveness.screenWidth(context) * 0.85,
                            Responsiveness.screenHeight(context) * 0.05))),
                    child: const Text("Continue"),
                  ),
                ],
              ),

              // Add more widgets here under the ListView if needed.
            ],
          ),
        ),
      ),
    );
  }
}
