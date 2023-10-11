import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:welcomeproject/constatns.dart';
import 'package:welcomeproject/log_in_page.dart';
import 'package:welcomeproject/sign_up_page.dart';

class sign_in_page extends StatefulWidget {
  const sign_in_page({super.key});

  @override
  State<sign_in_page> createState() => _sign_in_pageState();
}

class _sign_in_pageState extends State<sign_in_page> {
  late List<GlobalKey<FormState>> formKeys = List.generate(2, (index) => GlobalKey());
  final mybuttonkey = GlobalKey();
  final mybuttonkey1 = GlobalKey();

  bool passwordVisible = false;
  late List<FocusNode> focus;
  List<bool> bools = List.generate(2, (index) => false);
  late List<String> inputs;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
    focus = List.generate(2, (index) => FocusNode());
    inputs = List.generate(2, (index) => '');
    for (int i = 0; i < 2; i++) {
      focus[i].addListener(() {
        if (!focus[i].hasFocus && inputs[i].isNotEmpty) {
          bools[i] = !bools[i];
          if (formKeys[i].currentState!.validate()) {
            bools[i] = false;
          }
        }
      });
    }
  }

  @override
  void dispose() {
    focus[0].dispose();
    focus[1].dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          CustomScrollView(physics: const ClampingScrollPhysics(), slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Stack(children: [
                Column(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Stack(
                        children: [
                          Container(
                            decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/back2.jpg'), fit: BoxFit.cover, alignment: Alignment.bottomCenter)),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 4,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 60),
                                    child: Text('SIGN IN', style: Theme.of(context).textTheme.headlineMedium!),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 30, top: 30),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Form(
                                      key: formKeys[0],
                                      child: Expanded(
                                        child: TextFormField(
                                          inputFormatters: [
                                            FilteringTextInputFormatter.deny(RegExp(r'\s')),
                                          ],
                                          onChanged: (value) {
                                            if (value.isEmpty) {
                                              formKeys[0].currentState!.reset();
                                            }
                                            setState(() {
                                              inputs[0] = value;
                                            });
                                          },
                                          autovalidateMode: bools[0] ? AutovalidateMode.always : AutovalidateMode.disabled,
                                          focusNode: focus[0],
                                          validator: (valueE) {
                                            List<String> errors = [];
                                            valueE = (valueE ?? '').trim();
                                            if (valueE.isEmpty) {
                                              errors.add('please enter your email');
                                            } else if (!RegExp(r'^([a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})$').hasMatch(valueE)) {
                                              errors.add('email pattern is wrong');
                                            }
                                            if (errors.isNotEmpty) {
                                              return errors.join('.\n');
                                            }
                                            return null;
                                          },
                                          style: TextStyle(color: Colors.white),
                                          cursorColor: Colors.white,
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.alternate_email, color: kPrimaryColor),
                                            hintText: "EMAIL",
                                            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: kPrimaryColor)),
                                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white.withOpacity(0.5))),
                                            errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                                          ),
                                          keyboardType: TextInputType.emailAddress,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Form(
                                    key: formKeys[1],
                                    child: Expanded(
                                      child: TextFormField(
                                        inputFormatters: [
                                          FilteringTextInputFormatter.deny(RegExp(r'\s')),
                                        ],
                                        maxLength: 12,
                                        onChanged: (value) {
                                          if (value.isEmpty) {
                                            formKeys[1].currentState!.reset();
                                          }
                                          setState(() {
                                            inputs[1] = value;
                                          });
                                        },
                                        obscureText: passwordVisible,
                                        autovalidateMode: bools[1] ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                                        focusNode: focus[1],
                                        style: TextStyle(color: Colors.white),
                                        validator: (value) {
                                          List<String> errors = [];
                                          value = (value ?? '').trim();
                                          if (value.isEmpty) {
                                            errors.add('Please enter your password');
                                          } else if (value.length < 8 || value.length > 12) {
                                            errors.add('password should be 8-12 character \n & without special character');
                                          }
                                          if (inputs[1].contains(inputs[0])) {
                                            errors.add('password shouldn\'t contain email');
                                          }
                                          if (!RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,12}$').hasMatch(value)) {
                                            if (RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                                              errors.add('password must contain number ');
                                            }
                                            if (RegExp(r'^[0-9]+$').hasMatch(value)) {
                                              errors.add('password must contain alphabet');
                                            }
                                          }
                                          if (errors.isNotEmpty) {
                                            return errors.join('.\n');
                                          }
                                          return null;
                                        },
                                        cursorColor: Colors.white,
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.lock, color: kPrimaryColor),
                                            counterText: "",
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                passwordVisible ? Icons.visibility : Icons.visibility_off,
                                                color: Colors.grey[700],
                                              ),
                                              onPressed: () {
                                                setState(
                                                  () {
                                                    passwordVisible = !passwordVisible;
                                                  },
                                                );
                                              },
                                            ),
                                            hintText: "PASSWORD",
                                            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                                            fillColor: Colors.white,
                                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: kPrimaryColor)),
                                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white.withOpacity(0.5))),
                                            errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red))),
                                        keyboardType: TextInputType.text,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 70,
                              ),
                              FittedBox(
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  child: ElevatedButton(
                                      key: mybuttonkey,
                                      onPressed: () async {
                                        RenderBox renderbox = mybuttonkey.currentContext!.findRenderObject() as RenderBox;
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
                                        )); //trigger button down
                                        if (formKeys[0].currentState!.validate() && formKeys[1].currentState!.validate()) {
                                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => log_in_page()), (Route<dynamic> route) => false);
                                        }
                                      },
                                      style: TextButton.styleFrom(
                                          backgroundColor: kPrimaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(24),
                                          )),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                                        child: Text(
                                          "LOG IN",
                                          style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.black),
                                        ),
                                      ) //Padding
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 0),
                                child: Text('Don\'t have an account ?', style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 16, fontWeight: FontWeight.normal)),
                              ),
                              TextButton(
                                key: mybuttonkey1,
                                onPressed: () async {
                                  RenderBox renderbox = mybuttonkey1.currentContext!.findRenderObject() as RenderBox;
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
                                  )); //trigger button down
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => sign_up_page()));
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                ),
                                child: Text(
                                  'SIGN UP',
                                  style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: 25)
                            ])))
                  ],
                ),
              ]),
            ),
          ]),
        ]),
        // resizeToAvoidBottomInset: false,
      ),
    );
  }
}
