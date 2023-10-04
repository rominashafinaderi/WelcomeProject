import 'package:flutter/material.dart';
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


  @override
  void initState(){
    super.initState();
    passwordVisible=true;
  }

  @override
  Widget build(BuildContext context) {

    return  SafeArea(
      child: Scaffold(
        body: CustomScrollView(
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
                      padding: const EdgeInsets.symmetric(horizontal:16),
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
                                const Padding(
                                  padding: EdgeInsets.only(right:6),
                                  child: Icon(Icons.alternate_email,color:kPrimaryColor),
                                ),
                                Form(
                                  key: email,
                                  child: Expanded(
                                    child: TextFormField(
                                      onChanged: (value){
                                        if (value.isEmpty) {
                                          email.currentState!.reset();
                                        }
                                        setState(() {
                                          emailC = value;
                                        });
                                      },
                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                      validator: (valueE) {

                                        if (valueE == null || valueE.isEmpty) {
                                          return 'Please enter your email';
                                        }else if(!RegExp(r'^([a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})$').hasMatch(valueE)){
                                          return 'email pattern is wrong';
                                        }
                                        return null;
                                      },
                                      cursorColor: Colors.white,

                                      decoration:  InputDecoration(
                                        hintText: "EMAIL",
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:<Widget> [
                              const Padding(
                                padding: EdgeInsets.only(right:6),
                                child: Icon(Icons.lock,color:kPrimaryColor),
                              ),
                              Form(
                                key: password,
                                child: Expanded(
                                  child: TextFormField(
                                    onChanged: (value){
                                      if (value.isEmpty) {
                                        password.currentState!.reset();
                                      }
                                      setState(() {
                                        passwordC = value;
                                      });
                                    },
                                    obscureText: passwordVisible,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,

                                    validator: (value) {
                                      if (value == null || value.trim().isEmpty) {
                                        return 'Please enter some text';
                                      }else if(passwordC.contains(emailC)){
                                        return'password shouldn\'t contain email';
                                      }else{
                                        if(!RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,12}$').hasMatch(value)){
                                          return '8-12 character &number &alphabet& no special character';
                                        }
                                      }
                                      return null;
                                    },
                                    cursorColor: Colors.white,
                                    decoration:  InputDecoration(
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
                            child: GestureDetector(
                              onTap: (){
                                if (email.currentState!.validate()&&password.currentState!.validate()) {
                                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                      log_in_page()), (Route<dynamic> route) => false);
                                }
                              },
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom:20,top: 20),
                                    padding: const EdgeInsets.symmetric(horizontal:80,vertical:13),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24),
                                        color: kPrimaryColor
                                    ),
                                    child: Row(
                                      children: [
                                        Text("LOG IN",
                                            style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.black)),
                                        const SizedBox(width: 16),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ),
                        Padding(
                          padding: const EdgeInsets.only(bottom:10),
                          child: Text('Don\'t have an account ?',
                            style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 16,fontWeight: FontWeight.normal)
                          ),
                        ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>  sign_up_page())
                              );
                            },
                            child:    Padding(
                              padding: const EdgeInsets.only(bottom: 70),
                              child: Text('SIGN UP',
                                style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 14,fontWeight: FontWeight.bold),
                              ),
                            )
                            ,
                          )
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
