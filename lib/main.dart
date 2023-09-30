import 'package:flutter/material.dart';
import 'package:welcomeproject/constatns.dart';
import 'package:welcomeproject/sign_in_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'welcomePage',
        theme: ThemeData(
          textTheme: const TextTheme(
              headlineMedium: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 27
              ),
              headlineSmall: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 19
              ),
              labelMedium: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 21

              ),
              labelSmall: TextStyle(
                  color: Colors.white,
                  fontSize: 13

              )
          ),
          inputDecorationTheme: const InputDecorationTheme(
              disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
              )
          ),
          brightness: Brightness.dark,
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kBackgroundColor,
        ),
        home: const WelcomePage());
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: kBackgroundColor,
          body: CustomScrollView(
              slivers:[ SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    Expanded(
                        flex: 3,
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(image: AssetImage('assets/background.jpg'), fit: BoxFit.cover),
                          ),
                        )),
                    SizedBox(height:20),
                    Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:<Widget> [
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "WELCOME TO \n",
                                        style:  Theme.of(context).textTheme.headlineMedium
                                    ),
                                    TextSpan(
                                        text: "BAKING LESSONS \n",
                                        style:  Theme.of(context).textTheme.headlineMedium
                                    ),
                                    TextSpan(
                                        text: 'MASTER THE ART OF BAKING',
                                        style: Theme.of(context).textTheme.headlineSmall
                                    )
                                  ]
                              ),
                            ),
                            FittedBox(
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=> const sign_in_page())
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(bottom:40,top: 20),
                                  padding: const EdgeInsets.symmetric(horizontal:14,vertical:14),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(22),
                                      color: kPrimaryColor
                                  ),
                                  child: Row(
                                    children: [
                                      Text("START LEARNING",
                                          style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.black)),
                                      const SizedBox(width: 16),
                                      const Icon(Icons.arrow_forward,
                                          color: Colors.black)
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                    )
                  ],
                ),
              ),
              ]
          ),
        ),
      ),
    );
  }
}
