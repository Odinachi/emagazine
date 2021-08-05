import 'dart:ui';

import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  int index;
  DetailScreen({required this.index});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    bool _boolIndex = false;

    void rightSlideEffect() {
      setState(
        () {
          print(_boolIndex);

          if (widget.index == 1) {
            widget.index = 2;
          } else if (widget.index == 2) {
            widget.index == 1;
          }
        },
      );
    }

    void leftSlideEffect() {
      setState(
        () {
          print(_boolIndex);
          if (widget.index == 2) {
            widget.index = 1;
          } else if (widget.index == 1) {
            widget.index == 2;
          }
        },
      );
    }

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/pic${widget.index}.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 50, sigmaY: 10),
          child: SafeArea(
            child: Stack(children: [
              GestureDetector(
                onPanUpdate: (details) {
                  if (details.delta.dx > 0) {
                    setState(() {
                      _boolIndex = !_boolIndex;

                      rightSlideEffect();
                      print(widget.index);
                    });
                  }

                  // Swiping in left direction.
                  if (details.delta.dx < 0) {
                    setState(() {
                      _boolIndex = !_boolIndex;

                      leftSlideEffect();
                      print(widget.index);
                    });
                  }
                },
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 80.0),
                        child: Image.asset(
                          'images/pic${widget.index}.jpg',
                          height: 150,
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 38.0),
                            child: _boolIndex
                                ? Text(
                                    '30th July',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 24),
                                  )
                                : Text(
                                    '23th May',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 24),
                                  ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.remove,
                                size: 85,
                                color: _boolIndex ? Colors.grey : Colors.white,
                              ),
                              Icon(Icons.remove,
                                  size: 85,
                                  color:
                                      _boolIndex ? Colors.white : Colors.grey),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.30,
                minChildSize: 0.3,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Stack(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          children: [
                            Container(
                                color: Colors.black,
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                  child: Text(
                                    _boolIndex ? '03' : '26',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 180),
                                  ),
                                )),
                            Container(
                                color: Colors.black,
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Text(
                                    'ON THE PLASTENCITY',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 50),
                                  ),
                                )),
                            Container(
                              color: Colors.black,
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Text(
                                  'What is Lorem Ipsum? \n Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Why do we use it?It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\nWhere does it come from?\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.\nWhere can I get some?\nThere are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        left: 290,
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Container(
                                color: Colors.black,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.black,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.archive_rounded,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ))
                  ]);
                },
              )
            ]),
          ),
        ),
      ),
    );
  }
}
