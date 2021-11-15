import 'package:flutter/material.dart';
import 'package:fumbaa/src/app/main/home/pages/home.page.dart';
import 'package:fumbaa/src/meta/meta.dart';

class OffersPage extends StatefulWidget {
  const OffersPage({Key? key}) : super(key: key);

  @override
  _OffersPageState createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {
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
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView.builder(
            itemCount: products!.length,
            itemBuilder: (context, index) {
              return OffersWidget(model: products![index]);
            }),
      ),
      appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
          title: headerTitle("Offers")),
    );
  }
}

class OffersWidget extends StatelessWidget {
  final ProductModel model;
  const OffersWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        child: Container(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                                  height: 70,
                                  width: 100,
                                  child: Image.network(
                                    model.image,
                                  ))),
                          Expanded(
                              flex: 2,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(model.name,
                                        style: TextStyle(
                                            fontFamily: AppFonts.Medium,
                                            fontSize: 16)),
                                    Container(height: 5),
                                    Container(
                                        height: 20,
                                        width: 55,
                                        decoration: BoxDecoration(
                                            color: AppColors.lightColor,
                                            borderRadius:
                                                BorderRadius.circular(24)),
                                        child: Center(
                                          child: Text(model.type,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12)),
                                        )),
                                    Container(height: 5),
                                    Text("UGX ${model.price}",
                                        style: TextStyle(
                                            fontFamily: AppFonts.Medium)),
                                  ]))
                        ],
                      ),
                    ),
                    Container(height: 10),
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(),
                            child: new Bouncing(
                              onPress: () {},
                              child: new Container(
                                height: 30.0,
                                decoration: new BoxDecoration(
                                    color: AppColors.lightColor,
                                    borderRadius: new BorderRadius.all(
                                        Radius.circular(24.0))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: new Center(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.timer,
                                          size: 22,
                                        ),
                                        Container(width: 5),
                                        new Text(
                                          'Schedule',
                                          style: new TextStyle(
                                              color: Colors.black,
                                              fontSize: 14.0,
                                              fontFamily: AppFonts.Medium),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )),
                        Container(width: 10),
                        Padding(
                            padding: const EdgeInsets.only(),
                            child: new Bouncing(
                              onPress: () {},
                              child: new Container(
                                height: 30.0,
                                decoration: new BoxDecoration(
                                    color: AppColors.mainColor,
                                    borderRadius: new BorderRadius.all(
                                        Radius.circular(24.0))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
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
                              ),
                            )),
                      ],
                    )
                  ],
                ))));
  }
}
