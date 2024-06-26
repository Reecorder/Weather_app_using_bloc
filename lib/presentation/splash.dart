import 'dart:ui';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        body: Padding(
            padding: const EdgeInsets.fromLTRB(30, 2 * kToolbarHeight, 30, 20),
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(children: [
                  Align(
                    alignment: const AlignmentDirectional(3, -0.3),
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.deepPurple),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-3, -0.3),
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFF673AB7)),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0, -1.2),
                    child: Container(
                      height: 300,
                      width: 600,
                      decoration: const BoxDecoration(color: Color(0xFFFFAB40)),
                    ),
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                    child: Container(
                      decoration:
                          const BoxDecoration(color: Colors.transparent),
                    ),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/logo.gif',
                            scale: 3,
                          ),
                          Text(
                            "Weathering with you",
                            style: TextStyle(
                                foreground: Paint()..shader = linearGradient,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                ]))));
  }

  final Shader linearGradient = const LinearGradient(
    colors: <Color>[
      Color.fromRGBO(103, 58, 183, 1),
      Color(0xFFFFAB40),
      Color(0xFF673AB7)
    ],
  ).createShader(Rect.fromLTWH(50.0, 100.0, 190.0, 0.0));
}
