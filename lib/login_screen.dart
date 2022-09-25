import 'dart:convert';
import 'dart:developer';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import 'package:weekpro/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool loading = false;
  var formkey = GlobalKey<FormState>();

  // bool isVisible = true;

  login(email, password) async {
    setState(() {
      loading = true;
    });

    try {
      final response = await http.post(
        Uri.parse("http://adeegmarket.zamindarestate.com/api/v1/login"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': "$email",
          'password': "$password",
        }),
      );
      // print(response.statusCode);

      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);

        var bodyResponse = body['status'];
        debugPrint('bodyResponse: $bodyResponse');

        log("Body Response: $bodyResponse");

        if (bodyResponse == 200) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SignupScreen()));
        } else {
          log("Your Email password is wrong please try again later");
        }
      } else {
        print("Internal Server Error!");
      }
      setState(() {
        loading = false;
      });

      // print(response.body);
    } catch (e) {
      debugPrint('e: $e');
      log("Internal Server Error!");
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    // alignment: Alignment.center,
                    height: 150,
                    width: 150,

                    decoration: BoxDecoration(
                        // color: Colors.blue,
                        shape: BoxShape.circle,
                        //   color: Colors.green,

                        image: DecorationImage(
                          image: AssetImage('assets/images/logo.png'),
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Container(
                      alignment: Alignment.center,
                      // color: Colors.blueAccent,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Welcome Back",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Log In to Continue",
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Form(
                    key: formkey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 30,
                          ),
                          child: TextFormField(
                            controller: emailController,
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required"),
                              EmailValidator(
                                  errorText: "Enter a valid email address")
                            ]),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            style: TextStyle(color: Colors.black),
                            decoration: inputDecoration(
                                labelText: "Email",
                                icon: const Icon(
                                  Icons.email_outlined,
                                  color: Color(0xffEF873D),
                                ),
                                hintText: "haseeb@gmail.com"),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 30,
                          ),
                          child: TextFormField(
                            controller: passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password is Required";
                              } else if (value.length <= 5) {
                                return "Password should be greater than 6 latter";
                              }
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            style: TextStyle(color: Colors.black),
                            // obscureText: isVisible,
                            decoration: inputDecoration(
                              isPassword: true,
                              // showPassword: true,
                              labelText: 'Password',
                              hintText: "",
                              icon: const Icon(
                                Icons.lock_outline,
                                color: Color(0xffEF873D),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: TextButton(
                            onPressed: () {},
                            child: Container(
                              child: Text(
                                "Forgot password?",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        loading == true
                            ? Lottie.asset(
                                height: 100,
                                width: 100,
                                'assets/json/customloader.json')
                            : SizedBox(
                                height: 57,
                                width: 250,
                                child: ElevatedButton(
                                    onPressed: () {
                                      // print('Clicked');
                                      if (formkey.currentState!.validate()) {
                                        print("Validation Okay");
                                        print('Email: ${emailController.text}');
                                        print(
                                            'Password: ${passwordController.text}');
                                      } else {
                                        print("Not Validate");
                                      }
                                      login(emailController.text,
                                          passwordController.text);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: Color(0xffEF873D),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12))),
                                    child: Text(
                                      "Log In",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Create an Account",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration inputDecoration({
    required String labelText,
    required Widget icon,
    bool isPassword = false,
    bool showPassword = false,
    // required bool isEmail,
    required String hintText,
  }) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.black12,
      labelText: labelText,
      hintText: hintText,
      labelStyle: TextStyle(
        color: Colors.black,
      ),
      icon: icon,
      suffixIcon: Visibility(
        visible: isPassword,
        child: showPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
                child: Icon(Icons.visibility))
            : GestureDetector(
                onTap: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
                child: Icon(Icons.visibility_off)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(
          color: Color(0xffEF873D),
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(
          color: Colors.blue,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(
          color: Colors.red,
          width: 2,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(
          color: Colors.redAccent,
          width: 2,
        ),
      ),
    );
  }
}
