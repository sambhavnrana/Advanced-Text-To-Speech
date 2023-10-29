import 'package:flutter/material.dart';
import 'package:tts/GlobalState/colorscheme.dart';
import 'package:tts/GlobalState/responsiveUtils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorSchemes.orangeC,
          title: const Text(
            "        Welcome to ATTS App",
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w900,
                color: ColorSchemes.whiteC,
                textBaseline: TextBaseline.alphabetic),
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Image(
                    width: Responsiveness.screenWidth(context) * 0.5,
                    fit: BoxFit.cover,
                    image: const AssetImage('assets/images/welcome.png')),
                SizedBox(
                  height: Responsiveness.screenHeight(context) * 0.05,
                ),
                Column(
                  children: [
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text("Welcome to the App ",
                            style: TextStyle(
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold,
                                color: ColorSchemes.blackC)),
                      ),
                    ),
                    SizedBox(
                      height: Responsiveness.screenHeight(context) * 0.03,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  ColorSchemes.orangeC),
                              fixedSize: MaterialStateProperty.all<Size>(Size(
                                  Responsiveness.screenWidth(context) * 0.85,
                                  Responsiveness.screenHeight(context) *
                                      0.06))),
                          onPressed: () {
                            Navigator.pushNamed(context, '/textsummarizer');
                          },
                          child: const Text("Text Summarizer"),
                        ),
                        SizedBox(
                          height: Responsiveness.screenHeight(context) * 0.03,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  ColorSchemes.orangeC),
                              fixedSize: MaterialStateProperty.all<Size>(Size(
                                  Responsiveness.screenWidth(context) * 0.85,
                                  Responsiveness.screenHeight(context) *
                                      0.06))),
                          onPressed: () {
                            Navigator.pushNamed(context, '/texttospeech');
                          },
                          child: const Text("Text to Speech"),
                        ),
                        SizedBox(
                          height: Responsiveness.screenHeight(context) * 0.03,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  ColorSchemes.orangeC),
                              fixedSize: MaterialStateProperty.all<Size>(Size(
                                  Responsiveness.screenWidth(context) * 0.85,
                                  Responsiveness.screenHeight(context) *
                                      0.06))),
                          onPressed: () {
                            Navigator.pushNamed(context, '/speechtotext');
                          },
                          child: const Text("Speech to Text"),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
