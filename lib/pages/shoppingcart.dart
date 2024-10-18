import 'package:flutter/material.dart';

class shoppingcart extends StatefulWidget{
  final List<Map<String, String>> likedItems;

  shoppingcart({required this.likedItems});

  @override
  _shoppingcartState createState() => _shoppingcartState();
}

class _shoppingcartState extends State<shoppingcart>{
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
     body: widget.likedItems.isEmpty
          ? Center(
              child: Text("No items liked yet"),
            )
          : ListView.builder(
              itemCount: widget.likedItems.length,
              itemBuilder: (context, index) {
                final item = widget.likedItems[index];
                return ListTile(
                  leading: Image.asset(item['image']!, width: 50, height: 50),
                  title: Text(item['name']!),
                  subtitle: Text(item['price']!),
                );
              },
            ),
  );
}
}
