import 'package:flutter/material.dart';
import 'package:grocery_app/product_info_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      routes: {'/productInfo': (context) => ProductInfoScreen()},
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, color: Colors.black),
        ),
        title: Container(
          width: 50,
          height: 50,
          child: Image.asset('assets/images/logo.png'),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.black),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart, color: Colors.black),
              ),
              Positioned(
                top: 0,
                right: 3,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                  child: Center(
                    child: Text(
                      '2',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
      body: Container(
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(6, createItem),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 6 / 10, // 0.6
        ),
      ),
    );
  }

  Container createItem(int id) {
    List<String> itemNames = [
      'Spinach',
      'Avacado',
      'Sweet Corn',
      'Kiwi',
      'Orange',
      'Apple'
    ];
    List<double> itemPrice = [1.22, 3.62, 4.92, 8.30, 3.5, 4.2];
    List<String> itemQuantity = [
      '1 lbs',
      'each',
      'each',
      '3 Nos',
      '3 Nos',
      '2 Nos'
    ];
    var newNum = id + 1;
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: InkWell(
        onTap: () {
          openProductInfo(newNum, itemPrice[id].toString(),
              itemNames[id].toString(), itemQuantity[id].toString());
        },
        child: Column(
          children: [
            Hero(
              tag: 'img$newNum',
              child: Container(
                height: 150,
                child: Image.asset('assets/images/img$newNum.png'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(
                '\$' + itemPrice[id].toString(),
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 2),
              child: Text(
                itemNames[id].toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 2),
              child: Text(
                itemQuantity[id],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 5),
                height: 0.5,
                color: Colors.grey),
            SizedBox(height: 7),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 5),
                  child:
                      Icon(Icons.shopping_cart, size: 20, color: Colors.green),
                ),
                Text(
                  'Add to cart',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 19,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void openProductInfo(int id, String price, String name, String quantity) {
    Navigator.pushNamed(context, '/productInfo', arguments: {
      'img': 'img$id',
      'name': name,
      'quantity': quantity,
      'price': price
    });
  }
}
