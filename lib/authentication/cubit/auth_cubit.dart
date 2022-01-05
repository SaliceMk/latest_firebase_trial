import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';


part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
 final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthCubit() : super(const AuthState());

   Future<String?> signin(String email,String passwd) async {
    
     try {
  UserCredential userCredential = 
  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: passwd,
  );
  var umail=userCredential.user?.email;
  print('Success $umail');
  return userCredential.user?.email;
  } on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
    
    
  }

  Future<void> signup(String email,String password) async{
    
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      print('Successfull signup!');
      //emit(const FirebaseAuthState(status: UserStatus.loaded));
    }catch(e){
      print('ERROR while signing up!');
      print(e);
      //emit(const AuthState(status: UserStatus.error));

      //emit(const FirebaseAuthState(status: UserStatus.error));
    }

    
  }
}
