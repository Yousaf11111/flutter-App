import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreen();
}

class _SignupScreen extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  // bool isVisible = true;
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
                                "Create an account",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Start a healthy journey with us",
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
                            controller: nameController,
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required"),
                            ]),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            style: TextStyle(color: Colors.black),
                            decoration: inputDecoration(
                                labelText: "Name",
                                icon: const Icon(
                                  Icons.account_circle_outlined,
                                  color: Color(0xffEF873D),
                                ),
                                hintText: ""),
                          ),
                        ),
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
                              } else if (value.length <= 6) {
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
                        SizedBox(
                          height: 57,
                          width: 250,
                          child: ElevatedButton(
                              onPressed: () {
                                // print('Clicked');
                                if (formkey.currentState!.validate()) {
                                  print("Validation Okay");
                                  print('Name: ${nameController.text}');
                                  print('Email: ${emailController.text}');
                                  print('Password: ${passwordController.text}');
                                } else {
                                  print("Not Validate");
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xffEF873D),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12))),
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Log in",
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
