import 'package:flutter/material.dart';
import 'package:meowfacts/service.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:meowfacts/slider_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final int _pageNumber = sliderList.length;
  final CarouselControllerImpl _pageController = CarouselControllerImpl();
  // int _currentPage = 0;

  CatAPI api = CatAPI();

  // List<Widget> _buildPageIndicator() {
  //   List<Widget> list = [];
  //   for (int i = 0; i < _pageNumber; i++) {
  //     list.add(i == _currentPage ? _indicator(true) : _indicator(false));
  //   }
  //   return list;
  // }

  // Widget _indicator(bool isActive) {
  //   return AnimatedContainer(
  //     duration: Duration(milliseconds: 150),
  //     margin: EdgeInsets.symmetric(horizontal: 8.0),
  //     height: isActive ? 10 : 8,
  //     width: isActive ? 10 : 8,
  //     decoration: BoxDecoration(
  //       color: isActive ? Colors.white : Colors.grey,
  //       borderRadius: BorderRadius.all(Radius.circular(12)),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<SliderItem>>(
        future: api.facts(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Text('loading facts...');
          } else {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          CarouselSlider(
                            carouselController: _pageController,
                            items: snapshot.data,
                            options: CarouselOptions(
                              viewportFraction: 1,
                              initialPage: 0,
                              height: 100,
                              enableInfiniteScroll: true,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              onPageChanged: (index, reason) {
                                // setState(() {
                                //   index;
                                // });
                              },
                            ),
                          ),
                          // Stack(
                          //   children: [
                          //     Row(
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       children: _buildPageIndicator(),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ]),
              ),
            );
          }
        },
      ),
    );
  }
}
