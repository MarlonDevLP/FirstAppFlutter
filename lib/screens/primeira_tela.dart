import 'package:flutter/material.dart';

class MyFirstWidget extends StatelessWidget {
  const MyFirstWidget ({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
return Container(
  color: Colors.white,
  child: Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(color: Colors.teal, width: 100, height: 100),
          Container(color: Colors.deepOrange, width: 50, height: 50,),
      ],
    ),
      Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(color: Colors.red, width: 100, height: 100),
          Container(color: Colors.deepPurple, width: 50, height: 50,),
      ],
    ),
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      verticalDirection: VerticalDirection.up,
      children: [
        Container(color: Colors.red, width: 50, height: 50),
        Container(color: Colors.deepPurple, width: 50, height: 50,),
        Container(color: Colors.teal, width: 50, height: 50,),
      ],
  ),
      Container(
      color: Colors.yellowAccent,
      width: 380,
      height: 50,
      alignment: AlignmentDirectional.center,
      child: const Text(
        'Emulando Texts',
          style: TextStyle(color: Colors.black, fontSize: 25,
      ),
          textAlign: TextAlign.center,
    ),
),
      ElevatedButton
      (onPressed: () {
        //print('Apertou o Botton');
      },
      child: const Text('Botton'),
      ),
    ],
      ),
      );
  }
}
