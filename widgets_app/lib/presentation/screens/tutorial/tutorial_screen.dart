import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final slides = <SlideInfo>[
  SlideInfo(
      title: 'Find food',
      caption:
          'Aute nostrud voluptate elit occaecat nulla. Elit minim esse anim fugiat aute irure exercitation veniam fugiat. In officia irure exercitation sit nisi.',
      imageUrl: 'assets/images/1.png'),
  SlideInfo(
      title: 'Find food',
      caption:
          'Eiusmod nostrud incididunt do anim id ullamco nostrud et. Veniam esse ex irure laborum nisi laboris est cillum irure. Eu pariatur aliquip excepteur Lorem magna laborum esse tempor Lorem aliqua nisi mollit adipisicing commodo. Officia Lorem laborum ad ullamco consectetur ea do dolor cupidatat ullamco sint incididunt incididunt. Enim voluptate do nostrud elit labore nulla laborum. Incididunt labore nulla nisi enim Lorem exercitation et.',
      imageUrl: 'assets/images/2.png'),
  SlideInfo(
      title: 'Find food',
      caption:
          'Cillum veniam nisi id ad consectetur commodo consequat cillum aliqua elit amet qui. Dolore irure ad sunt ea tempor consectetur consequat qui dolore. Qui magna proident nulla non et proident dolor. Sunt sint officia culpa voluptate irure eu do ad elit ut minim. Cillum exercitation enim id sunt eiusmod eiusmod sint pariatur anim aute laboris veniam.',
      imageUrl: 'assets/images/3.png')
];

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });
}

class AppTutorialScreen extends StatelessWidget {
  static const name = '/tutorial';

  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slideData) => _Slide(
                      title: slideData.title,
                      caption: slideData.caption,
                      imageUrl: slideData.imageUrl,
                    ))
                .toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text('Exit'),
              onPressed: () => context.pop(),
            ),
          )
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  final String title;
  final String caption;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final tileStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(imageUrl),
            ),
            const SizedBox(height: 20),
            Text(title, style: tileStyle),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}
