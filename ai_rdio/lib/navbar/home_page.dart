// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:ai_rdio/widgets/app_large_text.dart';
import 'package:ai_rdio/widgets/app_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ai_rdio/navbar/NavBar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  var images = {
    "cable.png": "cable",
    "run-duo.png": "run-duo",
    "run.png": "run"
  };

  var inspiration = {
    'abhishek.jpeg': 'https://youtu.be/orfo8JAJ-9M',
    'nitin.jpeg': 'https://youtu.be/xMj3NwJa6iI',
    'jeetshlal.jpeg': 'https://youtu.be/uYkpTWfpFHA',
    'yatinder.jfif':
        'https://www.youtube.com/watch?v=YJRjyK3Cxlg&ab_channel=YatinderSingh',
    'mukeshh.jfif':
        'https://www.youtube.com/watch?v=v6GkCsOzEPU&ab_channel=TEDxTalks',
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      drawer: NavBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 20),
                width: 50,
                height: 20,
                decoration: BoxDecoration(
                    // color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(80),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("asset/images/logo.png"),
                    )),
              ),
            ],
          ),
          //menu text
          // Container(
          //   padding: const EdgeInsets.only(top: 70, left: 20),
          //   child: Row(
          //     children: [
          //       InkWell(
          //           onTap: () {
          //             onPressed:
          //             () {
          //               drawer:
          //               NavBar();
          //               // Navigator.push(
          //               //   context,
          //               //   MaterialPageRoute(builder: (context) => NavBar()),
          //               // );
          //             };
          //           },
          //           child: Icon(Icons.menu, size: 30, color: Colors.black54)),
          //       Expanded(child: Container()),
          //       Container(
          //         margin: const EdgeInsets.only(right: 20),
          //         width: 50,
          //         height: 40,
          //         decoration: BoxDecoration(
          //             // color: Colors.grey.withOpacity(0.5),
          //             borderRadius: BorderRadius.circular(20),
          //             image: DecorationImage(
          //               image: AssetImage("asset/images/logo.png"),
          //             )),
          //       ),
          //     ],
          //   ),
          // ),
          SizedBox(
            height: 30,
          ),
          //Discover text
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: AppLargeText(text: "Discover"),
          ),
          SizedBox(
            height: 30,
          ),

          //tab-bar
          Container(
              child: Align(
            alignment: Alignment.center,
            child: TabBar(
              labelPadding: const EdgeInsets.only(left: 30, right: 30),
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: CircleTabIndicator(color: Colors.black, radius: 4),
              tabs: [
                Tab(text: "Places"),
                Tab(text: "Inspiration"),
                Tab(text: "Emotions"),
              ],
            ),
          )),
          //dynamic-data tabbar
          Container(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            height: 300,
            width: double.infinity,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 20, top: 10),
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        // color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage("asset/images/run.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),

                //inspiration
                ListView.builder(
                    itemCount: inspiration.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () =>
                            launch(inspiration.values.elementAt(index)),
                        child: Container(
                          margin: const EdgeInsets.only(right: 20, top: 10),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            // color: Colors.white,
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://i.pinimg.com/736x/82/b1/04/82b1048cf980e5249064075570eb3a39.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    }),

                Text("Radhe-Radhe"),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),

          //Explore text
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(
                  text: "Explore",
                  size: 22,
                ),
                AppText(
                  text: "See all",
                  color: Colors.grey.withOpacity(0.9),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 20,
          ),

          //explore list
          Container(
              height: 100,
              width: double.maxFinite,
              margin: const EdgeInsets.only(
                left: 20,
              ),
              child: ListView.builder(
                  itemCount: images.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Container(
                        margin: const EdgeInsets.only(right: 30),
                        child: Column(
                          children: [
                            Container(
                              // margin: const EdgeInsets.only(right: 50),
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                // color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage("asset/images/" +
                                      images.keys.elementAt(index)),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              child: AppText(
                                text: images.values.elementAt(index),
                                color: Colors.grey.withOpacity(0.9),
                              ),
                            )
                          ],
                        ));
                  }))
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
