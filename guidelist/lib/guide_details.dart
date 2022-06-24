import 'package:flutter/material.dart';
import 'package:guidelist/models/guide.dart';

import 'bottom_bar.dart';

class GuideDetail extends StatelessWidget {
  final guideImage, guideAge, guideName, guideLanguage, guideRating;

  GuideDetail(
      {this.guideImage,
      this.guideAge,
      this.guideName,
      this.guideLanguage,
      this.guideRating});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Pickup',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFF545D68))),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none, color: Color(0xFF545D68)),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(children: [
        SizedBox(height: 15.0),
        Hero(
            tag: guideImage,
            child: Image.network(guideImage,
                height: 300.0, width: 150.0, fit: BoxFit.contain)),
        SizedBox(height: 10.0),
        Center(
          child: Text(guideName,
              style: TextStyle(
                  color: Color(0xFF575E67),
                  fontFamily: 'Varela',
                  fontSize: 24.0)),
        ),
        SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Language : ' + guideLanguage,
                style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF17532)),
              ),
              Text(
                "Rating:" + guideRating.toString(),
                style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF17532)),
              ),
              Text(
                'Age : ' + guideAge.toString(),
                style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF17532)),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.0),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 50.0,
            child: Text(
                'Cold, creamy ice cream sandwiched between delicious deluxe cookies. Pick your favorite deluxe cookies and ice cream flavor.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 16.0,
                    color: Color(0xFFB4B8B9))),
          ),
        ),
        SizedBox(height: 20.0),
        Center(
            child: Container(
                width: MediaQuery.of(context).size.width - 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Color(0xFFF17532)),
                child: Center(
                    child: Text(
                  'Book',
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ))))
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFFF17532),
        child: Icon(Icons.hiking_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
