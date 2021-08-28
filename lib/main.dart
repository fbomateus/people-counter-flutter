import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'People Counter',
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infoPeople = 'You may come in!';

  void _changePeople(int delta) {
    setState(() {
      _people += delta;

      if (_people < 0) {
        _infoPeople = 'Inverted World?!';
      } else if (_people <= 10) {
        _infoPeople = 'You may come in!';
      } else {
        _infoPeople = 'Crowded!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'images/restaurant.jpg',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'People $_people',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextButton(
                    onPressed: () {
                      _changePeople(1);
                    },
                    child: Text('+1'),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      textStyle: TextStyle(fontSize: 40.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextButton(
                    onPressed: () {
                      _changePeople(-1);
                    },
                    child: Text('-1'),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      textStyle: TextStyle(fontSize: 40.0),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              _infoPeople,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            ),
          ],
        ),
      ],
    );
  }
}
