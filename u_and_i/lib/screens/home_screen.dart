import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var firstDay = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

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
            _DDAY(
              onHeartPressed: onHeartPressed,
              firstDay: firstDay
            ),
            Expanded(child: _CoupleImage()),
          ],
        ),
      )
    );
  }

  void onHeartPressed() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              height: 300,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: firstDay,
                maximumDate: today,
                onDateTimeChanged: (DateTime date) {
                  setState(() {
                    firstDay = date;
                  });
                },
              ),
            ),
          );
        },
        barrierDismissible: true
    );
  }
}

class _DDAY extends StatelessWidget {

  final GestureTapCallback onHeartPressed;
  final DateTime firstDay;

  const _DDAY({
    required this.onHeartPressed,
    required this.firstDay
  });

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;
    final now = DateTime.now();

    return Column(
      children: [
        const SizedBox(height: 16.0),
        Text('U&I', style: textTheme.displayLarge),
        const SizedBox(height: 16.0),
        Text('우리 처음 만난 날', style: textTheme.bodyLarge),
        Text('${firstDay.year}. ${firstDay.month}. ${firstDay.day}.', style: textTheme.bodyMedium),
        const SizedBox(height: 16.0),
        IconButton(
            iconSize: 60.0,
            onPressed: onHeartPressed,
            icon: Icon(
              Icons.favorite,
              color: Colors.red
            )),
        const SizedBox(height: 16.0),
        Text('D+${DateTime(now.year, now.month, now.day).difference(firstDay).inDays + 1}', style: textTheme.displayMedium)
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
