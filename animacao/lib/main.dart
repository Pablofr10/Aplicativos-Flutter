import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
  }

  class Splash extends StatefulWidget {
    @override
    _SplashState createState() => _SplashState();
  }

  class _SplashState extends State<Splash> {

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
            child: Container(
              width: 200,
              height: 200,
              child: FlareActor('src/Engrenagens.flr', animation: "spin1",),
            ),
        ),
      );
    }

    @override
    void initState() {
      super.initState();

      Future.delayed(Duration(seconds: 5)).then((c){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=> Home())
        );
      });
    }


  }

  class Home extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('Harry Potter venha para morte',
              style: TextStyle(fontSize: 30.0),
              textAlign: TextAlign.center,
            ),
            Container(
              height: 100,
              width: 100,
              child: FlareActor('src/Coração.flr', animation: 'shape',),
            ),
          ],
        )
      );
    }
  }
