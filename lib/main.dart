import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:welcomeproject/constatns.dart';
import 'package:welcomeproject/sign_in_page.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'welcomePage',
        theme: ThemeData(
          useMaterial3: true,

               colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
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
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kBackgroundColor,
        ),
        home:  WelcomePage());
  }
}

class WelcomePage extends StatelessWidget {
   WelcomePage({super.key});
  final mybuttonkeyF = GlobalKey();

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
                            image: DecorationImage(image: AssetImage('assets/background.jpg'),fit: BoxFit.cover),
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
                              child: Container(
                                margin: const EdgeInsets.only(bottom:30,top: 20),
                                child: ElevatedButton(
                                    key: mybuttonkeyF,
                                    onPressed: () async {
                                      RenderBox renderbox = mybuttonkeyF.currentContext!.findRenderObject() as RenderBox;
                                      Offset position = renderbox.localToGlobal(Offset.zero);
                                      double x = position.dx;
                                      double y = position.dy;

                                      print(x);
                                      print(y);


                                      GestureBinding.instance.handlePointerEvent(PointerDownEvent(
                                        position: Offset(x, y),
                                      )); //trigger button up,

                                      await Future.delayed(Duration(milliseconds: 500));
                                      //add delay between up and down button

                                      GestureBinding.instance.handlePointerEvent(PointerUpEvent(
                                        position: Offset(x, y),
                                      )); //trigger button down down
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context)=>  sign_in_page()));
                                    },
                                    style: TextButton.styleFrom(
                                        backgroundColor: kPrimaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(22),
                                        )
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal:14,vertical:14),

                                      child: Row(
                                    children: [
                                          Text("START LEARNING",
                                              style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.black)),
                                        const SizedBox(width: 16),
                                        const Icon(Icons.arrow_forward,
                                            color: Colors.black)
                                  ],
                                ),
                                    )//Padding
                                ),
                              ),
                            ),

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
