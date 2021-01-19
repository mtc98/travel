import 'package:flutter/material.dart';
import 'package:flutter_travel_ui_starter/widges/destination_carousel.dart';
import 'package:flutter_travel_ui_starter/widges/hotel_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 宣告Icon： _selectedIndex 為 state 變數
  // 四個 Icon List 
  int _selectedIndex = 0;
  int _currentTab = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking
  ];
  //

  // 建立按鈕群組 ：
  Widget _buildIcon(int index) {
    // 點擊螢幕 Icon 使其變藍色，否則為灰色 在首頁字型之下
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme.of(context).accentColor
              : Color(0xFFE7EBEE), // 淺灰色
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(_icons[index],
            size: 25,
            color: _selectedIndex == index
                ? Theme.of(context).primaryColor
                : Color(0xFFB4C1C4)), // 深灰色
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('旅遊展示 App'),
      ),
      body: SafeArea(
        child: Padding(
          //  保留 30 的空間
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 120.0),
                child: Text(
                  '您要尋找什麼? ',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              // 空格 20 寛
              SizedBox(height: 10.0),
              // Icon 的調用， 68-78 為重要觀念!!!
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // 建位 按鈕群組 的 ！ 重要 寫法
                //!!!!!
                children: _icons
                    .asMap()
                    .entries
                    .map((MapEntry map) => _buildIcon(map.key))
                    .toList(),
              ),
              SizedBox(height: 20.0),
              DestinationCarousel(),
              SizedBox(height: 20.0),
              HotelCarousel(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
      onTap: (int value){
            setState(() {
              _currentTab = value;
            });
      },
      items: [
      BottomNavigationBarItem(icon: Icon(Icons.search,size: 30.0),
                title: SizedBox.shrink()
      ),
      BottomNavigationBarItem(icon: Icon(Icons.local_pizza,size: 30.0,),
                title: SizedBox.shrink()),
      BottomNavigationBarItem(icon: CircleAvatar(radius: 15.0,
      backgroundImage: NetworkImage('http://i.imgur.com/zl4krbz.jpg'),),
                title: SizedBox.shrink())
      ]),
    );
  }
}
