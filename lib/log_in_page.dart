import 'package:flutter/material.dart';
import 'package:welcomeproject/constatns.dart';
void main() {
  runApp(const log_in_page());
}

class log_in_page extends StatelessWidget {
  const log_in_page({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
            backgroundColor: kBackgroundColor,
            body: CustomScrollView(
                slivers:[ SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Stack(
                            children: [
                              Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(image: AssetImage('assets/background.jpg'), fit: BoxFit.cover),
                              ),
                            ),  Padding(
                                padding: const EdgeInsets.only(right: 14,top: 8),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 28.0,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),

                            ]
                          )
                          ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:<Widget> [
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: " CONGRAGULATION!=) \n",
                                            style:  Theme.of(context).textTheme.headlineMedium
                                        ),
                                        TextSpan(
                                            text: "You have successfully logged in \n",
                                            style:  Theme.of(context).textTheme.labelMedium
                                        ),

                                      ]
                                  ),
                                ),

                              ],
                            )
                        ),
                      )
                    ],
                  ),
                ),
                ]
            ),
      ),
    );
  }
}
