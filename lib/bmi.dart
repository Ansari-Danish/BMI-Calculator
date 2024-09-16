import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BmiSecreen extends StatefulWidget {
  const BmiSecreen({super.key});

  @override
  State<BmiSecreen> createState() => _BmiSecreenState();
}

class _BmiSecreenState extends State<BmiSecreen> {
 var wtController = TextEditingController();
 var ftController = TextEditingController();
 var inController = TextEditingController();
 var result = '';
var   bgcolor = Colors.amber.shade100; 

 _BmiLogic () {
  var wt = wtController.text.toString();
  var ft = ftController.text.toString();
  var inch = inController.text.toString();

  if (wt!='' && ft!='' && inch!='' ) {

    // BMI Calculation


    // Integers conversion 
    var iwt = int.parse(wt);
    var ift = int.parse(ft);
    var iinch = int.parse(inch);

    // total inchs
    var tinch = (ift * 12) + iinch ;
    // total centimetr
    var tcm = tinch * 2.54 ;

    // total meter
    var tm = tcm /100 ;

    // BMI

    var bmi = iwt / (tm*tm);

    //message 

    var msg = '';

    if (bmi > 25) {
      msg = 'You are over wieghted ' ;
      bgcolor = Colors.orange;


    } else if ( bmi< 18 )
    {
      msg = 'You are Under Weighted ';
      bgcolor = Colors.red;

    }
    else {
      msg = 'You are heathy ';
      bgcolor = Colors.green;

    }

    setState(() {
          result = ' $msg \n  BMI score ${bmi.toStringAsFixed(2)}' ;
      
    });





  }
  else {
    setState(() {
   
       result = "Please Filled the All required fields to get the BMI Calculation ";
 
      
    });
  
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        backgroundColor: Colors.amberAccent,
      ),
      body: Container(
        color: bgcolor,
        child: Center(
          child:  Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const Text("BMI", style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800
               ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: wtController ,
                decoration:const InputDecoration(
                  label:  Text("Please Enter your weight (In KG's)"),
                  prefixIcon: Icon(Icons.line_weight_rounded),
                  
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: ftController,
                decoration:const InputDecoration(
                  label: Text("Enter your Height (in Feet)"),
                  prefix: Icon(Icons.height_rounded),
            
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: inController,
                decoration: const InputDecoration(
                  label:  Text("Enter Your Height (in Inch)"),
                  prefixIcon: Icon(Icons.height)
                ),
              ),
              const SizedBox(
                height:20 ,),
        
                ElevatedButton(onPressed: _BmiLogic, child: const Text("Calculate", 
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),),),
        
              const  SizedBox(
                height: 20,
              ),
        
                 Text("Result $result",  style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}