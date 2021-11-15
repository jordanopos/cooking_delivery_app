import 'package:flutter/material.dart';
import 'package:fumbaa/src/app/main/home/pages/home.page.dart';
import 'package:fumbaa/src/meta/meta.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  List<String> names = ["3393X4", "44K4LL33", "OKE45443"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.backgroundColor,
            elevation: 0,
            title: headerTitle("Orders")),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView.builder(
              itemCount: names.length,
              itemBuilder: (context, index) {
                return OrderWidget(names[index]);
              }),
        ));
  }
}

class OrderWidget extends StatelessWidget {
  final String orderNumber;
  const OrderWidget(this.orderNumber);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            child: Row(children: [
              Expanded(
                  child: Icon(
                Icons.check_circle_outline_rounded,
                color: Colors.black,
                size: 30,
              )),
              Expanded(
                  flex: 4,
                  child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Order $orderNumber"),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Text("2021-09-25 14:08 |"),
                              Text(" UGX 100,000",
                                  style: TextStyle(color: Colors.green))
                            ],
                          ),
                          SizedBox(height: 4),
                          Container(
                              height: 20,
                              width: 90,
                              decoration: BoxDecoration(
                                  color: AppColors.lightColor,
                                  borderRadius: BorderRadius.circular(24)),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Text("Completed",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12)),
                                ),
                              )),
                        ]),
                  ))
            ])));
  }
}
