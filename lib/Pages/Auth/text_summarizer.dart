import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tts/GlobalState/colorscheme.dart';
import 'package:tts/GlobalState/responsiveUtils.dart';

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
          'https://saurabh02.pythonanywhere.com/summarize'), // Replace with your Flask server address
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
              title: const Text('Text to Speech'),
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
      body: SingleChildScrollView(
        child: SafeArea(
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
                  minLines: 1,
                  maxLines: 7,
                  controller: inputTextController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter the text you want to get Summarized',
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),

                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          ColorSchemes.orangeC),
                      fixedSize: MaterialStateProperty.all<Size>(Size(
                          Responsiveness.screenWidth(context) * 0.40,
                          Responsiveness.screenHeight(context) * 0.06))),
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
                  keyboardType: TextInputType.multiline,
                  maxLines: null, // Allows for dynamic height
                  controller: summaryController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Summary',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
