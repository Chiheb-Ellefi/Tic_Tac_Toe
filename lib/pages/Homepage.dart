import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> displayXO=['','','','','','','','',''];
  String XO='';
  bool o=true;
  int filledBoxes=0;
  String message='';
  static var myNewFont=GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: Colors.black,letterSpacing: 3)
  );
  static var myNewWhiteFont=GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: Colors.white,letterSpacing: 3,fontSize: 15)
  );
  void _tapped(int index){
    setState(() {
      XO=o? 'X' :'O';
      if(displayXO[index]==''){
        displayXO[index]=XO;
        filledBoxes++;
        o=!o;
      }
      _checkWinner(index);
    });
  }
  void _checkWinner(int index){
    //check rows
    if (displayXO[0]==displayXO[1] && displayXO[1]==displayXO[2] && displayXO[0]!=''){
      _showWinDialog(index);
    }
    if (displayXO[3]==displayXO[4] && displayXO[4]==displayXO[5] && displayXO[3]!=''){
      _showWinDialog(index);
    }
    if (displayXO[6]==displayXO[7] && displayXO[7]==displayXO[8] && displayXO[6]!=''){
      _showWinDialog(index);
    }
    //check columns
    if (displayXO[0]==displayXO[3] && displayXO[3]==displayXO[6] && displayXO[0]!=''){
      _showWinDialog(index);
    }
    if (displayXO[1]==displayXO[4] && displayXO[4]==displayXO[7] && displayXO[1]!=''){
      _showWinDialog(index);
    }
    if (displayXO[2]==displayXO[5] && displayXO[5]==displayXO[8] && displayXO[2]!=''){
      _showWinDialog(index);
    }
    //check diagnols
    if (displayXO[0]==displayXO[4] && displayXO[4]==displayXO[8] && displayXO[0]!=''){
      _showWinDialog(index);
    }
    if (displayXO[2]==displayXO[4] && displayXO[4]==displayXO[6] && displayXO[2]!=''){
      _showWinDialog(index);
    }
    else if (filledBoxes == 9 ){
      _showDrawDialog();
    }
  }
  void _showDrawDialog(){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context){
          return   AlertDialog(
            title:const  Text('Draw'),
            actions: [
              ElevatedButton(onPressed:(){
                _clearBoard();
                Navigator.of(context).pop();
              }
                  , child:const  Text('Start again!')),
            ],
          );

        });
  }
  void _showWinDialog(int index){
    oscore=(displayXO[index]=='O')?oscore+1:oscore;
    xscore=(displayXO[index]=='X') ?xscore+1:xscore;
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context){
          return   AlertDialog(
            title: Text('WINNER is ${displayXO[index]}'),
            actions: [
              ElevatedButton(onPressed:(){
                _clearBoard();
                Navigator.of(context).pop();
              }
                  , child: Text('Start again!')),
            ],
          );

        });
  }
  void _clearBoard(){
    setState(() {
      displayXO= List.filled(9, '');
    });
    filledBoxes=0;
  }

  int oscore=0;
  int xscore=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Player X ', style:  myNewWhiteFont,),
                        const SizedBox(height: 20),
                        Text('$xscore', style:  myNewWhiteFont,),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Player O', style:  myNewWhiteFont,),
                        const SizedBox(height: 20),
                        Text('$oscore ', style:  myNewWhiteFont,),
                      ],
                    ),
                  ),
                ],
              )
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemBuilder: (BuildContext context,int index){
                  return GestureDetector(
                    onTap:(){
                      _tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade700)),
                      child: Center(
                        child: Text(
                          displayXO[index],
                          style: const TextStyle(fontSize: 40.0,color: Colors.white),

                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
              child: Container(
                child:  Column(
                  children: [
                    Text('TIC TAC TOE',style: myNewWhiteFont,),
                    const SizedBox(height: 60,),
                    Text('@CreatedByChiheb',style: myNewWhiteFont,),
                  ],

                ),
              ))
        ],
      ),
    );
  }
}
