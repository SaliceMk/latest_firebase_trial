
import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latest_firebase_trial/authentication/cubit/auth_cubit.dart';
import 'package:latest_firebase_trial/authentication/pages/signup.page.dart';
import 'package:latest_firebase_trial/router/app_router.dart';


class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return 
       Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: passwdController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: ElevatedButton(
                                onPressed: ()async{
                                   var usermail=await context.read<AuthCubit>().signin(emailController.text,passwdController.text
                                   );
                                //print('ON PRESS PART');
                                context.router.push(const HomeRoute());
                                },
                                child: const Text('Login'),
                              ),
               ),
               const SizedBox(height: 5,),

               Center(
                 child: RichText(
  text: TextSpan(
    text: 'Don\'t have an account? ',
    style: const TextStyle(fontSize: 18,color: Colors.black),
    children:  <TextSpan>[
      TextSpan(text: 'Sign up', style: const TextStyle(color: Colors.red , decoration: TextDecoration.underline),
      recognizer: TapGestureRecognizer()..onTap=(){
        //print('Signup botton clicked!');
        context.router.push(SignupRoute());
        }),
      
      
    ],
  ),
),
               )

              
            ],
          ),
        ),
       );
    
  }
}
