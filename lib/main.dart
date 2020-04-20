import 'package:flutter/material.dart';
import './widgets/HexColor.dart';
import './widgets/BottomNav.dart';
import './screens/sweet_details_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sweets',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: HexColor('#3a2754'),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: SweetsScreen(),
      routes: {
        '/details': (ctx) => SweetDetailsScreen(),
      },
    );
  }
}

class SweetsScreen extends StatefulWidget {
  @override
  _SweetsScreenState createState() => _SweetsScreenState();
}

class _SweetsScreenState extends State<SweetsScreen> {
  List<SweetItem> _sweets = [
    SweetItem(
      id: DateTime.now().toString(),
      title: 'Peals',
      imageUrl:
          'https://cdn.dribbble.com/users/1337301/screenshots/8633139/media/6edf6729f9e43bc5c43df2587a167f3a.png',
      price: 19,
      description: 'Special Season',
    ),
    SweetItem(
      id: DateTime.now().toString(),
      title: 'Sweet Orange',
      imageUrl:
          'https://cdn.dribbble.com/users/137192/screenshots/6521217/dribbble.jpg',
      price: 35.0,
      description: 'Special Season',
    ),
    SweetItem(
      id: DateTime.now().toString(),
      title: 'Fresh Lemons',
      imageUrl:
          'https://cdn.dribbble.com/users/1337301/screenshots/10906238/media/7d43d382665c6fffc9332a0a51648bf5.png',
      price: 22.1,
      description: 'Special Season',
    ),
  ];
  List<CategoryItem> _categories = [
    CategoryItem(
      id: DateTime.now().toString(),
      title: 'Oranges',
      imageUrl:
          'https://cdn.dribbble.com/users/146798/screenshots/11080837/media/f33535e7c9d86c34221c865984c9c023.jpg',
    ),
    CategoryItem(
      id: DateTime.now().toString(),
      title: 'Sweets',
      imageUrl:
          'https://cdn.dribbble.com/users/59100/screenshots/6607464/fruit-drops2.jpg',
    ),
    CategoryItem(
      id: DateTime.now().toString(),
      title: 'Vegetables',
      imageUrl:
          'https://cdn.dribbble.com/users/428469/screenshots/5933074/tomato_dribble.jpg',
    ),
    CategoryItem(
      id: DateTime.now().toString(),
      title: 'More Fruites',
      imageUrl:
          'https://cdn.dribbble.com/users/713533/screenshots/3510580/palta.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: mediaQuery.padding.top * 2,
            ),
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  CircleAvatar(
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 14.0,
                      color: HexColor('#3a2754'),
                    ),
                    backgroundColor: HexColor('#f4f4f4'),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                      color: HexColor('#f4f4f4'),
                      border: Border.all(color: HexColor('#f4f4f4')),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 200,
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search',
                      ),
                    ),
                  ),
                  CircleAvatar(
                    child: Icon(
                      Icons.view_module,
                      size: 14.0,
                      color: HexColor('#3a2754'),
                    ),
                    backgroundColor: HexColor('#f4f4f4'),
                  ),
                ],
              ),
            ), // SEARCH END
            SizedBox(
              height: 35,
            ),
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Best Sellers',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Dailiy Suggestion',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: HexColor('#b6b6b6'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: Icon(
                      Icons.filter_list,
                      color: HexColor('#3a2754'),
                    ),
                  )
                ],
              ),
            ), // TITLE END
            SizedBox(
              height: 15,
            ),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _sweets.length,
                itemBuilder: (ctx, i) => InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/details', arguments: {
                      'title': _sweets[i].title,
                      'desc': _sweets[i].description,
                      'imageUrl': _sweets[i].imageUrl,
                      'price': _sweets[i].price,
                    });
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    child: Stack(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          child: Image.network(
                            _sweets[i].imageUrl,
                            height: 150,
                            width: 260,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          padding: EdgeInsets.only(left: 5, top: 5),
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: FittedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  '\$${_sweets[i].price}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 5,
                          bottom: 25,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: FittedBox(
                              child: Icon(
                                Icons.favorite,
                                size: 20.0,
                                color: HexColor('#ec837f'),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 7,
                          left: 12,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                _sweets[i].title,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                _sweets[i].description,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: HexColor('#b6b6b6'),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ), // sweets end
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Trending',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                          ),
                          width: 15.0,
                          height: 15.0,
                          padding: EdgeInsets.all(1.3),
                          decoration: BoxDecoration(
                            color: HexColor('#b6b6b6'),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                          ),
                          width: 15.0,
                          height: 15.0,
                          margin: EdgeInsets.only(left: 15),
                          padding: EdgeInsets.all(1.3),
                          decoration: BoxDecoration(
                            color: HexColor('#b6b6b6'),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          child: CircleAvatar(
                            child: Padding(
                              padding: const EdgeInsets.all(3.5),
                              child: CircleAvatar(
                                backgroundColor: HexColor('#3a2754'),
                              ),
                            ),
                            backgroundColor: Colors.white,
                          ),
                          width: 15.0,
                          height: 15.0,
                          margin: EdgeInsets.only(left: 15),
                          padding: EdgeInsets.all(1.3),
                          decoration: BoxDecoration(
                            color: HexColor('#3a2754'),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                          ),
                          width: 15.0,
                          height: 15.0,
                          margin: EdgeInsets.only(left: 15),
                          padding: EdgeInsets.all(1.3),
                          decoration: BoxDecoration(
                            color: HexColor('#b6b6b6'),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, i) => Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          _categories[i].imageUrl,
                          fit: BoxFit.cover,
                          width: 120,
                          height: 200,
                        ),
                      ),
                      Positioned(
                        top: 100,
                        left: 28,
                        child: Text(
                          _categories[i].title,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.2,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                itemCount: _categories.length,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}

class SweetItem {
  final String id;
  final String imageUrl;
  final String title;
  final String description;
  final bool isFavorite;
  final double price;

  SweetItem({
    this.id,
    this.imageUrl,
    this.title,
    this.description,
    this.isFavorite,
    this.price,
  });
}

class CategoryItem {
  final String id;
  final String title;
  final String imageUrl;
  CategoryItem({this.id, this.title, this.imageUrl});
}
