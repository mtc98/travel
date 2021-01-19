import 'package:flutter/material.dart';
import 'package:flutter_travel_ui_starter/models/destination_model.dart';
import 'package:flutter_travel_ui_starter/widges/destination_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DestinationCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('首選目的地',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0)),
              Text('觀看全部',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5))
            ],
          ),
        ),
        Container(
          height: 320.0,
          //color: Colors.blue,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: destinations.length,
            itemBuilder: (BuildContext context, int index) {
              Destination destination = destinations[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            DestinationScreen(destination: destination))),
                child: Container(
                    width: 240,
                    margin: EdgeInsets.all(12.0),
                    //color: Colors.grey,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Positioned(
                          bottom: 6.0,
                          child: Container(
                            height: 180.0,
                            width: 230.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(9.0),
                              child: Column(
                                //位置於底端
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '行 程 數：${destination.activities.length} ',
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.8),
                                  ),
                                  Text(
                                    destination.description,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    //overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              //color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black38,
                                  offset: Offset(0.0, 3.0),
                                  blurRadius: 6.0,
                                ),
                              ]),
                          child: Stack(
                            children: <Widget>[
                              Hero(
                                tag: destination.imageUrl,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image(
                                    height: 160,
                                    width: 210,
                                    image: AssetImage(destination.imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 10.0,
                                bottom: 10.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(destination.city,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.2)),
                                    Row(children: <Widget>[
                                      Icon(FontAwesomeIcons.locationArrow,
                                          size: 12.0, color: Colors.white),
                                      SizedBox(width: 7),
                                      Text(destination.country,
                                          style: TextStyle(
                                            color: Colors.white,
                                          )),
                                    ]),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              );
            },
          ),
        ),
      ],
    );
  }
}
