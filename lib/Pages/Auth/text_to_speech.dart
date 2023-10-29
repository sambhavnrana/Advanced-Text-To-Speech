import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:tts/GlobalState/colorscheme.dart';
import 'package:tts/GlobalState/responsiveUtils.dart';

class TextToSpeech extends StatelessWidget {
  TextToSpeech({super.key});

  final FlutterTts flutterTts = FlutterTts();
  final TextEditingController textEditingController = TextEditingController();

  speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.5);
    await flutterTts.speak(text);
  }

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
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(100, 80, 100, 50),
                  child: Center(
                    child: Column(
                      children: [
                        Image(
                          width: Responsiveness.screenWidth(context) * 0.3,
                          fit: BoxFit.cover,
                          image: const AssetImage('assets/images/tts.png'),
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
                        TextFormField(
                          minLines: 1,
                          maxLines: 5,
                          controller: textEditingController,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  ColorSchemes.orangeC),
                              fixedSize: MaterialStateProperty.all<Size>(Size(
                                  Responsiveness.screenWidth(context) * 0.30,
                                  Responsiveness.screenHeight(context) *
                                      0.06))),
                          onPressed: () => speak(textEditingController.text),
                          child: const Icon(Icons.mic, color: Colors.white),
                        ),
                      ],
                    ),
                  ))),
        ));
  }
}
