import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyCarouselSlider(),
    );
  }
}

class MyCarouselSlider extends StatefulWidget {
  @override
  _MyCarouselSliderState createState() => _MyCarouselSliderState();
}

class _MyCarouselSliderState extends State<MyCarouselSlider> {
  int _currentIndex = 0;
  List<Color> _borderColors = List.generate(5, (index) => Colors.blue);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel Slider with Border Color'),
      ),
      body: CarouselSlider(
        options: CarouselOptions(
          height: 200.0,
          initialPage: 0,
          enableInfiniteScroll: false,
          onPageChanged: (index, reason) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        items: List.generate(5, (index) {
          return GestureDetector(
            onTap: () {
              // Handle onTap event (change border color)
              setState(() {
                // Reset all border colors to default
                _borderColors = List.generate(5, (index) => Colors.blue);
                // Change border color of the tapped item
                _borderColors[index] = Colors.red;
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: _borderColors[index],
                  width: 2.0,
                ),
              ),
              child: Center(
                child: Text(
                  'Item $index',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
