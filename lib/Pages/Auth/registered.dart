import 'package:flutter/material.dart';
import 'package:tts/GlobalState/colorscheme.dart';
import 'package:tts/GlobalState/responsiveUtils.dart';

class Registered extends StatelessWidget {
  const Registered({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    width: Responsiveness.screenWidth(context) * 0.8,
                    child: const Image(
                      image: NetworkImage(
                          'https://media3.giphy.com/media/ggtpYV17RP9lTbc542/200w.webp?cid=ecf05e474d866i3fyisf1k8a5rw79pneaza40p1xic2nvlpp&ep=v1_gifs_search&rid=200w.webp&ct=g'),
                    ),
                  ),
                  Container(
                    child: const Column(
                      children: [
                        Text(
                          " Registered Successfully ",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: ColorSchemes.orangeC),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Please Login',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: ColorSchemes.blackC),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            ColorSchemes.orangeC),
                        fixedSize: MaterialStateProperty.all<Size>(Size(
                            Responsiveness.screenWidth(context) * 0.85,
                            Responsiveness.screenHeight(context) * 0.05))),
                    child: const Text("Login"),
                  ),
                ],
              ),

              // Add more widgets here under the ListView if needed.
            ],
          ),
        ),
      ),
    );
  }
}
