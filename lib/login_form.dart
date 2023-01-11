import 'package:flutter_firebase/view/restraurantView.dart';
import 'package:flutter_firebase/view/view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email, String password) async{
    try{
      Response response = await post(
        Uri.parse('https://jexmovers.com/secured/restaurants/public/api/newlogin'),
        body: {
          'email' : email,
          'password' : password
        }
      );
      var data = jsonDecode(response.body.toString());
      var d = data['data'];
      var dt = d['code'];

      if(dt == 401){
        print("Failed!!!!");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Sorry, Login Failed!!!")));
      }
      else {
        if(emailController.text.isEmpty){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Please Enter the credentials!!!")));
        }
        else{
          print('Login Successfully');
          print(data);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Login Successfull!!!")));
        }
      }
    }
    catch(e){
      e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      // home: res_view(data: [],),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: 'Email'
              ),
            ),
            SizedBox(height: 20.0,),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: 'Password'
              ),
            ),
            SizedBox(height: 20.0,),
            ElevatedButton(
                onPressed: (){
                  login(emailController.text.toString(), passwordController.text.toString());
                  // _controller?.login(emailController.text.toString(), passwordController.text.toString());
                },
                child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Text('Login'),)
                )
            ),
          ],
        ),
      ),
    );
  }
}

