import 'package:flutter/material.dart';

class Homepage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Homepage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 113, 41, 41),
        leading: Icon(null),
        actions: <Widget>[
          IconButton(
            onPressed: (){},
             icon: Icon(Icons.food_bank_rounded, size: 35, color: const Color.fromARGB(255, 23, 20, 20),),
             )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: <Widget>[
                  Text('Food Items', style: TextStyle(fontStyle: FontStyle.italic,fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black),),
                  SizedBox(
                    height: 15,
                  ), 
                  Container(
                    height: 45,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        makecategory(isactive: true, title:'ASIAN' ),
                        makecategory(isactive: false, title:'CHINESE' ),
                        makecategory(isactive: false, title:'DESSERTS' ),
                        makecategory(isactive: false, title:'SMOOTHIES' ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    ),
                ],
              )
              ),
               Expanded(
                 child : Padding(
                      padding:EdgeInsets.symmetric(horizontal: 20.0),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          makeItem(images: 'assets/images/biryani.jpg',price: '300 Rs/-',name: 'Biryani'),
                          makeItem(images: 'assets/images/karahi.jpg', price: '1000 Rs/-',name: 'Karahi'),
                          makeItem(images: 'assets/images/pulao.jpg', price: '850 Rs/-',name: 'Pulao'),
                        ],
                      ),
                      )
               ),
               SizedBox(
                height: 40,
                )
          ],
      ))
    );
  }

  Widget makecategory ({required isactive,required title})
  {
    return AspectRatio(
      aspectRatio: isactive? 3:2.0,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: isactive? Color.fromARGB(255, 113, 41, 41): Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Align(
          child: Text(title, style:  TextStyle(fontSize: 13,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,color: isactive? Colors.white:Colors.black),),
          ),
      ),
      );
  }

  Widget makeItem ({required String images,required  String price,required  String name})
  {
    return AspectRatio(
      aspectRatio:1/1.5,
      child: GestureDetector(
          child: Container(
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
              image: AssetImage(images),
              fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                stops: [.2,.9],
                colors:[
                  Colors.black.withOpacity(.4),
                  Colors.black.withOpacity(.2),
                ] 
                ),
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Icon(Icons.favorite_rounded, color: Colors.white,),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(price, style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),),
                      SizedBox(
                        height: 5,
                      ),
                      Text(name, style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
                    ],
                  )
                ],
              ),
              ),
            ),
        ),
      ), 
      );
  }
}