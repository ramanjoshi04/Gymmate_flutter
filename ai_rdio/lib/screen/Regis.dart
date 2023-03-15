import 'package:ai_rdio/Services/Authsevices.dart';
import 'package:ai_rdio/components/InputBox.dart';
import 'package:ai_rdio/components/customButton.dart';
import 'package:flutter/material.dart';

class regis extends StatefulWidget {
  const regis({super.key});

  @override
  State<regis> createState() => _regisState();
}

class _regisState extends State<regis> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  authAervices Authservice = authAervices();

  void register() {
    Authservice.signUp(
        context: context,
        name: usernameController.text,
        email: emailController.text,
        password: passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 179, 252),
      body: Stack(
        children: [
          // Positioned(
          //   bottom: MediaQuery.of(context).viewInsets.bottom,
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(top: 50)),
                // ignore: prefer_const_constructors
                Text(
                  'Register as a GymMate',
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 0.8,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Image.asset('assets/images/Regis.png'),
                InputBox(
                  icon: Icons.person,
                  hint: 'Username',
                  controller: usernameController,
                  hide: false,
                ),
                InputBox(
                  icon: Icons.mail,
                  hint: 'Email',
                  controller: emailController,
                  hide: false,
                ),
                InputBox(
                    icon: Icons.lock,
                    hint: 'Password',
                    hide: true,
                    controller: passwordController),
                SizedBox(height: 15),
                customButton(
                  text: 'REGISTER',
                  onpressed: () {
                    register();
                  },
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
