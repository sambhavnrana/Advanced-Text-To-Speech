import 'package:flutter/material.dart';
import 'package:tts/GlobalState/colorscheme.dart';
import 'package:tts/GlobalState/responsiveUtils.dart';

class TextToSpeech extends StatelessWidget {
  const TextToSpeech({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorSchemes.orangeC,
          title: const Text("Text To Speech"),
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
                child: Center(
                  child: Column(
                    children: [
                      Image(
                        width: Responsiveness.screenWidth(context) * 0.3,
                        fit: BoxFit.cover,
                        image: const NetworkImage(
                            'https://cdn-icons-png.flaticon.com/128/10294/10294291.png'),
                      ),
                      SizedBox(
                        height: Responsiveness.screenHeight(context) * 0.05,
                      ),
                      const Text(
                        'Text to Speech',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            color: ColorSchemes.blackC),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                          'Add placeholder to hold spoken text and mic on option '),
                    ],
                  ),
                ))));
  }
}
