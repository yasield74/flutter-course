import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_bloc/features/auth/data/firebase_auth_repo.dart';
import 'package:flutter_login_bloc/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:flutter_login_bloc/features/auth/presentation/cubits/auth_state.dart';
import 'package:flutter_login_bloc/features/auth/presentation/pages/auth_page.dart';
import 'package:flutter_login_bloc/features/home/presentation/pages/home_page.dart';
import 'package:flutter_login_bloc/theme/dark_mode.dart';
import 'package:flutter_login_bloc/theme/light_mode.dart';
import 'package:flutter_login_bloc/firebase_options.dart';

void main() async  { 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
   runApp( MyApp());


}

class MyApp extends StatelessWidget {

  final firebaseAuthRepo = FirebaseAuthRepo();
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(authRepository: firebaseAuthRepo)..checkAuth(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,      
        theme: lightMode,
        darkTheme: darkMode,
          home: BlocConsumer<AuthCubit, AuthState>(builder: (context, state){

            print(state);
            //unauthenticated  -> auth page (login/register)
            if(state is Unauthenticated){
              return AuthPage();
            }

            //authenticated -> home page

            if(state is Authenticated){
              return HomePage();
            } else {
              return Center(child: CircularProgressIndicator(),);
            }


            //loading

          }, listener: (context, state) { 
            if(state is AuthError){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message))
              );  
            }
           },)
      ),
    );

  }
}