import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../repository/repository.dart';
import '../controllers/login_controller.dart';
import '../login_form.dart';


class view extends StatefulWidget {
  const view({Key? key}) : super(key: key);

  @override
  _viewState createState() => _viewState();
}

class _viewState extends StateMVC<view> {

  LoginController? _controller;

  _viewState() : super(LoginController()){
    _controller = controller as LoginController;
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Api"),
      ),
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
                  // login(emailController.text.toString(), passwordController.text.toString());
                  _controller?.login(emailController.text.toString(), passwordController.text.toString());
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
