// import 'package:avatar_glow/avatar_glow.dart';
// import 'package:flutter/material.dart';
// import 'package:tts/GlobalState/colorscheme.dart';
// import 'package:tts/GlobalState/responsiveUtils.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;

// class SpeechToText extends StatelessWidget {
//   SpeechToText({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//         floatingActionButton: AvatarGlow(
//           endRadius: 350.0,
//           //animate: isListening,
//           duration: Duration(milliseconds: 1800),
//           glowColor: ColorSchemes.orangeC,
//           repeatPauseDuration: Duration(milliseconds: 100),
//           showTwoGlows: true,
//           child: GestureDetector(
//             onTapDown: (details) {},
//             child: CircleAvatar(
//               backgroundColor: ColorSchemes.orangeC,
//               radius: 35,
//               child: IconButton(
//                 icon: const Icon(Icons.mic),
//                 onPressed: () {},
//               ),
//             ),
//           ),
//         ),
//         appBar: AppBar(
//           backgroundColor: ColorSchemes.orangeC,
//           title: const Text("Speech to Text"),
//         ),
//         drawer: Drawer(
//           child: ListView(
//             children: [
//               const DrawerHeader(
//                 decoration: BoxDecoration(
//                   color: ColorSchemes.orangeC,
//                 ),
//                 child: Text(
//                   'Menu',
//                   style: TextStyle(
//                       fontSize: 20.0,
//                       fontWeight: FontWeight.w600,
//                       color: ColorSchemes.whiteC),
//                 ),
//               ),
//               ListTile(
//                 title: const Text('Text Summarizer'),
//                 onTap: () {
//                   Navigator.pushNamed(context, '/textsummarizer');
//                 },
//               ),
//               ListTile(
//                 title: const Text('Text To Speech'),
//                 onTap: () {
//                   Navigator.pushNamed(context, '/texttospeech');
//                 },
//               ),
//               ListTile(
//                 title: const Text('HOME'),
//                 onTap: () {
//                   Navigator.pushNamed(context, '/home');
//                 },
//               ),
//             ],
//           ),
//         ),
//         body: SafeArea(
//             child: Padding(
//                 padding: const EdgeInsets.fromLTRB(100, 80, 100, 50),
//                 child: Center(
//                   child: Column(
//                     children: [
//                       Image(
//                         width: Responsiveness.screenWidth(context) * 0.3,
//                         fit: BoxFit.cover,
//                         image: const AssetImage('assets/images/stt.png'),
//                       ),
//                       SizedBox(
//                         height: Responsiveness.screenHeight(context) * 0.05,
//                       ),
//                       const Text(
//                         'Speech to Text',
//                         style: TextStyle(
//                             fontSize: 20.0,
//                             fontWeight: FontWeight.w600,
//                             color: ColorSchemes.blackC),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       const Text('Hold Button and Start Speaking'),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                     ],
//                   ),
//                 ))));
//   }
// }

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
                padding: const EdgeInsets.fromLTRB(20, 80, 20, 50),
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
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 10),
                        margin:
                            const EdgeInsets.symmetric(horizontal: 40).copyWith(
                          top: 30,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Pallete.borderColor,
                          ),
                          borderRadius: BorderRadius.circular(20).copyWith(
                            topLeft: Radius.zero,
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Good Morning , what task can I do for you ?',
                            style: TextStyle(
                              fontFamily: 'Cera Pro',
                              color: Pallete.mainFontColor,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 10, left: 22),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Here are a few features',
                            style: TextStyle(
                                fontFamily: 'Cera Pro',
                                color: Pallete.mainFontColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      FloatingActionButton(
                        backgroundColor: Pallete.firstSuggestionBoxColor,
                        onPressed: () {},
                        child: const Icon(Icons.mic),
                      ),
                    ],
                  ),
                ))));
  }
}
