import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:tic_tac_toe/pages/Homepage.dart';
class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);
  static var myNewWhiteFont=GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: Colors.white,letterSpacing: 3)
  );
  static var myNewFont=GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: Colors.black,letterSpacing: 3)
  );

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child:Padding(
                    padding: const EdgeInsets.only(top:120.0),
                    child: Container(
                      child:Text('TIC TAC TOE',style: Welcome.myNewWhiteFont.copyWith(fontSize: 30),),
                    ),
                  )
              ),
              Expanded(
                flex:2,
                  child:Container(
                    child: AvatarGlow(
                        endRadius: 180,
                      duration: Duration(seconds: 2),
                      glowColor: Colors.white,
                      repeat: true,
                      repeatPauseDuration: Duration(seconds: 1),
                      startDelay: Duration(seconds: 1),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(style: BorderStyle.none),
                            shape: BoxShape.circle),
                        child: CircleAvatar(
                          radius: 100.0,
                          backgroundColor: Colors.grey[900],
                          child: Container(
                            child: Image.asset(
                              'lib/images/tictactoelogo.png',
                              color: Colors.white,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
              ),
              SizedBox(height: 60),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                  },
                child:Padding(
                  padding: const EdgeInsets.only(left: 40,right: 40,bottom: 120),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: Colors.white,
                        padding: EdgeInsets.all(30.0),
                      child:Center(child: Text('Play Game' ,style:Welcome.myNewFont.copyWith(fontSize: 20))),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
