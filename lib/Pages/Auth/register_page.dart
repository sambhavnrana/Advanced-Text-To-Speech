import 'package:flutter/material.dart';
import 'package:tts/GlobalState/colorscheme.dart';
import 'package:tts/GlobalState/responsiveUtils.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                    padding: const EdgeInsets.only(top: 130.0, bottom: 30.0),
                    width: Responsiveness.screenWidth(context),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Register ",
                            style: TextStyle(
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 26, 19, 19))),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    width: Responsiveness.screenWidth(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Lets Get Started',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 26, 19, 19))),
                        const Text('Create an Account',
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w300,
                                color: Color.fromARGB(255, 26, 19, 19))),
                        const SizedBox(
                          height: 15.0,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              filled: true,
                              border: InputBorder.none,
                              fillColor: Colors.grey[100],
                              labelText: 'Full Name',
                              labelStyle: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromARGB(255, 26, 19, 19))),
                          style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 26, 19, 19)),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              filled: true,
                              border: InputBorder.none,
                              fillColor: Colors.grey[100],
                              labelText: 'Email',
                              labelStyle: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromARGB(255, 26, 19, 19))),
                          style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 26, 19, 19)),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(children: <Widget>[
                          Expanded(child: Divider()),
                          Text("OR"),
                          Expanded(child: Divider()),
                        ]),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              filled: true,
                              border: InputBorder.none,
                              fillColor: Colors.grey[100],
                              labelText: 'Phone number',
                              labelStyle: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromARGB(255, 26, 19, 19))),
                          style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 26, 19, 19)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 60.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/welcome');
                    },
                    child: Text("Register"),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            ColorSchemes.orangeC),
                        fixedSize: MaterialStateProperty.all<Size>(Size(
                            Responsiveness.screenWidth(context) * 0.85,
                            Responsiveness.screenHeight(context) * 0.05))),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account ? '),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/login'),
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: ColorSchemes.orangeC,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
