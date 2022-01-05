import 'package:flutter/material.dart';
import 'package:latest_firebase_trial/authentication/cubit/auth_cubit.dart';
import 'package:provider/src/provider.dart';

class SignupPage extends StatelessWidget {
  SignupPage({ Key? key }) : super(key: key);

  final emailController=TextEditingController();
  final passwdController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
        appBar: AppBar(title: const Text('Register'),),
        body: Column(mainAxisSize: MainAxisSize.min,
          children: [
             Padding(
              padding: const EdgeInsets.all(8.0),
              child:  TextField(controller: emailController, decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Email'),),
            ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(controller: passwdController, obscureText: true, decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Password',),),
            ),
            RaisedButton(onPressed: () {
              context.read<AuthCubit>().signup(emailController.text, passwdController.text);
              // dynamic result=await _auth.signInAnon();
              // if(result==null){
              // print('Error signing in');
              
              // }
              // else{
              //   print('Signed in!');
              //   print(result);
              // }
              
            },
            child: const Text('Sign up'),),
          ],
        ),
      )
    ;
  }
}