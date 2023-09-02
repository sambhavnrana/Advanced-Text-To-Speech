import 'package:flutter/material.dart';
import 'package:tts/GlobalState/colorscheme.dart';

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
                title: const Text('HOME'),
                onTap: () {
                  Navigator.pushNamed(context, '/home');
                },
              ),
            ],
          ),
        ),
        body: const SafeArea(
            child: Padding(
                padding: EdgeInsets.fromLTRB(100, 80, 100, 50),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'Text to Speech',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            color: ColorSchemes.blackC),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                          'Add placeholder to hold spoken text and mic on option ')
                    ],
                  ),
                ))));
  }
}
