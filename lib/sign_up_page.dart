import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:welcomeproject/constatns.dart';
import 'package:welcomeproject/sign_in_page.dart';
import 'package:welcomeproject/textFormField2.dart';
class sign_up_page extends StatefulWidget {
  const sign_up_page({super.key});

  @override
  State<sign_up_page> createState() => _sign_up_pageState();
}

class _sign_up_pageState extends State<sign_up_page> {

  late List<GlobalKey<FormState>> formKeys = List.generate(5, (index) => GlobalKey());
  bool passwordVisible=false;
  late List<FocusNode> focus;
  List<bool> bools = List.generate(5, (index) => false);
   late List<String> inputs ;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
    inputs = List.generate(5, (index) => '');
    focus = List.generate(5, (index) => FocusNode());
    for (int i = 0; i <5; i++) {
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
    focus[2].dispose();
    focus[3].dispose();
    focus[4].dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return  SafeArea(
      child: Scaffold(
        body: Stack(
          children:[ CustomScrollView(
              physics: const ClampingScrollPhysics(),
              slivers:[
                SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children:<Widget> [
                    Expanded(
                      flex:1,
                      child: Stack(
                        children:[
                          Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(image: AssetImage('assets/back2.jpg'),
                                  fit: BoxFit.cover,
                                  alignment: Alignment.bottomCenter
                              )
                          ),
                        ),

                        ]
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal:18),
                            child: Column(
                                children:<Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:<Widget> [
                                      Text('SIGN UP',
                                          style: Theme.of(context).textTheme.headlineMedium!
                                      ),
                                    ],
                                  ),

                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom:8,top:8),
                                    child:  Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children:<Widget> [
                                        Form(
                                          key: formKeys[0],
                                          child: Expanded(
                                            child: TextFormField2(
                                              inputFormatters: [
                                                FilteringTextInputFormatter.deny(
                                                    RegExp(r'\s')),
                                              ],
                                              maxLength: 10,
                                              onChanged: (valueF){
                                                if (valueF.isEmpty) {
                                                  formKeys[0].currentState!.reset();
                                                }
                                                setState(() {
                                                  inputs[0] = valueF;
                                                });
                                              },
                                              style: TextStyle(color: Colors.white),
                                              autovalidateMode: bools[0] ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                                              focusNode: focus[0],
                                              validator: (valueF) {
                                                List<String> errors = [];
                                                valueF = (valueF ?? '').trim();
                                                if (valueF.isEmpty) {
                                                  errors.add('Please enter your first name');
                                                }
                                                else  if(valueF.length<3 ||valueF.length>10){
                                                  errors.add('first name must be between 3-10 character');
                                                }
                                                 if(!RegExp(r'^[\u0600-\u06FF\s]+$').hasMatch(valueF)){
                                                  errors.add('first name must be persian');
                                                }
                                                 if (errors.isNotEmpty) {
                                                  return errors.join('.\n');
                                                }
                                                return null;
                                              },
                                              cursorColor: Colors.white,
                                              textDirection: TextDirection.rtl,
                                              decoration:  InputDecoration(
                                                prefixIcon:Icon(Icons.person_outline,color:kPrimaryColor),
                                                hintStyle:TextStyle(color: Colors.white.withOpacity(0.5)) ,
                                                counterText:"",
                                                  hintText: "FIRST NAME",
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
                                                ),
                                              ),
                                              keyboardType: TextInputType.text,

                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom:8),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children:<Widget> [

                                        Form(
                                          key: formKeys[1],
                                          child: Expanded(
                                            child: TextFormField2(
                                              inputFormatters: [
                                                FilteringTextInputFormatter.deny(
                                                    RegExp(r'\s')),
                                              ],
                                              maxLength: 15,
                                              onChanged: (value){
                                                setState(() {
                                                  inputs[1] = value;
                                                });
                                                if (value.isEmpty) {
                                                  formKeys[1].currentState!.reset();
                                                }

                                              },
                                              style: TextStyle(color: Colors.white),
                                              autovalidateMode: bools[1] ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                                              focusNode: focus[1],
                                              validator: (valueS) {
                                                List<String> errors = [];
                                                valueS = (valueS ?? '').trim();
                                                if (valueS.isEmpty) {
                                                  errors.add('Please enter your last name');
                                                }
                                                 else if(valueS.length<5||valueS.length>15){
                                                  errors.add('last name must be persian between 5-15 character');
                                                }
                                                 if(valueS.contains( inputs[0])){
                                                  errors.add('last name shouldn\'t contain first name');

                                                }
                                                if (!RegExp(r'^[\u0600-\u06FF\s]+$').hasMatch(valueS)) {                                                errors.add('last name must be persian');
                                                }
                                                if (errors.isNotEmpty) {
                                                  return errors.join('.\n');
                                                }
                                                return null;
                                              },
                                              textDirection: TextDirection.rtl,
                                              cursorColor: Colors.white,
                                              decoration:  InputDecoration(
                                                prefixIcon:Icon(Icons.person_add_outlined,color:kPrimaryColor),
                                                counterText:"",
                                                hintStyle:TextStyle(color: Colors.white.withOpacity(0.5)) ,
                                                hintText: "LAST NAME",
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
                                                ),
                                              ),
                                              keyboardType: TextInputType.text,

                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom:8),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children:<Widget> [

                                        Form(
                                          key:formKeys[2],
                                          child: Expanded(
                                            child: TextFormField(
                                              inputFormatters: [
                                                FilteringTextInputFormatter.deny(
                                                    RegExp(r'\s')),
                                              ],
                                              maxLength: 11,
                                              onChanged: (value){
                                                if (value.isEmpty) {
                                                  formKeys[2].currentState!.reset();
                                                }
                                                setState(() {
                                                  inputs[2] = value;
                                                });
                                              },
                                              style: TextStyle(color: Colors.white),
                                              autovalidateMode: bools[2] ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                                              focusNode: focus[2],
                                              validator: (value) {
                                                List<String> errors = [];
                                                value = (value ?? '').trim();
                                                if (value.isEmpty) {
                                                    errors.add('please enter your phone number');
                                                }
                                                else if (value.length != 11) {
                                                  errors.add('password Should be 11 digit');
                                                }else if(!RegExp(r'^[0][9][0-9]+$').hasMatch(value)){
                                                  errors.add('phone must start with 09');
                                                }
                                                if (errors.isNotEmpty) {
                                                  return errors.join('.\n');
                                                }
                                                return null;
                                              },
                                              cursorColor: Colors.white,
                                              decoration:  InputDecoration(
                                                counterText:"",
                                                hintStyle:TextStyle(color: Colors.white.withOpacity(0.5)) ,
                                                prefixIcon:Icon(Icons.phone,color:kPrimaryColor),
                                                hintText: "PHONE",
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
                                                ),
                                              ),
                                              keyboardType: TextInputType.phone,

                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom:8),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children:<Widget> [

                                        Form(
                                          key: formKeys[3],
                                          child: Expanded(
                                            child: TextFormField(
                                              inputFormatters: [
                                                FilteringTextInputFormatter.deny(
                                                    RegExp(r'\s')),
                                              ],
                                              onChanged: (value){
                                                if (value.isEmpty) {
                                                  formKeys[3].currentState!.reset();
                                                }
                                                setState(() {
                                                  inputs[3] = value;
                                                });
                                              },
                                              style: TextStyle(color: Colors.white),
                                              autovalidateMode: bools[3] ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                                              focusNode: focus[3],
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
                                              cursorColor: Colors.white,

                                              decoration:  InputDecoration(
                                                prefixIcon:Icon(Icons.alternate_email_outlined,color:kPrimaryColor),
                                                hintText: "EMAIL",
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
                                                ),
                                              ),
                                              keyboardType: TextInputType.emailAddress,

                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                              Padding(
                                padding: const EdgeInsets.only(bottom:8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children:<Widget> [

                                    Form(
                                      key: formKeys[4],
                                      child: Expanded(
                                        child: TextFormField(
                                          inputFormatters: [
                                            FilteringTextInputFormatter.deny(
                                                RegExp(r'\s')),
                                          ],
                                          maxLength: 12,
                                          onChanged: (value){
                                            if (value.isEmpty) {
                                              formKeys[4].currentState!.reset();
                                            }
                                            setState(() {
                                              inputs[4] = value;
                                            });
                                          },
                                          style: TextStyle(color: Colors.white),
                                          obscureText: passwordVisible,
                                          autovalidateMode: bools[4] ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                                          focusNode: focus[4],
                                          validator: (value) {
                                            List<String> errors = [];
                                            value = (value ?? '').trim();
                                            if (value.isEmpty) {
                                              errors.add(
                                                  'Please enter your password');
                                            }else  if(value.length<8 ||value.length>12){
                                              errors.add('password should be 8-12 character \n & without special character');
                                            } if(value[4].contains(value[3])){
                                              errors.add('password shouldn\'t contain email');
                                            }  if(!RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,12}$').hasMatch(value)){
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
                                            counterText:"",
                                            prefixIcon:Icon(Icons.lock,color:kPrimaryColor),
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                  passwordVisible
                                                      ? Icons.visibility
                                                      : Icons.visibility_off,color:Colors.grey[700]),
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
                                            ),
                                          ),
                                          keyboardType: TextInputType.text,

                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                                  const  Spacer(),
                                  FittedBox(
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom:8,top: 8),
                                      child: ElevatedButton(
                                          onPressed: () async {
                                            await Future.delayed(Duration(milliseconds: 150));
                                            if (formKeys[0].currentState!.validate()&&
                                                formKeys[1].currentState!.validate()&&
                                                formKeys[2].currentState!.validate()&&
                                                formKeys[3].currentState!.validate()&&
                                                formKeys[4].currentState!.validate()
                                            ) {
                                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                                  sign_in_page()), (Route<dynamic> route) => false);
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                              foregroundColor: Colors.black, // Background color
                                              shadowColor: kPrimaryColor,
                                              enableFeedback: true,
                                              backgroundColor: kPrimaryColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(22),
                                              )
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal:80,vertical:15),
                                            child: Text(
                                              "SIGN UP",
                                              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                                  color: Colors.black
                                              ),
                                            ),
                                          )//Padding
                                      ),
                                    ),
                                  ),
                                Text('Don\'t have an account ?',
                                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 16,fontWeight: FontWeight.normal)
                                    ),
                                    TextButton(
                                      onPressed: ()  async {
                                        await Future.delayed(Duration(milliseconds: 150));
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context)=>  sign_in_page())
                                        );                                  },
                                      style: TextButton.styleFrom(
                                        // backgroundColor: Colors.transparent,
                                        foregroundColor: kPrimaryColor, // Background color
                                        shadowColor: kPrimaryColor,
                                        enableFeedback: true,
                                      ),
                                      child:  Text('SIGN IN',
                                        style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 14,fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                ]
                            )

                        ))
                  ],

                ),
              ),
              ]
          ),

          ]
        ),
        // resizeToAvoidBottomInset: false,
      ),
    );
  }
}
