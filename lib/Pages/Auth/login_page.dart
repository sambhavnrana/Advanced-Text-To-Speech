import 'package:flutter/material.dart';
import 'package:tts/GlobalState/colorscheme.dart';
import 'package:tts/GlobalState/responsiveUtils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var showPassword = true;
  void togglePasswordVisibility() {
    setState(() {
      showPassword = !showPassword;
    });
  }

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
                    padding: const EdgeInsets.all(20),
                    width: Responsiveness.screenWidth(context) * 0.5,
                    child: const Image(
                      image: NetworkImage(
                          'https://cdn3d.iconscout.com/3d/premium/thumb/computer-password-4416190-3664012.png?f=webp'),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
                    width: Responsiveness.screenWidth(context),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Login ",
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
                        const Text('Login to your Account',
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w300,
                                color: Color.fromARGB(255, 26, 19, 19))),
                        const SizedBox(
                          height: 25.0,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              filled: true,
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
                          height: 25.0,
                        ),
                        TextField(
                          obscureText: showPassword,
                          decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  togglePasswordVisibility();
                                },
                                child: showPassword
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility),
                              ),
                              filled: true,
                              border: InputBorder.none,
                              fillColor: Colors.grey[100],
                              labelText: 'Password',
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
                    child: const Text("Login"),
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
                      const Text('Already have an account ? '),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/register'),
                        child: const Text(
                          'Register',
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
