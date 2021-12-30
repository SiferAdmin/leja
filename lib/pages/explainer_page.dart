import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ExplainerPageWidgetWidget extends StatefulWidget {
  const ExplainerPageWidgetWidget({Key? key}) : super(key: key);

  @override
  _ExplainerPageWidgetWidgetState createState() =>
      _ExplainerPageWidgetWidgetState();
}

class _ExplainerPageWidgetWidgetState extends State<ExplainerPageWidgetWidget> {
  late PageController pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 20),
                                      child: Image.network(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8yyNQLNSBhau-x7vYykAoWbdIeKh_sgwlyw&usqp=CAU',
                                        width: 350,
                                        height: 400,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
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
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 20),
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
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
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 30),
                                      child: Image.network(
                                        'data:image/jpeg;base64,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',
                                        width: 350,
                                        height: 400,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
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
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
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
                            effect: const ExpandingDotsEffect(
                              expansionFactor: 2,
                              spacing: 8,
                              radius: 16,
                              dotWidth: 8,
                              dotHeight: 8,
                              dotColor: const Color(0xFFC6CAD4),
                              // activeDotColor: Colors.black,
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
    );
  }
}
