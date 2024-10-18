import 'package:flutter/material.dart';

class Shoppingcart extends StatefulWidget{
  @override
  _shoppingcartState createState() => _shoppingcartState();
}

class _shoppingcartState extends State<Shoppingcart>{
  @override
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      backgroundColor: const Color.fromARGB(255, 113, 41, 41),
      title: Padding(
        padding: const EdgeInsets.only(left: 70.0),
        child: Text('Shopping Cart',style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold,fontSize: 20, color: Colors.white),),
      )
    ),
  );
}
}
