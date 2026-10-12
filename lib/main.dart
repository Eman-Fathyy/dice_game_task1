
import 'dart:math';

import 'package:flutter/material.dart';
import 'dice.dart';

void main() {
runApp(MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({super.key});

@override
Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: false,
title: 'Play Dice',
theme: ThemeData(
colorScheme: ColorScheme.fromSeed(
seedColor: Colors.green,
brightness: Brightness.dark,
),
),
home: const DiceScreen(),
);
}
}

class DiceScreen extends StatefulWidget {
const DiceScreen({super.key});

@override
State<DiceScreen> createState() => DiceScreenState();
}

class DiceScreenState extends State<DiceScreen> {
int value1 = 1;
int value2 = 1;
int total = 2;

String imagePath = 'assets/sad.png';

void roll() {
setState(() {
value1 = Random().nextInt(6) + 1;
value2 = Random().nextInt(6) + 1;

total = value1 + value2;

if (total >= 10) {
imagePath = 'assets/happy.png';
} else {
imagePath = 'assets/sad.png';
}
});
}

void reset() {
setState(() {
value1 = 1;
value2 = 1;
total = 2;
imagePath = 'assets/sad.png';
});
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
leading: const Icon(Icons.casino),
title: const Text('Play Dice'),
centerTitle: true,
),
body: Padding(
padding: const EdgeInsets.all(20),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
Text(
'Total: $total',
style: Theme.of(context).textTheme.headlineMedium,
),

const SizedBox(height: 20),

Image.asset(
imagePath,
height: 150,
),
  Text(
    total >= 10 ? 'You Win' : 'You Lose',
    style: Theme.of(context).textTheme.headlineSmall,
  ),
const SizedBox(height: 30),

Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
children: [
Dice(value: value1),
Dice(value: value2),
],
),

const SizedBox(height: 40),

Row(
children: [
Expanded(
child: ElevatedButton(
onPressed: roll,
style: ElevatedButton.styleFrom(
backgroundColor: Colors.green,
foregroundColor: Colors.white,
),
child: const Text('Roll'),
),
),

const SizedBox(width: 20),

Expanded(
child: ElevatedButton(
onPressed: reset,
style: ElevatedButton.styleFrom(
backgroundColor: Colors.red,
foregroundColor: Colors.white,
),
child: const Text('Reset'),
),
),
],
),
],
),
),
);
}
}

