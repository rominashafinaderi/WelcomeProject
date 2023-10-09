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

  final email = GlobalKey<FormState>();
  final password = GlobalKey<FormState>();
  String passwordC ="";
  String emailC ="";
  bool passwordVisible=false;
  late List<FocusNode> focus;
  List<bool> bools = List.generate(2, (index) => false);

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
    focus = List.generate(2, (index) => FocusNode());
    for (int i = 0; i < 2; i++) {
      focus[i].addListener(() {
        if (!focus[i].hasFocus && emailC.isNotEmpty) {
          bools[i] = !bools[i];
          var check = (i == 0 ? email : password).currentState!.validate();
          if (check) {
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

    return  SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          physics:ClampingScrollPhysics(),
          slivers:[ SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children:<Widget> [
                Expanded(
                  flex:3,
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/back2.jpg'),
                            fit: BoxFit.cover,
                            alignment: Alignment.bottomCenter
                        )
                    ),
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20),
                      child: Column(
                        children:<Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:<Widget> [
                              Text('SIGN IN',
                                  style: Theme.of(context).textTheme.headlineMedium!
                              ),
                            ],
                          ),
                          const Spacer(),

                          Padding(
                            padding: const EdgeInsets.only(bottom: 30,top: 30),
                            child:  Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:<Widget> [
                                Form(
                                  key: email,
                                  child: Expanded(
                                    child: TextFormField(
                                      inputFormatters: [
                                        FilteringTextInputFormatter.deny(
                                            RegExp(r'\s')),
                                      ],
                                      onChanged: (value){
                                        if (value.isEmpty) {
                                          email.currentState!.reset();
                                        }
                                        setState(() {
                                          emailC = value;
                                        });
                                      },
                                      autovalidateMode: bools[0] ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                                      focusNode: focus[0],
                                      validator: (valueE) {
                                        List<String> errors = [];
                                        valueE = (valueE ?? '').trim();
                                        if (valueE.isEmpty) {
                                          errors.add('please enter your email');
                                        }  else if (!RegExp(r'^([a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})$').hasMatch(valueE)) {
                                          errors.add('email pattern is wrong');
                                        }if (errors.isNotEmpty) {
                                          return errors.join('.\n');
                                        }
                                        return null;
                                      },
                                       style: TextStyle(color: Colors.white),
                                      cursorColor: Colors.white,
                                      decoration:  InputDecoration(
                                        prefixIcon:Icon(Icons.alternate_email,color:kPrimaryColor),
                                        hintText: "EMAIL",
                                        hintStyle:TextStyle(color: Colors.white.withOpacity(0.5)) ,
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: kPrimaryColor
                                            )
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white.withOpacity(0.5)
                                            )
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.red
                                            )
                                        ),
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
                            children:<Widget> [

                              Form(
                                key: password,
                                child: Expanded(
                                  child: TextFormField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.deny(
                                          RegExp(r'\s')),
                                    ],
                                    maxLength: 12,
                                    onChanged: (value){
                                      if (value.isEmpty) {
                                        password.currentState!.reset();
                                      }
                                      setState(() {
                                        passwordC = value;
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
                                      }
                                      else if (value.length != 12) {
                                        errors.add('password should be 8-12 character \n & without special character');
                                      }if(passwordC.contains(emailC)){
                                        errors.add('password shouldn\'t contain email');
                                      } if(!RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,12}$').hasMatch(value)){
                                     if(RegExp(r'^[a-zA-Z]+$').hasMatch(value)){
                                        errors.add('password must contain number ');
                                      }if(RegExp(r'^[0-9]+$').hasMatch(value)){
                                        errors.add('password must contain alphabet');
                                      }
                                      }
                                        if (errors.isNotEmpty) {
                                        return errors.join('.\n');
                                      }
                                      return null;
                                    },
                                    cursorColor: Colors.white,
                                    decoration:  InputDecoration(
                                        prefixIcon: Icon(Icons.lock,color:kPrimaryColor),

                                        counterText:"",
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                              passwordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,color:Colors.grey[700],),
                                          onPressed: (){
                                            setState(
                                                  () {
                                                passwordVisible = !passwordVisible;
                                              },
                                            );
                                          },
                                        ),
                                        hintText: "PASSWORD",
                                        hintStyle:TextStyle(color: Colors.white.withOpacity(0.5)) ,
                                        fillColor: Colors.white,
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: kPrimaryColor
                                            )
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white.withOpacity(0.5)
                                          )
                                        ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.red
                                        )
                                      )
                                    ),
                                    keyboardType: TextInputType.text,

                                  ),
                                ),
                              )
                            ],
                          ),
                          const  Spacer(),

                        FittedBox(
                          child: Container(
                            margin: const EdgeInsets.only(bottom:20,top:45),
                                child: ElevatedButton(
                                    onPressed: (){
                                          if (email.currentState!.validate()&&password.currentState!.validate()) {
                                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                                    log_in_page()), (Route<dynamic> route) => false);
                                              }
                                    },
                                    style: TextButton.styleFrom(
                                        backgroundColor: kPrimaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(24),
                                        )
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal:80,vertical:15),

                                      child: Text(
                                        "LOG IN",
                                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                            color: Colors.black
                                        ),
                                      ),
                                    )//Padding
                                ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(bottom:0),
                          child: Text('Don\'t have an account ?',
                            style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 16,fontWeight: FontWeight.normal)
                          ),
                        ),
                          TextButton(
                            onPressed: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>  sign_up_page())
                              );
                            },
                            style:TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                            ),
                            child:  Text('SIGN UP',
                                style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 14,fontWeight: FontWeight.bold),
                              ),


                          ),
                          SizedBox(height:45)
                        ]
                    )

                    ))
              ],

            ),
          ),
        ]
        ),
        // resizeToAvoidBottomInset: false,
      ),
    );
  }
}
