import 'package:flutter/material.dart';
import 'package:welcomeproject/constatns.dart';
import 'package:welcomeproject/sign_in_page.dart';
import 'package:welcomeproject/textFormField2.dart';
class sign_up_page extends StatefulWidget {
  const sign_up_page({super.key});

  @override
  State<sign_up_page> createState() => _sign_up_pageState();
}

class _sign_up_pageState extends State<sign_up_page> {
  final firstname = GlobalKey<FormState>();
  final lastname = GlobalKey<FormState>();
  final phone = GlobalKey<FormState>();
  final email = GlobalKey<FormState>();
  final password = GlobalKey<FormState>();

  bool passwordVisible=false;
  String firstNameC = "";
  String lastNameC= "";
  String phoneC ="";
  String passwordC ="";
  String emailC ="";


  @override
  void initState() {
    super.initState();
    passwordVisible = true;
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
                    flex:1,
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
                      flex: 2,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal:16),
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
                                  padding: const EdgeInsets.only(bottom:0,top:10),
                                  child:  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children:<Widget> [
                                      const Padding(
                                        padding: EdgeInsets.only(right:6),
                                        child: Icon(Icons.person_outline,color:kPrimaryColor),
                                      ),
                                      Form(
                                        key: firstname,
                                        child: Expanded(
                                          child: TextFormField2(
                                            maxLength: 10,
                                            onChanged: (valueF){
                                              if (valueF.isEmpty) {
                                              firstname.currentState!.reset();
                                              }
                                              setState(() {
                                                firstNameC = valueF;
                                              });
                                            },
                                            autovalidateMode: AutovalidateMode.onUserInteraction,
                                            validator: (valueF) {
                                              List<String> errors = [];
                                              valueF = (valueF ?? '').trim();
                                              if (valueF.isEmpty) {
                                                errors.add('Please enter your first name');
                                              } if(valueF.length<3 ||valueF.length>10){
                                                errors.add('first name must be between 3-10 character');
                                              } if(!RegExp(r'^[\u0600-\u06FF\s]+$').hasMatch(valueF)){
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
                                  padding: const EdgeInsets.only(bottom:0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children:<Widget> [
                                      const Padding(
                                        padding: EdgeInsets.only(right:6),
                                        child: Icon(Icons.person_add_outlined,color:kPrimaryColor),
                                      ),
                                      Form(
                                        key: lastname,
                                        child: Expanded(
                                          child: TextFormField2(
                                            maxLength: 15,
                                            onChanged: (value){
                                              if (value.isEmpty) {
                                                lastname.currentState!.reset();
                                              }
                                              setState(() {
                                                lastNameC = value;
                                              });
                                            },
                                            autovalidateMode: AutovalidateMode.onUserInteraction,
                                            validator: (value) {
                                              List<String> errors = [];
                                              value = (value ?? '').trim();
                                              if (value.isEmpty) {
                                                errors.add('Please enter your last name');
                                              } if(value.length<5 ||value.length>15){
                                                errors.add('last name must be between 5-15 character');
                                              } if(!RegExp(r'^[\u0600-\u06FF\s]+$').hasMatch(value)){
                                                errors.add('last name must be persian');
                                              } if(lastNameC.contains(firstNameC)){
                                                errors.add('last name shouldn\'t contain first name');
                                              }if (errors.isNotEmpty) {
                                                return errors.join('.\n');
                                              }
                                              return null;
                                            },
                                            textDirection: TextDirection.rtl,
                                            cursorColor: Colors.white,
                                            decoration:  InputDecoration(
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
                                  padding: const EdgeInsets.only(bottom: 0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children:<Widget> [
                                      const Padding(
                                        padding: EdgeInsets.only(right:6),
                                        child: Icon(Icons.phone,color:kPrimaryColor),
                                      ),
                                      Form(
                                        key: phone,
                                        child: Expanded(
                                          child: TextFormField(
                                            maxLength: 11,
                                            onChanged: (value){
                                              if (value.isEmpty) {
                                                phone.currentState!.reset();
                                              }
                                              setState(() {
                                                phoneC = value;
                                              });
                                            },
                                            autovalidateMode: AutovalidateMode.onUserInteraction,
                                            validator: (value) {
                                              List<String> errors = [];
                                              value = (value ?? '').trim();
                                              if (value.isEmpty) {
                                                  errors.add('please enter your phone number');
                                              }if(!RegExp(r'^[0][9][0-9]{9}$').hasMatch(value)){
                                                errors.add('phone must be 11 digit');
                                              } if (errors.isNotEmpty) {
                                                return errors.join('.\n');
                                              }
                                              return null;
                                            },
                                            cursorColor: Colors.white,
                                            decoration:  InputDecoration(
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
                                  padding: const EdgeInsets.only(bottom:20),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children:<Widget> [
                                      const Padding(
                                        padding: EdgeInsets.only(right:6),
                                        child: Icon(Icons.alternate_email_outlined,color:kPrimaryColor),
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
                                              List<String> errors = [];
                                              valueE = (valueE ?? '').trim();
                                              if (valueE.isEmpty) {
                                                errors.add('please enter your email');
                                              }  if (!RegExp(r'^([a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})$').hasMatch(valueE)) {
                                                errors.add('email pattern is worng');
                                              }if (errors.isNotEmpty) {
                                                return errors.join('.\n');
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
                      Padding(
                        padding: const EdgeInsets.only(bottom:0),
                        child: Row(
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
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    List<String> errors = [];
                                    value = (value ?? '').trim();
                                    if (value.isEmpty) {
                                      errors.add('Please enter some text');
                                    } if(passwordC.contains(emailC)){
                                      errors.add('password shouldn\'t contain email');
                                      if(!RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,12}$').hasMatch(value)){
                                        errors.add('8-12 character &number &alphabet& no special character');
                                      }
                                    } if (errors.isNotEmpty) {
                                      return errors.join('.\n');
                                    }
                                    return null;
                                  },
                                  cursorColor: Colors.white,
                                  decoration:  InputDecoration(
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
                                  child: GestureDetector(
                                    onTap: (){
                                      if (firstname.currentState!.validate()&&
                                          lastname.currentState!.validate()&&
                                           phone.currentState!.validate()&&
                                          email.currentState!.validate()&&
                                          password.currentState!.validate()
                                      ) {
                                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                              sign_in_page()), (Route<dynamic> route) => false);
                                        }
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(bottom:8),
                                          padding: const EdgeInsets.symmetric(horizontal:80,vertical:10),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(24),
                                              color: kPrimaryColor
                                          ),
                                          child: Row(
                                            children: [
                                              Text("SIGN UP",
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
                                  padding: const EdgeInsets.only(bottom:5),
                                  child: Text('Don\'t have an account ?',
                                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 16,fontWeight: FontWeight.normal)
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                        sign_in_page( )), (Route<dynamic> route) => false);
                                  },
                                  child:    Padding(
                                    padding: const EdgeInsets.only(bottom:20),
                                    child: Text('SIGN IN',
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
