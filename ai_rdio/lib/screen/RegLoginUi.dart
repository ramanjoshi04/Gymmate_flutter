import 'package:ai_rdio/Services/Authsevices.dart';
import 'package:ai_rdio/screen/Regis.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../components/InputBox.dart';
import '../components/customButton.dart';

class RegLoginUi extends StatefulWidget {
  @override
  State<RegLoginUi> createState() => _RegLoginUiState();
}

class _RegLoginUiState extends State<RegLoginUi> {
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double viewInset = MediaQuery.of(context).viewInsets.bottom;
    double defaultLoginSize = size.height - (size.height * 0.2);
    double defaultRegisterSize = size.height - (size.height * 0.1);

    authAervices Authserv = authAervices();
    void logedin() {
      Authserv.login(
          context: context,
          email: emailController.text,
          password: passwordController.text);
    }

    return Scaffold(
      body: Stack(children: [
        Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Container(
              width: size.width,
              height: defaultLoginSize,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ignore: prefer_const_constructors
                  Text(
                    'Welcome GymMate',
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 0.8,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),

                  Image.asset('assets/images/Mylogin.png'),

                  InputBox(
                      icon: Icons.mail,
                      hint: 'Email',
                      hide: false,
                      controller: emailController),

                  InputBox(
                      icon: Icons.lock,
                      hint: 'Password',
                      hide: true,
                      controller: passwordController),

                  SizedBox(height: 15),

                  customButton(
                    text: 'LOGIN',
                    onpressed: () {
                      logedin();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        Regbtn(size: size)
      ]),
    );
  }
}

//---------------Register Button----------------
class Regbtn extends StatelessWidget {
  const Regbtn({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    double viewInset = MediaQuery.of(context).viewInsets.bottom;

    // return Positioned(
    // top: 0,
    // left: 0,
    // right: 0,
    // bottom: MediaQuery.of(context).viewInsets.bottom,
    return Container(
        child: viewInset == 0
            ? Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: size.height * 0.07,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 235, 179, 252),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50))),
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                        text: 'Are you not a GymMate ? ',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Register Here',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                //Reg bottomSheet
                                Get.to(() => regis(),
                                    transition: Transition.fade,
                                    duration: Duration(milliseconds: 500));
                              },
                            style: TextStyle(
                                color: Color.fromARGB(255, 67, 5, 124),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                ),
              )
            : Container());
  }
}

//------------Register UI Bottom Sheet-------------------------

