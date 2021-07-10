import 'package:flutter/material.dart';
import 'package:foodmenu/controller/api_controller.dart';
import 'package:get/get.dart';

SafeArea buildDiscover({required Size size}) {
  return SafeArea(
    child: CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          elevation: 0.0,
          pinned: false,
          snap: false,
          floating: false,
          expandedHeight: 280.0,
          backgroundColor: Colors.transparent,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            background: Container(
              margin: const EdgeInsets.only(bottom: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                color: Colors.transparent,
                image: DecorationImage(image: AssetImage('assets/home_page_bg.jpg'), fit: BoxFit.fill),
              ),
              child: Container(
                decoration: BoxDecoration(
                    // gradient: LinearGradient(
                    //   colors: [Colors.black.withOpacity(0.15), Colors.black.withOpacity(0.8)],
                    //   stops: [0.4, 0.9],
                    //   begin: Alignment.topCenter,
                    //   end: Alignment.bottomCenter,
                    // ),
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
                GetBuilder<ApiController>(
                  builder: (controller) => Container(
                    height: 230,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.restaurantList.length,
                      itemBuilder: (context, index) => buildcard(
                        size: size,
                        title: controller.restaurantList[index].restaurantName.capitalize,
                        desc: controller.restaurantList[index].restaurantId.toString(),
                        imageUrl: controller.restaurantList[index].restaurantImage.toString(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text('Popular right now', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0)),
                ),
                SizedBox(height: size.height * 0.02),
                GetBuilder<ApiController>(
                  builder: (controller) => Container(
                    height: 230,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.foodsList.length,
                      itemBuilder: (context, index) => Padding(
                        padding: index == 0 ? const EdgeInsets.only(left: 20.0) : const EdgeInsets.only(left: 5.0),
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
                                  Text(controller.foodsList[index].foodName.capitalize.toString(),
                                      style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w600)),
                                  SizedBox(height: size.height * 0.01),
                                  Text(controller.foodsList[index].foodPrice, style: TextStyle(color: Colors.grey)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text('Popular right now', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0)),
                ),
                SizedBox(height: size.height * 0.02),
                GetBuilder<ApiController>(
                  builder: (controller) => Container(
                    height: 230,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.foodsList.length,
                      itemBuilder: (context, index) => Padding(
                        padding: index == 0 ? const EdgeInsets.only(left: 20.0) : const EdgeInsets.only(left: 5.0),
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
                                  Text(controller.foodsList[index].foodDescription.capitalize.toString(),
                                      style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w600)),
                                  SizedBox(height: size.height * 0.01),
                                  Text(controller.foodsList[index].foodPrice, style: TextStyle(color: Colors.grey)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

buildcard({String? title, String? desc, Size? size, required String? imageUrl}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(20.0),
            image: DecorationImage(image: NetworkImage(imageUrl!), fit: BoxFit.fill),
          ),
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
