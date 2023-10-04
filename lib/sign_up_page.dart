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
                                  padding: const EdgeInsets.only(bottom:15,top:10),
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
                                            onChanged: (valueF){
                                              setState(() {
                                                firstNameC = valueF;
                                              });
                                            },
                                            autovalidateMode: AutovalidateMode.onUserInteraction,
                                            validator: (valueF) {
                                              if (valueF == null || valueF.isEmpty) {
                                                return 'Please enter your first name';
                                              }else if(valueF.length<3 ||valueF.length>10){
                                                return 'first name must be between 3-10 character';
                                              }else if(!RegExp(r'^[\u0600-\u06FF\s]+$').hasMatch(valueF)){
                                                return 'first name must be persian';
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
                                  padding: const EdgeInsets.only(bottom:15),
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
                                            onChanged: (value){
                                              setState(() {
                                                lastNameC = value;
                                              });
                                            },
                                            autovalidateMode: AutovalidateMode.onUserInteraction,
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'Please enter your last name';
                                              }else if(value.length<5 ||value.length>15){
                                                return 'last name must be between 5-15 character';
                                              }else if(!RegExp(r'^[\u0600-\u06FF\s]+$').hasMatch(value)){
                                                return 'last name must be persian';
                                              }else if(lastNameC.contains(firstNameC)){
                                                return 'last name shouldn\'t contain first name';
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
                                  padding: const EdgeInsets.only(bottom:15),
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
                                            onChanged: (value){
                                              setState(() {
                                                phoneC = value;
                                              });
                                            },
                                            autovalidateMode: AutovalidateMode.onUserInteraction,
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return  '';
                                              }else if(!RegExp(r'^[0][9][0-9]{9}$').hasMatch(value)){
                                                return 'phone must be 11 digit';
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
                                  padding: const EdgeInsets.only(bottom:15),
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
                                            autovalidateMode: AutovalidateMode.onUserInteraction,
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'Please enter your email';
                                              }else if(!RegExp(r'^([a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})$').hasMatch(value)){
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
                      Padding(
                        padding: const EdgeInsets.only(bottom:15 ),
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
                                  onChanged: (value){
                                    setState(() {
                                      passwordC = value;
                                    });
                                  },
                                  obscureText: passwordVisible,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }else if(!RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,12}$').hasMatch(value)){
                                      return '8-12 character &number &alphabet& no special character';
                                    }else if(
                                            (passwordC.contains(phoneC)
                                            ))
                                            {return 'last name shouldn\'t contain firstname &lastname & phone';
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
                                          margin: const EdgeInsets.only(bottom:10),
                                          padding: const EdgeInsets.symmetric(horizontal:80,vertical:13),
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
