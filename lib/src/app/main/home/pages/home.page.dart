import 'dart:core';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fumbaa/src/meta/meta.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductModel>? products;

  List<Map<String, dynamic>> productData = [
    {
      "name": "Total Gas 12KG",
      "image":
          "https://www.pngall.com/wp-content/uploads/4/Gas-Cylinder-PNG.png",
      "price": 30000,
      "type": "Refill"
    },
    {
      "name": "Shell Gas 3KG",
      "image":
          "https://www.kindpng.com/picc/m/759-7592857_gas-cylinder-head-png-transparent-png.png",
      "price": 30000,
      "type": "Refill"
    },
    {
      "name": "Stabex Gas 2KG",
      "image":
          "https://p.kindpng.com/picc/s/329-3292685_hp-gas-cylinder-png-transparent-png.png",
      "price": 30000,
      "type": "Refill"
    },
    {
      "name": "Controller Gas 15KG",
      "image":
          "https://p.kindpng.com/picc/s/553-5538474_gas-cylinder-png-pic-bottle-transparent-png.png",
      "price": 30000,
      "type": "Refill"
    },
    {
      "name": "Total Gas 12KG",
      "image":
          "https://www.pngall.com/wp-content/uploads/4/Gas-Cylinder-PNG.png",
      "price": 30000,
      "type": "Refill"
    },
    {
      "name": "Shell Gas 3KG",
      "image":
          "https://www.kindpng.com/picc/m/759-7592857_gas-cylinder-head-png-transparent-png.png",
      "price": 30000,
      "type": "Refill"
    },
    {
      "name": "Stabex Gas 2KG",
      "image":
          "https://p.kindpng.com/picc/s/329-3292685_hp-gas-cylinder-png-transparent-png.png",
      "price": 30000,
      "type": "Refill"
    },
    {
      "name": "Controller Gas 15KG",
      "image":
          "https://p.kindpng.com/picc/s/553-5538474_gas-cylinder-png-pic-bottle-transparent-png.png",
      "price": 30000,
      "type": "Refill"
    }
  ];

  List<String> names = ["Refill Gas", "New Kit", "Accessories", "Food & More"];
  List<String> controllerImages = [
    "https://www.pngall.com/wp-content/uploads/4/Gas-Cylinder-PNG.png",
    "https://p.kindpng.com/picc/s/553-5538474_gas-cylinder-png-pic-bottle-transparent-png.png",
    "https://image.similarpng.com/very-thumbnail/2020/05/Set-stainless-steel-dishware---kitchen-utensils-PNG.png",
    "https://png.pngtree.com/png-clipart/20190115/ourmid/pngtree-healthy-food-png-image_314874.jpg"
  ];

  @override
  void initState() {
    setData();
    super.initState();
  }

  void setData() {
    List<ProductModel> controller = [];

    productData.forEach((element) {
      controller.add(ProductModel.fromJson(element));
    });

    products = controller;
  }

  List<Color> gottenColors = [Colors.yellow, Colors.blue, Colors.orange];

  List<String> carouselImages = [
    "https://images.pexels.com/photos/277253/pexels-photo-277253.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/6248546/pexels-photo-6248546.jpeg",
    "https://images.pexels.com/photos/6248797/pexels-photo-6248797.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  ];
  int currentPage = 0;

  dynamic changeCurrentPage(int index, _) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(height: 10),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            child: CarouselSlider.builder(
                itemCount: 3,
                itemBuilder: (context, index, _) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(carouselImages[index],
                                fit: BoxFit.cover))),
                  );
                },
                options: CarouselOptions(
                    enlargeCenterPage: true,
                    onPageChanged: changeCurrentPage,
                    enableInfiniteScroll: false,
                    viewportFraction: 1)),
          ),
          Container(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSmoothIndicator(
                  effect: ScrollingDotsEffect(
                      activeDotColor: AppColors.mainColor, dotHeight: 3),
                  activeIndex: currentPage,
                  count: 3),
            ],
          ),
          Container(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
                height: 130,
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        //   crossAxisSpacing: 10,
                        mainAxisExtent: 130 / 2.2,
                        //    mainAxisSpacing: 10,
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return ClipRRect(
                          child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Row(
                          children: [
                            Container(
                                width: 50,
                                height: 130 / 4,
                                child: Image.network(controllerImages[index])),
                            Text(names[index],
                                style: TextStyle(
                                    fontFamily: AppFonts.Medium,
                                    fontSize: 14.5,
                                    color: Colors.black)),
                          ],
                        ),
                      ));
                    })),
          ),
          Container(height: 10),
          headerTitle("Trending"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
                child: GridView.builder(
                    itemCount: products!.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 240, crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return TrendingWidget(model: products![index]);
                    })),
          )
        ]),
      )),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.backgroundColor,
          centerTitle: true,
          title: Image.asset(AppImages.appLogo, height: 80)),
    );
  }
}

Widget headerTitle(String name, {EdgeInsetsGeometry? padding}) {
  return Padding(
    padding: padding ?? const EdgeInsets.only(left: 20.0),
    child: Text(name,
        style: TextStyle(
            fontFamily: AppFonts.Medium,
            fontSize: 17,
            color: AppColors.textColor)),
  );
}

class TrendingWidget extends StatelessWidget {
  final ProductModel model;
  const TrendingWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final putComma = addCommas();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
          elevation: 1,
          borderRadius: BorderRadius.circular(7),
          // decoration: BoxDecoration(
          //   color: Colors.white,
          //   borderRadius: BorderRadius.circular(7),
          // ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  height: 100,
                  child: Image.network(model.image, fit: BoxFit.cover)),
            ]),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(model.name,
                  style: TextStyle(fontFamily: AppFonts.Medium, fontSize: 15)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Container(
                  height: 15,
                  width: 50,
                  decoration: BoxDecoration(
                      color: AppColors.lightColor,
                      borderRadius: BorderRadius.circular(24)),
                  child: Center(
                    child: Text(model.type,
                        style: TextStyle(color: Colors.black, fontSize: 11)),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 3),
              child: Text("UGX ${putComma(model.price)}"),
            ),
            Container(height: 5),
            Padding(
                padding: const EdgeInsets.only(right: 25.0, left: 15),
                child: new Bouncing(
                  onPress: () {},
                  child: new Container(
                    height: 30.0,
                    decoration: new BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius:
                            new BorderRadius.all(Radius.circular(24.0))),
                    child: new Center(
                      child: new Text(
                        'Order Now',
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontFamily: AppFonts.Medium),
                      ),
                    ),
                  ),
                )),
            Container(height: 10),
          ])),
    );
  }
}
