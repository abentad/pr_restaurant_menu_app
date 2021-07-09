import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final cardtitles = ["Burgers", "Salads", "Noodles", "Ertib", "Chicken wings"];
  final carddescription = [
    "22 restaurants",
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: false,
              snap: false,
              floating: false,
              expandedHeight: 280.0,
              // flexibleSpace: const FlexibleSpaceBar(
              //   title: Text('sliver app bar'),
              //   // background: Image(image: image),
              //   background: ,
              // ),
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(image: AssetImage('assets/home_page_bg.jpg'), fit: BoxFit.fill),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black.withOpacity(0.15), Colors.black.withOpacity(0.8)],
                        stops: [0.4, 0.9],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverAppBar(
              pinned: true,
              snap: false,
              floating: false,
              expandedHeight: 70.0,
              backgroundColor: Colors.transparent,
              // flexibleSpace: const FlexibleSpaceBar(
              //   title: Text('centered text inside sliverappbar'),
              // ),
              shadowColor: Colors.transparent,
              flexibleSpace: Container(
                height: 70.0,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0), color: Colors.white),
                child: Row(
                  children: [
                    Icon(Icons.restaurant_menu, color: Colors.black),
                    SizedBox(width: 40.0),
                    Text('Bole inside Morning star mall', style: TextStyle(color: Colors.grey, fontSize: 18.0, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                // height: size.height,
                // width: size.width,
                decoration: BoxDecoration(color: Color(0xfff3f3f3)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * 0.035),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text('Explore Top Categories', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0)),
                    ),
                    SizedBox(height: size.height * 0.035),
                    Container(
                      height: 230,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: cardtitles.length,
                        itemBuilder: (context, index) => buildcard(size: size, title: cardtitles[index], desc: carddescription[0]),
                      ),
                    ),
                    SizedBox(height: size.height * 0.06),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text('Popular right now', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0)),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Container(
                      height: 230,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(20.0)),
                                height: size.height * 0.2,
                                width: size.width * 0.38,
                              ),
                              SizedBox(height: size.height * 0.02),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Moki', style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w600)),
                                    SizedBox(height: size.height * 0.01),
                                    Text('Japanesse-korean', style: TextStyle(color: Colors.grey)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
          BottomNavigationBarItem(icon: Icon(Icons.account_box), label: "account"),
        ],
      ),
    );
  }

  buildcard({String? title, String? desc, Size? size}) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(20.0)),
            height: size!.height * 0.2,
            width: size.width * 0.38,
          ),
          SizedBox(height: size.height * 0.02),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title!, style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w600)),
                SizedBox(height: size.height * 0.01),
                Text(desc!, style: TextStyle(color: Colors.grey)),
              ],
            ),
          )
        ],
      ),
    );
  }
}


//
            // const SliverToBoxAdapter(
            //   child: SizedBox(
            //     height: 80.0,
            //     child: Center(child: Text('centered text inside silvertoboxadabter')),
            //   ),
            // ),
            // SliverList(
            //   delegate: SliverChildBuilderDelegate(
            //     (BuildContext context, int index) {
            //       return Container(
            //         color: index.isOdd ? Colors.white : Colors.black12,
            //         height: 100.0,
            //         child: Center(
            //           child: Text('$index', textScaleFactor: 5),
            //         ),
            //       );
            //     },
            //     childCount: 20,
            //   ),
            // ),