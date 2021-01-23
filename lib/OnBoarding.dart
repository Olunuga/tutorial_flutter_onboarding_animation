import 'package:flutter/material.dart';
import 'package:flutter_anim/AppPage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final _pageController = PageController();
  final pageCount = 3;
  var isLastPage = false;


  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if(_pageController.page > 1.0){
        setState(() {
          isLastPage = true;
        });
      }else{
        setState(() {
          isLastPage = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
              itemCount: pageCount,
              controller: _pageController,
              itemBuilder: (context, index) {
                return AppPage();
              }),
          Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                  child: SmoothPageIndicator(
                      controller: _pageController,
                      count: pageCount,
                    effect: WormEffect(
                      dotColor: Colors.black12,
                      activeDotColor: Colors.teal,
                      dotHeight: 10,
                      dotWidth: 10
                    ),
                  ))),
          AnimatedPositioned(
            duration: Duration(milliseconds: 800),
            curve: Curves.ease,
            bottom: isLastPage? 20 : -50,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.circular(25)
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: Text("Get Started", style: Theme.of(context).textTheme.button.copyWith(color: Colors.white)),
                ),
              )
          )
        ],
      ),
    );
  }
}
