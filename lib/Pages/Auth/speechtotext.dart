import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:tts/GlobalState/colorscheme.dart';
import 'package:tts/GlobalState/responsiveUtils.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechToText extends StatelessWidget {
  SpeechToText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AvatarGlow(
          endRadius: 350.0,
          //animate: isListening,
          duration: Duration(milliseconds: 1800),
          glowColor: ColorSchemes.orangeC,
          repeatPauseDuration: Duration(milliseconds: 100),
          showTwoGlows: true,
          child: GestureDetector(
            onTapDown: (details) {},
            child: CircleAvatar(
              backgroundColor: ColorSchemes.orangeC,
              radius: 35,
              child: IconButton(
                icon: const Icon(Icons.mic),
                onPressed: () {},
              ),
            ),
          ),
        ),
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
                        image: const AssetImage('assets/images/stt.png'),
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
                      const Text('Hold Button and Start Speaking'),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ))));
  }
}
