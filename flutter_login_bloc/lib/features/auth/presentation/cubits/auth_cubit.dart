import 'package:flutter_login_bloc/features/auth/domain/entities/app_user.dart';
import 'package:flutter_login_bloc/features/auth/domain/repo/auth_repo.dart';
import 'package:flutter_login_bloc/features/auth/presentation/cubits/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepository;
  AppUser? _currentUser;

  AuthCubit({required this.authRepository}) : super(AuthInitial());

  //Get Current User 
  AppUser?  get currentUser => _currentUser;

  void checkAuth() async {
    emit(AuthLoading());
    final AppUser? user = await authRepository.getCurrentUser();
    if (user != null) {
      _currentUser = user;
      emit(Authenticated(user));
    } else {
      emit(Unauthenticated());
    }


  }

  Future<void> login (String email, String password) async {

   try {
     emit (AuthLoading());
      final user = await authRepository.loginWithEmailPassword(email, password);
      if (user != null) {
        _currentUser = user;
        emit(Authenticated(user));
      } else {
        emit(Unauthenticated());
      }
   }
   catch (e) {
    emit(AuthError(e.toString()));
    emit(Unauthenticated());
   }

  }

  Future<void> register (String name,String email, String password) async {
   try {
     emit (AuthLoading());
      final user = await authRepository.registerWithEmailPassword(name, email, password);
      if (user != null) {
        _currentUser = user;
        emit(Authenticated(user));
      } else {
        emit(Unauthenticated());
      }
   }
   catch (e) {
    emit(AuthError(e.toString()));
    emit(Unauthenticated());
   }
  }

  Future<void> logout () async {
    
      emit(AuthLoading());
      await authRepository.logOut();
      _currentUser = null;
      emit(Unauthenticated());
 
  }

 Future<String> forgotPassword(String email) async {
    try {
      final message = await authRepository.sendPasswordResetEmail(email);
      return message;
    } catch (e) {
     
      return e.toString();
    }
  }

  Future<void> deleteAccount() async {
    try {
      emit(AuthLoading());
      await authRepository.deleteAccount();
      _currentUser = null;
      emit(Unauthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(Unauthenticated());
    }
  }
}