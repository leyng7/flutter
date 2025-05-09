import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _DDAY(),
            Expanded(child: _CoupleImage()),
          ],
        ),
      )
    );
  }

}

class _DDAY extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        const SizedBox(height: 16.0),
        Text('U&I', style: textTheme.displayLarge),
        const SizedBox(height: 16.0),
        Text('우리 처음 만난 날', style: textTheme.bodyLarge),
        Text('2011. 11. 23.', style: textTheme.bodyMedium),
        const SizedBox(height: 16.0),
        IconButton(
            iconSize: 60.0,
            onPressed: () {},
            icon: Icon(
              Icons.favorite,
              color: Colors.red
            )),
        const SizedBox(height: 16.0),
        Text('D+365', style: textTheme.displayMedium)
      ],
    );
  }

}

class _CoupleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/middle_image.png'
      )
    );
  }

}
