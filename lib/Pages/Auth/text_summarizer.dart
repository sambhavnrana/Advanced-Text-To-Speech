import 'package:flutter/material.dart';
import 'package:tts/GlobalState/colorscheme.dart';
import 'package:tts/GlobalState/responsiveUtils.dart';

class TextSummarizer extends StatelessWidget {
  const TextSummarizer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorSchemes.orangeC,
          title: const Text("Text Summarizer"),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: ColorSchemes.orangeC,
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      color: ColorSchemes.whiteC),
                ),
              ),
              ListTile(
                title: const Text('Text To Speech'),
                onTap: () {
                  Navigator.pushNamed(context, '/texttospeech');
                },
              ),
              ListTile(
                title: const Text('Speech To Text'),
                onTap: () {
                  Navigator.pushNamed(context, '/speechtotext');
                },
              ),
              ListTile(
                title: const Text('HOME'),
                onTap: () {
                  Navigator.pushNamed(context, '/home');
                },
              ),
            ],
          ),
        ),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(100, 80, 100, 50),
                child: Column(
                  children: [
                    Image(
                      width: Responsiveness.screenWidth(context) * 0.5,
                      fit: BoxFit.cover,
                      image:
                          const AssetImage('assets/images/text-summarizer.png'),
                    ),
                    SizedBox(
                      height: Responsiveness.screenHeight(context) * 0.05,
                    ),
                    const Text('Text Summarizer',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            color: ColorSchemes.blackC)),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('add 2 text-fields')
                  ],
                ))));
  }
}
