import 'package:flutter/material.dart';
import '../custom_icons/custom_icons_icons.dart';
import './HexColor.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  List<NavItem> _items = [
    NavItem(
        icon: Icon(
      CustomIcons.chart_bars,
      color: HexColor('#3a2754'),
      size: 20.0,
    )),
    NavItem(
        icon: Icon(
      CustomIcons.user,
      color: HexColor('#3a2754'),
      size: 20.0,
    )),
    NavItem(
        icon: Icon(
      CustomIcons.eye_2,
      color: HexColor('#3a2754'),
      size: 20.0,
    )),
    NavItem(
        icon: Icon(
      CustomIcons.basket_alt,
      color: HexColor('#3a2754'),
      size: 20.0,
    )),
  ];

  Widget _buildItem(NavItem item, bool isSelected) {
    return Row(
      children: <Widget>[
        isSelected
            ? AnimatedContainer(
                duration: Duration(milliseconds: 300),
                child: Icon(
                  item.icon.icon,
                  size: 20.0,
                  color: isSelected ? HexColor('#3a1272') : HexColor('#3a2754'),
                ),
              )
            : item.icon
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.only(left: 20, right: 20),
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _items.map((item) {
          var itemIndex = _items.indexOf(item);
          return GestureDetector(
            child: Stack(
              children: <Widget>[
                Container(
                  width: 70,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        height: 1,
                        color: HexColor('#3a1272'),
                        width: _selectedIndex == itemIndex ? 35 : 0,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _buildItem(item, _selectedIndex == itemIndex),
                          ],
                        ),
                      ),
                      SizedBox()
                    ],
                  ),
                ),
              ],
            ),
            onTap: () {
              setState(() {
                _selectedIndex = itemIndex;
              });
            },
          );
        }).toList(),
      ),
    );
  }
}

class NavItem {
  final Icon icon;

  NavItem({this.icon});
}
