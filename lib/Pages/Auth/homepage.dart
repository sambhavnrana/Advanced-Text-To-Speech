import 'package:flutter/material.dart';
import 'package:tts/GlobalState/colorscheme.dart';
import 'package:tts/GlobalState/responsiveUtils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: const Text("Text to Speech")),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Image(
                width: Responsiveness.screenWidth(context) * 0.9,
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://imgs.search.brave.com/9JVdFwtEXivfHQSMcNl2c8aAcXBFrZ6YGpaEBDTG_TE/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pLmVi/YXlpbWcuY29tL2lt/YWdlcy9nL3Nmc0FB/T1N3aU9OWU1SbUov/cy1sMTQwLmpwZw'),
              ),
              SizedBox(
                height: Responsiveness.screenHeight(context) * 0.05,
              ),
              Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Welcome to Text to Speech",
                        style: TextStyle(
                            color: Colors.redAccent[200],
                            fontSize:
                                Responsiveness.textScaleFactor(context) * 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.lightBlueAccent),
                            fixedSize: MaterialStateProperty.all<Size>(Size(
                                Responsiveness.screenWidth(context) * 0.27,
                                Responsiveness.screenHeight(context) * 0.06))),
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: const Text("Register"),
                      ),
                      SizedBox(
                        width: Responsiveness.screenWidth(context) * 0.1,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                ColorSchemes.orangeC),
                            fixedSize: MaterialStateProperty.all<Size>(Size(
                                Responsiveness.screenWidth(context) * 0.27,
                                Responsiveness.screenHeight(context) * 0.06))),
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text("Login"),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}
