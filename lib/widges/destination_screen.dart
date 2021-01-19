import 'package:flutter/material.dart';
import 'package:flutter_travel_ui_starter/models/activity_model.dart';
import 'package:flutter_travel_ui_starter/models/destination_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;
  DestinationScreen({this.destination});
  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  Text _buildRationStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐️ ';
    }
    stars.trim();
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              //color: Colors.black,
              height: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 3.0),
                      blurRadius: 6.0),
                ],
              ),
              child: Hero(
                tag: widget.destination.imageUrl,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image(
                      image: AssetImage(widget.destination.imageUrl),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    iconSize: 25.0,
                    color: Colors.black,
                    onPressed: () => Navigator.pop(context),
                  ),
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.search),
                        iconSize: 25.0,
                        color: Colors.black,
                        onPressed: () => Navigator.pop(context),
                      ),
                      IconButton(
                        icon: Icon(FontAwesomeIcons.sortAmountDown),
                        iconSize: 22.0,
                        color: Colors.black,
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              left: 10.0,
              bottom: 10.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.destination.city,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2)),
                  Row(children: <Widget>[
                    Icon(FontAwesomeIcons.locationArrow,
                        size: 10.0, color: Colors.white),
                    SizedBox(width: 5),
                    Text(widget.destination.country,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        )),
                  ]),
                ],
              ),
            ),
            Positioned(
              right: 20.0,
              bottom: 20.0,
              child: Icon(
                Icons.location_on,
                color: Colors.white70,
                size: 30.0,
              ),
            )
          ],
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            itemCount: widget.destination.activities.length,
            itemBuilder: (BuildContext context, int index) {
              Activity activity = widget.destination.activities[index];
              return Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                    height: 240,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(140, 15, 10, 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 120,
                                child: Text(
                                  activity.name,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Text('\$${activity.price}',
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                  SizedBox(width: 10.0),
                                  Text('pre pex',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      )),
                                ],
                              ),
                            ],
                          ),
                          Text(activity.type,
                              style: TextStyle(color: Colors.grey)),
                          SizedBox(height: 3.0),
                          _buildRationStars(activity.rating),
                          SizedBox(height: 10.0),
                          //
                          Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(5),
                                width: 85.0,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).accentColor,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                alignment: Alignment.center,
                                child: Text(activity.startTimes[0]),
                              ),
                              SizedBox(width: 10.0),
                              Container(
                                padding: EdgeInsets.all(5),
                                width: 85.0,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).accentColor,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                alignment: Alignment.center,
                                child: Text(activity.startTimes[1]),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 7.0,
                    top: 25.0,
                    bottom: 20.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image(
                          width: 140,
                          image: AssetImage(activity.imageUrl),
                          fit: BoxFit.cover),
                    ),
                  )
                ],
              );
            },
          ),
        )
      ],
    ));
  }
}
