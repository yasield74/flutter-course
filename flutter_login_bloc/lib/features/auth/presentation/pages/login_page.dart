import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_bloc/features/auth/presentation/components/my_button.dart';
import 'package:flutter_login_bloc/features/auth/presentation/components/my_textfield.dart';
import 'package:flutter_login_bloc/features/auth/presentation/cubits/auth_cubit.dart';
class LoginPage extends StatefulWidget {
   final void Function()? togglePages;
  const LoginPage({super.key, required this.togglePages});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

 
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

   late final authCubit = context.read<AuthCubit>();



  void onForgotPassword(){
    // Handle forgot password
    showDialog(context: context, builder: (context)=> AlertDialog(
      title: Text("Forgot Password"),
      content: MyTextField(controller: emailController, hintText: "Enter email", obscureText: false),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: () async  {
          String message = await authCubit.forgotPassword(  emailController.text);
          if(message == "Password reset email sent"){
            Navigator.pop(context) ;
            emailController.clear();
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message))
          );
          },
          child: Text("Reset"),
        ),
      ],
    ));
  }

  void login(){

    //prepare info
    final String email = emailController.text;
    final String password = passwordController.text;

    //Auth Cubit
   

    //ensure fields are not empty
    if(email.isNotEmpty && password.isNotEmpty){
      authCubit.login(email, password);
   } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Please fill in all fields"))
    );
   }
   }


  @override
  Widget build(BuildContext context) {

    //Scaffold 
    return Scaffold(
 

      //Body
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: [
            //LOGO
            Icon(Icons.lock_open, size: 80, color: Theme.of(context).colorScheme.primary,),
            //NAME OF THE APP
            const SizedBox(height: 28 ,),
           Text("B U I L D   L A U N C H   M O N E T I Z E", style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.inversePrimary),),
            //EMAIL TEXT FIELD
             const SizedBox(height: 28 ,),
             MyTextField(controller: emailController,
             hintText: "Email",
             obscureText: false,),
           
          
            //PASSWORD TEXT FIELD

             const SizedBox(height: 28 ,),
             MyTextField(controller: passwordController,
             hintText: "Password",
             obscureText: true,),
          
          
            //FORGOT PASSWORD 
            const SizedBox(height: 10 ,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  child: Text("Forgot Password? ", style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),),
                  onTap: () => onForgotPassword(),
                ),
              ],
            ),

          
            //LOGIN BUTTON
            const SizedBox(height: 25 ,),
            MyButton(
              text: "LOGIN",
              onTap: () => login(),
            ),

            //OAUTH GOOGLE + APPLE 
          
          
            //DONT HAVE AN ACCOUNT
            Row(children: [
              Text("Don't have an account?", style: TextStyle(color: Theme.of(context).colorScheme.primary),),
              TextButton(
                onPressed: () {

                },
                child: GestureDetector(
                  onTap: () => widget.togglePages!(),
                  child: Text("Register now", style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),)),
              )
            ],)
          ],),
        ),
      ),
    );
  }
}