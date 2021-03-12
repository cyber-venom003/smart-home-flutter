import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

class UserId {
  const UserId({@required this.uid , @required this.email , @required this.profilePicURL , @required this.isLoggedIn});
  final String uid;
  final String email;
  final String profilePicURL;
  final bool isLoggedIn;
}

class AuthService {
  final _authServices = FirebaseAuth.instance;

  UserId _userFromFirebase(User user){
    return user == null ? null : UserId(email: user.email , uid: user.uid , profilePicURL: user.photoURL , isLoggedIn: true);
  }

  UserCredential userCred;

  Future<UserId> signInGoogle() async {
    try{
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount account = await googleSignIn.signIn();
      if (account == null){
        return null;
      }
      else{
        userCred = await _authServices.signInWithCredential(GoogleAuthProvider.credential(idToken: (await account.authentication).idToken, accessToken: (await account.authentication).accessToken));
        if(userCred.user == null){
          return null;
        }
        else{
          return _userFromFirebase(userCred.user);
        }
      }
    }
    catch(error){
      print(error);
      return null;
    }
  }

  void signOutUser() {
    _authServices.signOut();
  }
}