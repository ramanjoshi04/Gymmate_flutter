import 'package:ai_rdio/Utils/Constant.dart';
import 'package:ai_rdio/Utils/snackBar.dart';
import 'package:ai_rdio/navbar/main_page.dart';
import 'package:ai_rdio/screen/home_page2.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class authAervices {
  //SignUp
  void signUp({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('${Constant.url}/api/signup'),
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
      // ignore: use_build_context_synchronously
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            successSnackBar(context,
                'Account created Successfully,please login with same credential');
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //Login
  void login(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      http.Response res = await http.post(
        Uri.parse('${Constant.url}/api/login'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );

      // ignore: use_build_context_synchronously
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const MainPage()),
                (route) => false);
            successSnackBar(context, 'login Sucessfully');
            final prefs = await SharedPreferences.getInstance();
            prefs.setString('Verified', jsonDecode(res.body)['verified']);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
