import 'package:flutter/material.dart';
import 'package:meowfacts/service.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:meowfacts/slider_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CarouselControllerImpl _pageController = CarouselControllerImpl();
  CatAPI api = CatAPI();

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
                              onPageChanged: (index, reason) {},
                            ),
                          ),
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
