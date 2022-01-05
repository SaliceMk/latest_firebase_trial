import 'package:auto_route/auto_route.dart';
import 'package:latest_firebase_trial/authentication/pages/login.page.dart';
import 'package:latest_firebase_trial/authentication/pages/signup.page.dart';
import 'package:latest_firebase_trial/home/pages/home.page.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart'  ;
  
@MaterialAutoRouter(        
  replaceInRouteName: 'Page,Route',        
  routes: <AutoRoute>[        
    AutoRoute(page: LoginPage, initial: true),        
    AutoRoute(page: HomePage),
    AutoRoute(page: SignupPage),        
  ],        
)        
// extend the generated private router  
class AppRouter extends _$AppRouter{}