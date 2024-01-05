import 'package:flutter/material.dart';

void main(){
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  //const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      home: SimpleCalculator(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({super.key});

  @override
  State<SimpleCalculator> createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String _output='0';
  String currentInput='';
  double num1=0.0;
  double num2=0.0;
  double result=0.0;
  String  operator='';

  void DigitPressed(String digit){
    setState(() {
      if(currentInput=='0'|| currentInput=='Error')
      {
        currentInput=digit;
      }
      else{
        currentInput+=digit;
      }
      _output=currentInput;
    });
  }
  void OperatorPressed(String op){
    setState(() {
      if(op!='Error'){
        num1=double.parse(_output);
        currentInput='0';
        //_output=currentInput;
        operator=op;
      }
    });
  }

  void EqualsPressed(){
    // try {
    //   final expression=currentInput.replaceAll('x', '*');
    //   final parser=ExpParser();
    //   result=parser.parse(expression,operator);
    //   setState(() {
    //     _output=result.toString();
    //     currentInput=result.toString();
    //   });
    // }
    // catch (e){
    //   setState(() {
    //     _output='Error';
    //     currentInput='Error';

    //   });
    // }
    setState(() {
      num2=double.parse(_output);
      switch(operator){
        case "+":
          _output = (num1 + num2).toString();
          break;
        case "-":
          _output = (num1 - num2).toString();
          break;
        case "*":
          _output = (num1 * num2).toString();
          break;
        case "/":
          _output = (num1 / num2).toString();
          break;
        

      }
      operator='';
    });
  }

  void ClearPressed(){
    setState(() {
      currentInput='';
      result=0.0;
      _output='0';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.grey,
      title: Text(
        "CALCULATOR",
        style: TextStyle(color: Colors.black,
        fontSize: 20)
        ,),
        surfaceTintColor: Colors.white,
        ) ,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          
          Container(
            padding: EdgeInsets.all(16.0),
            height: 380,
            color: Color.fromARGB(0, 29, 29, 29),
            
            child: Align(
              alignment: Alignment.bottomRight,
            
              child: Text(
              _output,
              style: TextStyle(fontSize: 35.0,color: Colors.white),
            ),
            ),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildButton('7'),
              buildButton('8'),
              buildButton('9'),
              buildButton('/'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildButton('4'),
              buildButton('5'),
              buildButton('6'),
              buildButton('x'),

          ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               buildButton('1'),
              buildButton('2'),
              buildButton('3'),
              buildButton('-'),

          ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildButton('0'),
              buildButton('.'),
              buildButton('='),
              buildButton('+'),
            ],
            
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               buildButton('C'),],
          ),

        ],
      ),
    );
  }

  Widget buildButton(String t){
    return RawMaterialButton(
      fillColor: Colors.grey,
      highlightColor: Colors.white,
      onPressed: (){
      if(t=='='){
        EqualsPressed();
      }
      else if(t=='C'){
        
        ClearPressed();
      }
      else{
        if(t=='x'){
          t='*';
        }
        else if(t=='/'){
          t=='÷';
        }
        if(t=='+'||t=='-'||t=='/'||t=='x'||t=='*'||t=='÷'){
          OperatorPressed(t);
        }
        else{
          DigitPressed(t);
        }
          
      }
    },
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0)),
    child: Text(t,style: TextStyle(fontSize: 30),),
    );
  }
}

// class ExpParser {
//   double parse(String expression,String operator) {
    
    
//     return Function.apply((String a,String operator,String b) {
//       // int x=exp.length;
//       // String a='',b='';

//       // for(int i=0;i<x;i++){
//       //   if(exp[i]!=operator){
//       //     a+=exp[i];
//       //   }
//       //   else if(exp[i]==operator){
//       //     for(int j=i+1;j<x;j++){
//       //       b+=exp[j];
            
//       //     }
//       //     break;
//       //   }
//       // }
      
//       double numA = double.parse(a);
//       double numB = double.parse(b);
//       switch (operator) {
//         case '+':
//           return numA+numB;
//         case '-':
//           return numA - numB;
//         //case 'x':
//         case '*':
//           return numA * numB;
//         case '/':
//           return numA / numB;
//         default:
//           throw Exception('Invalid operator');
//       }

//     },expression.split(operator));
//   }
// }
