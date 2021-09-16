import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner:false,
home: SimpleCalculator(),
    )


  );
}





class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({ Key? key }) : super(key: key);

  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
String question = "";
String answer="";
  @override
  Widget build(BuildContext context) {
    TextStyle questionAnswerStyle = TextStyle(color:Color( 0xff526f9f));
    return Scaffold(
      body:Container(
        padding:EdgeInsets.all(30),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[
            Container(
              //////////////
              padding: EdgeInsets.only(top:40,bottom: 20),
              child:Column(
                crossAxisAlignment:CrossAxisAlignment.end,

children: [
  Text(question,style:questionAnswerStyle.copyWith(
    fontSize:30,color:Colors.white,
  )),
  SizedBox(height: 10,),
 Text(answer), 

],
              )
            ),
          Row(
            
            mainAxisAlignment:MainAxisAlignment.end,
            children:[
            calculatorkeys(keyNumber:"CLR", onpress: (){
              setState(() {
                answer="";
                question="";
              });
            })
          ]),
          
            

            Expanded(child:Container(
              
              child:Column(
                children: [
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                    children: [
                    calculatorkeys(keyNumber: "7",onpress:() {
                      setState(() {
                        question+="7";
                      });
                    }),
                    calculatorkeys(keyNumber: "8",onpress: (){
                      setState(() {
                        question+="8";
                      });
                    }),
                    calculatorkeys(keyNumber:"9",onpress:(){
                      setState(() {
                        question+="9";
                      });
                    }
                    
                    
                    
                    
                    
                    
                    ),
                    calculatorSignKeys(keySign: "+")
                  ],),
                  Row(
                     mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                     children: [
                    calculatorkeys(keyNumber:"4",onpress: (){
                      setState(() {
                        question+="4";
                      });
                    } ),
                    calculatorkeys(keyNumber: "5",onpress: (){
                      setState(() {
                       question+="5";
                      
                      });
                    }),
                    calculatorkeys(keyNumber: "6",onpress: (){
                      setState(() {
                      question+="6";  
                      });
                    }),
                    calculatorSignKeys(keySign:"x",onpress: (){
                      setState(() {
                        question+="x";
                        
                      });
                    } ),
                  ],),
                  Row(
                     mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                    children: [
                    calculatorkeys(keyNumber: "1",onpress: (){
                      setState(() {
                        question+="1";
                      });
                    }),
                    calculatorkeys(keyNumber:"2",onpress:(){
                      setState(() {
                       question+="2";
                      });
                    }  ),
                    calculatorkeys(keyNumber: "3",onpress:(){
                      setState(() {
                        question+="3";
                      });
                  

                    }),
                    calculatorSignKeys(keySign: "-",onpress:(){
                    setState(() {
                      question+="-";
                    });

                    } ),
                  ],),
                  Row(
                     mainAxisAlignment:MainAxisAlignment.spaceBetween ,children: [
                    calculatorkeys(keyNumber: "0",onpress: (){
                      setState(() {
                        question+="0";
                      });
                    }),
                    calculatorkeys(keyNumber: ".",onpress:(){
                     setState(() {
                       question+=".";
                     }); 
                    }),
                    calculatorkeys(keyNumber: "=",onpress: (){
                      setState(() {
                     calculatorResults();
                        
                      });
                    }),
                    calculatorSignKeys(keySign:"/",onpress: (){
                      setState(() {
                        question+="/";
                      });
                    }),
                  ],),




                ],

              ),
      ))
            
          ]
        ),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color (0xff1A2640),
          Color (0xff0D1625)
        ]
      )
    )

      ),
    );
  }

calculatorkeys({keyNumber,onpress}){
  return
GestureDetector(
  onTap:onpress,
   child: Container(
    margin:EdgeInsets.symmetric(vertical:10),
 
      height:75,
      width:75,
      child:Center(child:Text(keyNumber,style:TextStyle(color:Colors.white,fontSize:20),)),
      decoration:BoxDecoration(
        borderRadius:BorderRadius.circular(20),
        color: keyNumber== "=" ? Color(0xff219595):Color(0xff219595),
      ),
    ),
 );
}


calculatorSignKeys({keySign,onpress}){
  return
  GestureDetector(
    onTap: onpress,
    child: Container(
    margin:EdgeInsets.symmetric(vertical:10),
      height:75,
      width:75,
      child:Center(child:Text(keySign,style:TextStyle(color:Colors.white,fontSize:20),)),
      decoration:BoxDecoration(
        color:Color(0xff2968c7),
        borderRadius: BorderRadius.circular(50)
      )
    ),
  );
}
void calculatorResults(){
  String FinalUserInput = question;
  FinalUserInput = question.replaceAll("x", "*");
Parser p =Parser();
Expression exp =p. parse(FinalUserInput);
ContextModel cm= ContextModel();
double results = exp.evaluate(EvaluationType.REAL,cm);
answer =results.toString();

}




 

}
