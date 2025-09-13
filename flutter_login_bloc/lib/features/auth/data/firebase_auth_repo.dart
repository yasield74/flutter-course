import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_bloc/features/auth/domain/entities/app_user.dart';
import 'package:flutter_login_bloc/features/auth/domain/repo/auth_repo.dart';

class FirebaseAuthRepo implements AuthRepo {
  final firebaseAuth = FirebaseAuth.instance;
  
  @override
  Future<void> deleteAccount() async {
    try {
        final user = firebaseAuth.currentUser;
        if(user == null) {
          throw Exception('No user is currently signed in.');
        }
        await user.delete();
        await logOut();
       
    } catch (e) {
      throw Exception('Account deletion failed: $e');
    }
  }
  
  @override
  Future<AppUser?> getCurrentUser() async {
    try {
        final user = firebaseAuth.currentUser;
        if (user == null) {
          return null;
        }
        return AppUser(uid: user.uid, email: user.email!);

    } catch (e) {
      throw Exception('Failed to get current user: $e');
    }
  }
  
  @override
  Future<void> logOut() async {
   await firebaseAuth.signOut();
  }

  @override
  Future<AppUser> registerWithEmailPassword(String name, String email, String password) async {
    try {

       UserCredential userCredential =  await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);        
        AppUser user = AppUser(
          uid: userCredential.user!.uid,
          email: userCredential.user!.email!,
        );
        return user;
      }
    catch (e) {
      throw Exception('Registration failed: $e');
    }
  }
  
  @override
  Future<String> sendPasswordResetEmail(String email) async  {
    try {
       await firebaseAuth.sendPasswordResetEmail(email: email);
       return 'Password reset email sent';
    } catch (e) {
      throw Exception('Failed to send password reset email: $e');
    }
  }
  
  @override
  Future<AppUser?> loginWithEmailPassword(String email, String password) async {
     try {
    UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
        AppUser user = AppUser(
          uid: userCredential.user!.uid,
          email: userCredential.user!.email!,
        );
        return user;

     } catch (e) {
      throw Exception(e);
  }

  }





}