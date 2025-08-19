import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {

    

    Stream<String> getLoadingMessages (){
      final messages = <String>['Loading...', 'Please wait...', 'Fetching data...', 'Almost there...', 'Just a moment...'];
      return Stream.periodic(const Duration(milliseconds: 1200), (step) {
        return messages[step];
      }).take(messages.length);

    }

    return Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Wait a moment...'),
        const SizedBox(height: 10,),
        const CircularProgressIndicator(strokeWidth: 2,),
        const SizedBox(height: 10,),
        StreamBuilder<String>(
          stream: getLoadingMessages(),
          builder: (context, snapshot) {
            if (!snapshot.hasData ) {
              return const Text('Loading...');
            }
            return Text(snapshot.data!); 
           
          },
        ),

      ],
    ),);
  }
}