import 'package:flutter/material.dart';
import 'package:flutter_project3/pages/shoppingcart.dart';

class Homepage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Homepage>{
   String selectedCategory = 'ASIAN';

  // Food items categorized
  final Map<String, List<Map<String, String>>> foodItems = {
    'ASIAN': [
      {'name': 'Biryani', 'price': '300 Rs/-', 'image': 'assets/images/biryani.jpg'},
      {'name': 'Karahi', 'price': '1000 Rs/-', 'image': 'assets/images/karahi.jpg'},
      {'name': 'Pulao', 'price': '250 Rs/-', 'image': 'assets/images/pulao.jpg'},
    ],
    'CHINESE': [
      {'name': 'Noodles', 'price': '400 Rs/-', 'image': 'assets/images/momos.jpg'},
      {'name': 'Egg Fried Rice', 'price': '350 Rs/-', 'image': 'assets/images/chineserice.jpg'},
      {'name': 'Chicken Manchurian', 'price': '350 Rs/-', 'image': 'assets/images/manchurian.jpg'},
    ],
    'DESSERTS': [
      {'name': 'Gulab Jamun', 'price': '150 Rs/-', 'image': 'assets/images/gulabjamun.jpg'},
      {'name': 'Cinnamon Roll', 'price': '200 Rs/-', 'image': 'assets/images/cinnamonrolls.jpg'},
      {'name': 'Cheese Cake', 'price': '200 Rs/-', 'image': 'assets/images/cheesecake.jpg'},

    ],
    'SMOOTHIES': [
      {'name': 'Mango Smoothie', 'price': '180 Rs/-', 'image': 'assets/images/milkshake.jpg'},
      {'name': 'Mint Margarita', 'price': '200 Rs/-', 'image': 'assets/images/mintmargarita.jpg'},
      {'name': 'Pina Colada', 'price': '200 Rs/-', 'image': 'assets/images/pinacolada.jpg'},

    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 113, 41, 41),
        title: Padding(
          padding: const EdgeInsets.only(left: 60.0),
          child: Text('Food Items', style: TextStyle(fontStyle: FontStyle.italic,fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),),
        ),
        leading: Icon(null),
        actions: <Widget>[
          IconButton(
            onPressed: (){
               Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=> Shoppingcart()),
               );
            },
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
                  SizedBox(
                    height: 15,
                  ), 
                  Container(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        makecategory(isactive: selectedCategory == 'ASIAN', title: 'ASIAN'),
                        makecategory(isactive: selectedCategory == 'CHINESE', title: 'CHINESE'),
                        makecategory(isactive: selectedCategory == 'DESSERTS', title: 'DESSERTS'),
                        makecategory(isactive: selectedCategory == 'SMOOTHIES', title: 'SMOOTHIES'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    ),
                ],
              )
              ),
               Expanded(
                 child : Padding(
                    padding:EdgeInsets.symmetric(horizontal: 20.0),
                    child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: foodItems[selectedCategory]!.map((item) {
                        return makeItem(
                                 images: item['image']!,
                                 price: item['price']!,
                                 name: item['name']!,
                          );
                        }).toList(),
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
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = title;
        });
      },
    child: AspectRatio(
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
                      Text(price, style: TextStyle(fontStyle: FontStyle.italic ,fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),),
                      SizedBox(
                        height: 5,
                      ),
                      Text(name, style: TextStyle(fontStyle: FontStyle.italic ,fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
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