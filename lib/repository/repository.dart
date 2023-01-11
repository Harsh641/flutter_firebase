import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../models/userData.dart';

Future<users> login_user(String email, String password, context) async{

  var data;
  try{
    Response response = await post(
        Uri.parse('https://jexmovers.com/secured/restaurants/public/api/newlogin'),
        body: {
          'email' : email,
          'password' : password
        }
    );
    data = jsonDecode(response.body.toString());
    var d = data['data'];
    var dt = d['code'];

    if(dt == 401){
      print("Failed!!!!");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Sorry, Login Failed!!!")));
    }
    else {
      print('Login Successfully');
      print(data);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Login Successfull!!!")));
    }
  }
  catch(e){
    e.toString();
  }
  return data;
}