import 'package:carousel_slider/carousel_slider.dart';
import 'package:emagazine/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    List cardList = [
      Item1(),
      Item2(),
    ];

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: const FractionalOffset(0.0, 1.5),
            end: const FractionalOffset(0.0, 0.0),
            stops: [0.4, 1.0],
            colors: [Colors.white60, Colors.black],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.pink,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 150),
                        child: Text(
                          'Megaz',
                          style: TextStyle(color: Colors.white, fontSize: 35),
                        ),
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.remove_from_queue_rounded,
                            size: 20,
                            color: Colors.white,
                          ),
                          Text(
                            'Logout',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: 48,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 18.0,
                      right: 18.0,
                      top: 10,
                    ),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.1),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(48.0),
                  child: CarouselSlider(
                    items: cardList.map((card) {
                      return Builder(builder: (BuildContext context) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.9,
                          // width: MediaQuery.of(context).size.width,
                          child: Card(
                            child: card,
                          ),
                        );
                      });
                    }).toList(),
                    options: CarouselOptions(
                      initialPage: 1,
                      enlargeCenterPage: true,
                      aspectRatio: 1,
                      viewportFraction: 0.6,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      height: 270,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 150.0, left: 20),
                      child: Text(
                        'All Magazines',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.arrow_right_alt_rounded,
                          size: 18,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('images/pic1.jpg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('images/pic1.jpg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('images/pic1.jpg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Image.asset('images/pic1.jpg'),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Item1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        (context),
        MaterialPageRoute(
          builder: (ontext) => DetailScreen(index: 1),
        ),
      ),
      child: Container(
        height: 70,
        child: Image.asset('images/pic1.jpg'),
      ),
    );
  }
}

class Item2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        (context),
        MaterialPageRoute(
          builder: (ontext) => DetailScreen(index: 2),
        ),
      ),
      child: Container(
        height: 70,
        child: Image.asset('images/pic2.jpg'),
      ),
    );
  }
}

class Item3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        (context),
        MaterialPageRoute(
          builder: (ontext) => DetailScreen(index: 2),
        ),
      ),
      child: Container(
        height: 70,
        child: Image.asset('images/pics.jpg'),
      ),
    );
  }
}
