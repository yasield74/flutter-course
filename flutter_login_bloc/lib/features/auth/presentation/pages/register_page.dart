import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_bloc/features/auth/presentation/components/my_button.dart';
import 'package:flutter_login_bloc/features/auth/presentation/components/my_textfield.dart';
import 'package:flutter_login_bloc/features/auth/presentation/cubits/auth_cubit.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? togglePages;
  const RegisterPage({super.key, required this.togglePages});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
 final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
   final TextEditingController confirmPasswordController = TextEditingController();


   void register(){

    //prepare info
    final String name = nameController.text;
    final String email = emailController.text;
    final String password = passwordController.text;
    final String confirmPassword = confirmPasswordController.text;

    //Auth Cubit
    final authCubit = context.read<AuthCubit>();

    //ensure fields are not empty
    if(!name.isEmpty && !email.isEmpty && !password.isEmpty && !confirmPassword.isEmpty){
      if(password == confirmPassword){
        authCubit.register(name, email, password);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Passwords do not match"))
        );
      }

   } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Please fill in all fields"))
    );
   }
   }


   @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
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
           Text("Let's create an account for you", style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.inversePrimary),),


              //NAME TEXT FIELD
             const SizedBox(height: 28 ,),
             MyTextField(controller: nameController,
             hintText: "Name",
             obscureText: false,),


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


            //REPEAT PASSWORD TEXT FIELD

             const SizedBox(height: 28 ,),
             MyTextField(controller: confirmPasswordController,
             hintText: "Confirm Password",
             obscureText: true,),
          
          
          

          
            //LOGIN BUTTON
            const SizedBox(height: 25 ,),
            MyButton(
              text: "SIGN UP",
              onTap: () => register(),
            ),

            //OAUTH GOOGLE + APPLE 
          
          
            //DONT HAVE AN ACCOUNT
            Row(children: [
              Text("Already have an account?", style: TextStyle(color: Theme.of(context).colorScheme.primary),),
              TextButton(
                onPressed: () {

                },
                child: GestureDetector(
                  onTap: () => widget.togglePages!(),
                  child: Text("Login now", style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),)),
              ) 
            ],)
          ],),
        ),
      ),
    );
  }
}