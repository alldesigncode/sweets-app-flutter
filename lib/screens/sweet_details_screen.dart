import 'package:flutter/material.dart';
import '../widgets/HexColor.dart';

class SweetDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (ctx, constraint) => Column(
            children: <Widget>[
              SizedBox(
                height: mediaQuery.padding.top,
              ),
              Container(
                padding: EdgeInsets.all(8),
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          args['imageUrl'],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: constraint.maxWidth * 0.6,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 20, left: 15),
                          child: Icon(Icons.arrow_back_ios, size: 21.0),
                        ),
                      ),
                      Positioned(
                        right: 20,
                        top: 15,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.location_city,
                            color: Colors.black45,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black26,
                          ),
                          child: Text(
                            'Sweet',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          args['title'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontSize: 35,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                        color: HexColor('#f7ce74'),
                      ),
                      padding: EdgeInsets.all(25),
                      child: Text(
                        '\$${args['price']}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  args['desc'],
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black38,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Nutritional',
                      style: TextStyle(
                        color: HexColor('#ec827e'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: HexColor('#ec827e'),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CircleAvatar(
                            backgroundColor: HexColor('#fccbc9'),
                            child: Icon(
                              Icons.favorite,
                              size: 20,
                              color: HexColor('#ec827e'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Card(
                color: HexColor('#f4f4f4'),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Container(
                  height: 194,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(25),
                            child: Row(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundColor: HexColor('#ec827e'),
                                  child: Text(
                                    'S',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Text('M',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500)),
                                SizedBox(width: 15),
                                Text('L',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(25),
                            child: Row(
                              children: <Widget>[
                                CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.black54,
                                    )),
                                SizedBox(width: 15),
                                Text('01',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500)),
                                SizedBox(width: 15),
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(40),
                        decoration: BoxDecoration(
                            color: HexColor('#3a2754'),
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.shopping_basket,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Add to bag.',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
