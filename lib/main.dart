import 'package:flutter/material.dart';

void main()
{
  runApp( Ripple_Animation_App() );
}

class Ripple_Animation_App extends StatelessWidget
{
  @override
  Widget build(BuildContext buildContext)
  {
    return MaterialApp(
        title: "Ripple Animation App",
        color: Colors.purple,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
        ),
        home: RippleAnimationApp(),
    );
  }
}

class RippleAnimationApp extends StatefulWidget
{
  @override
  State<RippleAnimationApp> createState() => RippleAnimationAppState();
}

class RippleAnimationAppState extends State<RippleAnimationApp> with SingleTickerProviderStateMixin
{
  late AnimationController animationController;
  late Animation animation;
  var circleRadiusList = [ 50.0, 100.0, 150.0, 200.0, 250.0, 300.0, 350.0, 400.0, 450.0, 500.0, 550.0, 600.0 ];

  @override
  void initState()
  {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration( seconds: 5 ));
    animation = Tween( begin: 0.0, end: 1.0 ).animate( animationController );

    animationController.addListener(() {
      setState((){});
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext buildContext)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      primary: true,
      appBar: AppBar(
        primary: true,
        backgroundColor: Colors.indigo,
        title: Text("Ripple Animation App", style: TextStyle( fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white ),),
        centerTitle: true,
        elevation: 8,
        titleSpacing: 8,
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: circleRadiusList.map((circleRadius) => Container(
            width: circleRadius * animationController.value,
            height: circleRadius * animationController.value,
            decoration: BoxDecoration(
              //color: Colors.indigo.withOpacity(1 - animationController.value),
              shape: BoxShape.circle,
               gradient: LinearGradient(
                 colors: [ Colors.lightBlue.withOpacity(1-animationController.value), Colors.indigo.withOpacity(1-animationController.value) ],
               ),
            ),
            child: Icon(Icons.call, color: Colors.white, size: 35,),
          )).toList(),
        ),
      ),
    );
  }
}