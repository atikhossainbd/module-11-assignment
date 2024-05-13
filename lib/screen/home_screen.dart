import 'package:flutter/material.dart';
import 'package:my_bag/helper/custom_dialog.dart';
import 'package:my_bag/helper/increase_decrease_widget.dart';
import 'package:my_bag/model/item.dart';
import 'package:my_bag/util/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Item> listItem = [
    Item(
        title: "Pullover",
        image_url: "assets/images/img_pullover.png",
        color: "Black",
        size: "L",
        price: 51,
        quantity: 1),
    Item(
        title: "T-Shirt",
        image_url: "assets/images/img_t_hirt.png",
        color: "Gray",
        size: "L",
        price: 30,
        quantity: 1),
    Item(
        title: "Sport Dress",
        image_url: "assets/images/img_sport_dress_2.png",
        color: "Black",
        size: "M",
        price: 43,
        quantity: 1),
  ];

  double screenWidth = 0.0;
  double screenHeight = 0.0;

  // screen size
  double screen331 = 350.0;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _appBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "My Bag",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: _listView(listItem),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Amount:',
                        style: TextStyle(color: Colors.black38),
                      ),
                      Text(
                        "${getTotalPrice(listItem)} \$",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        mySnackBar("Payment Process", context);
                      },
                      child: Text("CHECK OUT",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

/*  Widget _listView(List<Item> listItem) {
    return ListView.builder(
      itemCount: listItem.length,
      itemBuilder: (context, index) {
        return SizedBox(
          child: Card(
            color: Colors.white,
            surfaceTintColor: Colors.white,
            elevation: 6.0,
            shadowColor: Colors.grey.withOpacity(0.2),
            margin: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10)),
                    child: Image.asset(
                      listItem[index].image_url!,
                      width: screenWidth <= screen331 ? 60 : 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            listItem[index].title!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth <= screen331 ? 14 : 18,
                            ),
                          ),
                          subtitle: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: "Color: ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenWidth <= screen331 ? 12 : 18,
                                ),
                              ),
                              TextSpan(
                                text: listItem[index].color!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: screenWidth <= screen331 ? 12 : 18,
                                ),
                              ),
                              WidgetSpan(
                                child: SizedBox(
                                  width: 10.0,
                                ),
                              ),
                              TextSpan(
                                text: "Size: ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenWidth <= screen331 ? 12 : 18,
                                ),
                              ),
                              TextSpan(
                                text: listItem[index].size!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: screenWidth <= screen331 ? 12 : 18,
                                ),
                              ),
                            ]),
                          ),
                          trailing: Icon(Icons.more_vert),
                          contentPadding: EdgeInsets.only(left: 13, right: 0),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 13, right: 13),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IncreaseDecreaseButtons(
                                value: listItem[index].quantity!,
                                onValueChanged: (values) {
                                  updateQuantity(index, values);
                                  if (values == 5) {
                                    MyCustomDialog.showCongratulationsDialog(
                                        context,
                                        listItem[index].title!,
                                        values.toString());
                                  }
                                  setState(() {});
                                },
                              ),
                              Text(
                                "${listItem[index].price.toString()}\$",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenWidth <= screen331 ? 14 : 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }*/


  Widget _listView(List<Item> listItem) {
    return ListView.builder(
      itemCount: listItem.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: screenWidth <= 760 ? 145 : 200,
          child: Card(
            color: Colors.white,
            surfaceTintColor: Colors.white,
            elevation: 6.0,
            shadowColor: Colors.grey.withOpacity(0.2),
            margin: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10)),
                    child: Image.asset(
                      listItem[index].image_url!,
                      width: screenWidth <= screen331 ? 70 : 70,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            listItem[index].title!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth <= screen331 ? 13 : 14,
                            ),
                          ),
                          subtitle: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: "Color: ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenWidth <= screen331 ? 12 : 14,
                                ),
                              ),
                              TextSpan(
                                text: listItem[index].color!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: screenWidth <= screen331 ? 12 : 14,
                                ),
                              ),
                              WidgetSpan(
                                child: SizedBox(
                                  width: 10.0,
                                ),
                              ),
                              TextSpan(
                                text: "Size: ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenWidth <= screen331 ? 12 : 14,
                                ),
                              ),
                              TextSpan(
                                text: listItem[index].size!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: screenWidth <= screen331 ? 12 : 14,
                                ),
                              ),
                            ]),
                          ),
                          trailing: Icon(Icons.more_vert),
                          contentPadding: EdgeInsets.only(left: 13, right: 0),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 13, right: 13),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IncreaseDecreaseButtons(
                                value: listItem[index].quantity!,
                                onValueChanged: (values) {
                                  updateQuantity(index, values);
                                  if (values == 5) {
                                    MyCustomDialog.showCongratulationsDialog(
                                        context,
                                        listItem[index].title!,
                                        values.toString());
                                  }
                                  setState(() {});
                                },
                              ),
                              Text(
                                "${listItem[index].price.toString()}\$",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenWidth <= screen331 ? 14 : 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }



  // App Bar
  AppBar _appBar() {
    return AppBar(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
      ],
    );
  } // AppBar end here ============

  void updateQuantity(int position, int newQuantity) {
    if (position >= 0 && position < listItem.length) {
      listItem[position].quantity = newQuantity;
    } else {
      print("Invalid position!");
    }
  }

  mySnackBar(message, context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  int getTotalPrice(List<Item> items) {
    int totalPrice = 0;
    for (Item item in items) {
      totalPrice += item.price! * item.quantity!;
    }
    return totalPrice;
  }
}
