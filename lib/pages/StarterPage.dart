import 'package:flutter/material.dart';
import 'package:flutter_project3/pages/HomePage.dart';

class Starterpage extends StatefulWidget{
  @override
  _StarterPageState createState() => _StarterPageState();
}

class _StarterPageState extends State<Starterpage> with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage('assets/images/home.jpg'),
          fit: BoxFit.cover,
        ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              colors:[
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.7),
                Colors.black.withOpacity(.2),
                 ]
            )
          ),
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text('Taking Orders For Delivery',style: TextStyle(fontStyle: FontStyle.italic,color: const Color.fromARGB(255, 216, 208, 208),fontSize: 40, fontWeight: FontWeight.bold)),

                SizedBox(
                  height: 20,
                ),

                Text('Favourite Places Nearby',style: TextStyle(fontStyle: FontStyle.italic,color: const Color.fromARGB(255, 201, 194, 194),fontSize: 20,)),
                 
                 SizedBox(
                  height: 30,
                ),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        const Color.fromARGB(255, 83, 11, 11),
                        const Color.fromARGB(255, 144, 85, 85),
                        const Color.fromARGB(255, 139, 81, 81),
                      ]
                      )
                  ),
                  child: MaterialButton(
                    onPressed: (){
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=> Homepage()),
                  );
                  },
                    minWidth: double.infinity,
                    child: Text('GET STARTED', style: TextStyle(fontStyle: FontStyle.italic ,fontSize: 15, color: const Color.fromARGB(255, 201, 194, 194))),
                  ),
                ),
                  SizedBox(
                    height: 15,
                    ),
                    Align(
                      child: Text('Available 24/7 For you',style: TextStyle(fontStyle: FontStyle.italic,color: const Color.fromARGB(255, 201, 194, 194),fontSize: 15),)
                    ),

                    SizedBox(
                      height: 10,
                    )
                
              ],
            ),
          ),
        ),
      )
    );
  }
}