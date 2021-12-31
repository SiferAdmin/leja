import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Explainer extends StatefulWidget {
  const Explainer({Key? key}) : super(key: key);

  @override
  ExplainerState createState() => ExplainerState();
}

class ExplainerState extends State<Explainer> {
  PageController pageViewController = PageController(initialPage: 0);
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 1,
                    child: Stack(
                      children: [
                        PageView(
                          controller: pageViewController,
                          scrollDirection: Axis.vertical,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: const BoxDecoration(
                                  // color: Color(0xFF4B39EF),
                                  ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 0, 0, 20),
                                        child: Image.network(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8yyNQLNSBhau-x7vYykAoWbdIeKh_sgwlyw&usqp=CAU',
                                          width: 350,
                                          height: MediaQuery.of(context)
                                                      .orientation ==
                                                  Orientation.portrait
                                              ? MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.7
                                              : MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.25,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 20, 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: const [
                                        Text(
                                          'Explore your City',
                                          style: TextStyle(
                                            fontFamily: 'Lexend Deca',
                                            // color: Colors.white,
                                            fontSize: 32,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 20, 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        const Expanded(
                                          child: Text(
                                            'Find hidden Gems around your city, by exploring the curated lists of others.',
                                            style: TextStyle(
                                              fontFamily: 'Lexend Deca',
                                              // color: Color(0x99FFFFFF),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 20, 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 16, 0, 0),
                                            child: ElevatedButton(
                                                onPressed: () {},
                                                child: const Text('Explore'))),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              decoration: const BoxDecoration(
                                  // color: Color(0xFF15212B),
                                  ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 0, 0, 20),
                                        child: Image.network(
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxDTkADak--vyDj5X_xFhIUgln1G9XzVD4CQ&usqp=CAU",
                                          width: 350,
                                          height: 400,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 20, 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: const [
                                        Text(
                                          'Message Friends',
                                          style: TextStyle(
                                            fontFamily: 'Lexend Deca',
                                            // color: Colors.white,
                                            fontSize: 32,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 20, 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: const [
                                        Expanded(
                                          child: Text(
                                            'Stay in the loop with trip plans, places to go and transportation.',
                                            style: TextStyle(
                                              fontFamily: 'Lexend Deca',
                                              // color: Color(0x99FFFFFF),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 20, 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 16, 0, 0),
                                            child: ElevatedButton(
                                                onPressed: () {},
                                                child: const Text('Explore'))),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              decoration: const BoxDecoration(
                                  // color: Color(0xFFDCE0E4),
                                  ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 0, 0, 30),
                                        child: Image.network(
                                          'https://thumbs.dreamstime.com/b/savings-spending-comcept-pink-ceramic-piggy-bank-completely-broken-up-several-large-pieces-money-inside-d-render-139053604.jpg',
                                          width: 350,
                                          height: 400,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 20, 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: const [
                                        Text(
                                          'Track Expenses',
                                          style: TextStyle(
                                            fontFamily: 'Lexend Deca',
                                            // color: Color(0xFF151B1E),
                                            fontSize: 32,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 20, 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: const [
                                        Expanded(
                                          child: Text(
                                            'Don’t overspend on your trip, track all your expenses within the application.',
                                            style: TextStyle(
                                              fontFamily: 'Lexend Deca',
                                              // color: Color(0xFF82878C),
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 20, 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 16, 0, 0),
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              child: const Text('Explore'),
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.85, 0.7),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 10),
                            child: SmoothPageIndicator(
                              controller: pageViewController,
                              count: 3,
                              axisDirection: Axis.vertical,
                              onDotClicked: (i) {
                                pageViewController.animateToPage(
                                  i,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                              effect: ExpandingDotsEffect(
                                expansionFactor: 2,
                                spacing: 8,
                                radius: 16,
                                dotWidth: 8,
                                dotHeight: 8,
                                // dotColor:isDarkMode?Colors.black:Colors.pink,
                                activeDotColor: SchedulerBinding.instance!
                                            .window.platformBrightness ==
                                        Brightness.light
                                    ? const Color(0xFFF687D4)
                                    : Colors.pink,
                                paintStyle: PaintingStyle.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
