import 'package:flutter/material.dart';

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> with TickerProviderStateMixin {

  AnimationController animationController1;
  Animation<Offset> _animationOffset1;

  AnimationController animationController2;
  Animation<Offset> _animationOffset2;

  AnimationController animationController3;
  Animation<Offset> _animationOffset3;


  @override
  void initState() {
    super.initState();
    animationController1 = AnimationController(vsync: this,duration: Duration(milliseconds: 900));
    _animationOffset1 = Tween<Offset>(begin: Offset(4.0,0), end: Offset(0.0, 0.0)).animate(
        CurvedAnimation(
            parent: animationController1,
          curve: Curves.ease
        ));

    animationController2 = AnimationController(vsync: this,duration: Duration(milliseconds: 1000));
    _animationOffset2 = Tween<Offset>(begin: Offset(5.0,0), end: Offset(0.0, 0.0)).animate(
        CurvedAnimation(
            parent: animationController2,
            curve: Curves.ease
        ));

    animationController3 = AnimationController(vsync: this,duration: Duration(milliseconds: 900));
    _animationOffset3 = Tween<Offset>(begin: Offset(1.0,0), end: Offset(0.0, 0.0)).animate(
        CurvedAnimation(
            parent: animationController3,
            curve: Curves.ease
        ));
  }
  @override
  Widget build(BuildContext context) {
    animationController1.forward();
    animationController2.forward();
    animationController3.forward();

    return SafeArea(
        child: Column(
      children: [
        SizedBox(height: 40),
        SlideTransition(
          position: _animationOffset3,
          child: Container(
            child: Image.network(
                "https://global-uploads.webflow.com/5bcb5ee81fb2091a2ec550c7/5ec376cc49f524997ab3639d_peach-thumbnail-800px.png",
                height: 300,
                width: 300),
          ),
        ),
        SlideTransition(
          position: _animationOffset2,
          child: Opacity(
            opacity: 0.5,
            child: Padding(
                padding: EdgeInsets.all(20),
                child: Text("Lorem ipsum lorem ipsum loem somrthing",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6)),
          ),
        ),
        SlideTransition(
          position: _animationOffset1,
          child: Opacity(
            opacity: 0.5,
            child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Something that is the title to do something ipsunm jijjjee ipsume lorem pum",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1,
                )),
          ),
        )
      ],
    ));
  }
}
