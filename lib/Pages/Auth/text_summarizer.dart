// import 'package:flutter/material.dart';
// import 'package:tts/GlobalState/colorscheme.dart';
// import 'package:tts/GlobalState/responsiveUtils.dart';

// class TextSummarizer extends StatelessWidget {
//   const TextSummarizer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: ColorSchemes.orangeC,
//           title: const Text("Text Summarizer"),
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
//                 title: const Text('Text To Speech'),
//                 onTap: () {
//                   Navigator.pushNamed(context, '/texttospeech');
//                 },
//               ),
//               ListTile(
//                 title: const Text('Speech To Text'),
//                 onTap: () {
//                   Navigator.pushNamed(context, '/speechtotext');
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
//                 child: Column(
//                   children: [
//                     Image(
//                       width: Responsiveness.screenWidth(context) * 0.5,
//                       fit: BoxFit.cover,
//                       image:
//                           const AssetImage('assets/images/text-summarizer.png'),
//                     ),
//                     SizedBox(
//                       height: Responsiveness.screenHeight(context) * 0.05,
//                     ),
//                     const Text('Text Summarizer',
//                         style: TextStyle(
//                             fontSize: 20.0,
//                             fontWeight: FontWeight.w600,
//                             color: ColorSchemes.blackC)),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     const Text('add 2 text-fields'),

//                     const TextField(
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'Enter What u want to get summarized',
//                       ),
//                     ),
//                     const TextField(
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'Summarized Text',
//                       ),
//                     ),
//                   ],
//                 ))));
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// // ...

// class TextSummarizer extends StatefulWidget {
//   const TextSummarizer({Key? key}) : super(key: key);

//   // ..

//   @override
//   State<TextSummarizer> createState() => _TextSummarizerState();
// }

// class _TextSummarizerState extends State<TextSummarizer> {
//   // ...
//   Future<void> summarizeText(String text) async {
//     final response = await http.post(
//       Uri.parse(
//           'http://127.0.0.1:5000/'), // Replace with your Flask server address
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode({'rawtext': text}),
//     );

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       final summary = data['summary'];
//       final lenOriginalText = data['len_original_text'];
//       final lenSummary = data['len_summary'];

//       // Now, you can use the summary and other data as needed.
//       print('Summary: $summary');
//       print('Original Text Length: $lenOriginalText');
//       print('Summary Length: $lenSummary');
//     } else {
//       // Handle errors here
//       print('Failed to fetch data');
//     }
//   }

//   // ...
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//   body: ElevatedButton(
//     onPressed: () {
//       summarizeText('Your text to be summarized');
//     },
//     child: const Text('Summarize Text'),
//   ),
// );

//   }
// }

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class TextSummarizer extends StatefulWidget {
//   const TextSummarizer({Key? key}) : super(key: key);

//   @override
//   State<TextSummarizer> createState() => _TextSummarizerState();
// }

// class _TextSummarizerState extends State<TextSummarizer> {
//   TextEditingController textController = TextEditingController();
//   String summary = '';
//   int lenOriginalText = 0;
//   int lenSummary = 0;

//   Future<void> summarizeText(String text) async {
//     final response = await http.post(
//       Uri.parse(
//           'http://127.0.0.1:5000/'), // Replace with your Flask server address
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode({'rawtext': text}),
//     );

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       setState(() {
//         summary = data['summary'];
//         lenOriginalText = data['len_original_text'];
//         lenSummary = data['len_summary'];
//       });

//       // Now, you can use the summary and other data as needed.
//       print('Summary: $summary');
//       print('Original Text Length: $lenOriginalText');
//       print('Summary Length: $lenSummary');
//     } else {
//       // Handle errors here
//       print('Failed to fetch data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           TextField(
//             controller: textController,
//             maxLines: 5, // You can adjust the number of lines as needed
//             decoration: InputDecoration(
//               labelText: 'Enter text to summarize',
//               border: OutlineInputBorder(),
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               summarizeText(textController.text);
//             },
//             child: const Text('Summarize Text'),
//           ),
//           if (summary.isNotEmpty) // Display the summary if available
//             Column(
//               children: [
//                 const Text('Summary:'),
//                 Text(summary),
//                 Text('Original Text Length: $lenOriginalText'),
//                 Text('Summary Length: $lenSummary'),
//               ],
//             ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TextSummarizer extends StatefulWidget {
  const TextSummarizer({Key? key}) : super(key: key);

  @override
  State<TextSummarizer> createState() => _TextSummarizerState();
}

class _TextSummarizerState extends State<TextSummarizer> {
  TextEditingController inputTextController = TextEditingController();
  TextEditingController summaryController = TextEditingController();

  Future<void> summarizeText(String text) async {
    final response = await http.post(
      Uri.parse(
          'http://127.0.0.1:5000/summarize'), // Replace with your Flask server address
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'rawtext': text}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final summary = data['summary'];
      // Set the received summary to the summaryController text field
      summaryController.text = summary;
    } else {
      // Handle errors here
      print('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Summarizer"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Your existing UI elements
              Image(
                width: MediaQuery.of(context).size.width * 0.5,
                fit: BoxFit.cover,
                image: const AssetImage('assets/images/text-summarizer.png'),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text('Text Summarizer',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
              const SizedBox(
                height: 20.0,
              ),
              const Text('Enter text to summarize:'),
              TextField(
                controller: inputTextController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter What you want to get summarized',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Call the summarizeText function with the input text
                  summarizeText(inputTextController.text);
                },
                child: const Text('Summarize Text'),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text('Summarized Text:'),
              TextField(
                controller: summaryController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Summary',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
