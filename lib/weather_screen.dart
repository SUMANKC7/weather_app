import 'dart:ui';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28.3,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){},
           icon: const Icon(Icons.refresh),
           highlightColor: const Color.fromARGB(255, 128, 224, 250),
           ),
           
        ],
      ),
      
      body:  Padding(
        padding:const EdgeInsets.all(20.0),
        child:  Column(
             children: [
        //main card
             SizedBox(
        width: double.infinity,
         child: Card(
          elevation: 9,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(19),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  
                  children: [
                    Text("300.67°F",style: TextStyle(
                        fontSize: 32,
                    ),
                    ),
                   
                    Icon(Icons.cloud,size: 74,),
                    Text("Rain",style: TextStyle( fontSize: 20,),
                    ),
                      
                  ],
                       
                ),
              ),
            ),
          ),
         ),
             ),
        
        const SizedBox(height: 20,),
       const Align(
        alignment: Alignment.centerLeft,
          child:  Text("Weather Forcast",
          style:TextStyle(
            fontSize: 29,
          fontWeight: FontWeight.bold ,
          ) ,
          ),
        ),
         const SizedBox(height: 20,),
             //Weather forcast
       const Placeholder(
         fallbackHeight: 150,
        ),
        
        //Additional Information
        const SizedBox(height: 40,),
       const  Placeholder(
        fallbackHeight: 150,
        ),
        
             ],
        ),
      ) ,
    );
  }
}
