import 'package:flutter/material.dart';
import 'package:tts/GlobalState/colorscheme.dart';
import 'package:tts/GlobalState/responsiveUtils.dart';

class SpeechToText extends StatelessWidget {
  const SpeechToText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorSchemes.orangeC,
          title: const Text("Speech to Text"),
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
                title: const Text('Text Summarizer'),
                onTap: () {
                  Navigator.pushNamed(context, '/textsummarizer');
                },
              ),
              ListTile(
                title: const Text('Text To Speech'),
                onTap: () {
                  Navigator.pushNamed(context, '/texttospeech');
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
                child: Center(
                  child: Column(
                    children: [
                      Image(
                        width: Responsiveness.screenWidth(context) * 0.3,
                        fit: BoxFit.cover,
                        image: const NetworkImage(
                            'https://cdn-icons-png.flaticon.com/128/5089/5089033.png'),
                      ),
                      SizedBox(
                        height: Responsiveness.screenHeight(context) * 0.05,
                      ),
                      const Text(
                        'Speech to Text',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            color: ColorSchemes.blackC),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                          'Add placeholder to hold spoken text and mic on option ')
                    ],
                  ),
                ))));
  }
}
