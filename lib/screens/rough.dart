

import 'package:flutter/material.dart';

import 'home.dart';
class Rough extends StatefulWidget {
  @override
  _RoughState createState() => _RoughState();
}

class _RoughState extends State<Rough> {
  @override
  Widget build(BuildContext context) {
     


 

    
    return Stack(
      children: [
        Stack(
                  children:[
Container(
            
              child: Image.asset("asset/images/home_open.png",
               width: MediaQuery.of(context).size.width,
                 height: MediaQuery.of(context).size.height,
             fit: BoxFit.cover,
                          ),
                        
                      ),
                  Positioned(
                    top:55,
                    left:15,

                    child:Icon(Icons.arrow_back_outlined)

                 
                    
                  
                    ),
                  
                  
                  
                  
            
                  Positioned(
                    top:55,
                    right:15,

                  child: Icon(Icons.favorite_border),
                  
                  
                  
                  
                  ),


                  ]
        ),
        
      Positioned(
 

  top:400,
  child: Card(
    elevation: 8.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
topLeft:Radius.circular(16),

topRight: Radius.circular(25)

      ),
    ),
    child: Container(
     height: MediaQuery.of(context).size.height*.7,
     width: MediaQuery.of(context).size.width,
      child:Column(children: [
  Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:
                              [
                                Text("Chair",style: TextStyle(
                                 fontSize: 20,
                                 fontWeight: FontWeight.bold
           
           
                                ),),
                                 Text("\$200",style: TextStyle(
                                 fontSize: 20,
                                 fontWeight: FontWeight.bold
                                 
           
                                ),
                                ),
           
           
                              ]
                    ),
                          ),
           Container(
             margin: EdgeInsets.only(top:30,left:16,right:16),
            decoration: BoxDecoration( boxShadow: [
                           BoxShadow(
                             color: Colors.grey.withOpacity(.2),
                             spreadRadius: 2,
                             blurRadius: 5,
                           ),
                          
                         ],
                         color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                         ),
             
             padding: const EdgeInsets.only(top:26.0,left: 16,right: 16),
             child:   Row(
             
               
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children:[
             
                 Container(
             
             child: 
             
             Column(
            
               children: [
             
             Image.asset("asset/images/group.png"),
             
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text("24*19*18"),
             )
             
             
             
             ],)
             
                 ),
                   Container(
             
             child: 
             
             Column(
            
               children: [
             
             Image.asset("asset/images/palm.png"),
             
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text("Palm"),
             )
             
             
             
             ],)
             
                 ),
                   Container(
             
             child: 
             
             Column(
            
               children: [
             
             Image.asset("asset/images/flag.png"),
             
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text("Indonesia"),
             )
             
             
             
             ],)
             
                 ),
                   Container(
             
             child: 
             
             Column(
            
               children: [
             
             Image.asset("asset/images/badge.png"),
             
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text("5 years"),
             )
             
             
             
             ],)
             
                 )
             
               ]
             
             
             
             ),
           ),
           Container(
             padding: EdgeInsets.only(top:20,left: 35,right: 25),
             
             child: Text("An armchair has armrests fixed to the seat a recliner is upholstered and under its seat\n is a mechanism that \nallows one to lower the chair's back ",
           
             style: TextStyle(fontSize: 16),
             
             )),
           Padding(
                        padding: EdgeInsets.only(top:40,left: 35,right: 25,bottom: 10),
                             child: Container(
                               height: 55,
                               child: RaisedButton(
onPressed: () {
  Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
}, 
                child: Container(
                  width: double.infinity,

                    
                  
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left:80.0),
                     child: Text(' Add to Cart ',
                     style: TextStyle(
                       fontSize:20,
                       fontWeight: FontWeight.bold,
                     
                     ),
                     
                     ),
                   ),
                   Icon(Icons.shopping_cart_outlined),


                 ],
               )), 
                color: Colors.green,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(12.0),
                  ),

                               )
                             ),
                           ),




      ],)
      
          
     
      ),
    ),
  ),




      ],
      
    );
  }
}