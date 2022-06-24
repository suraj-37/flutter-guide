import 'package:flutter/material.dart';
import 'guide_details.dart';
import 'helpers/utils.dart';
import 'models/guide.dart';

class GuidePage extends StatelessWidget {
  var guidelists = Utils.guidelist;
  //Guide guide = guidelist[index];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Container(
              padding: EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: <Widget>[
                  for (var guide in guidelists)
                    _buildCard(guide.name, guide.age, guide.imageUrl,
                        guide.language, guide.rating, false, context)
                ],
              )),
          SizedBox(height: 15.0)
        ],
      ),
    );
  }

  Widget _buildCard(String name, int age, String imageUrl, String language,
      double rating, bool isFavorite, context) {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => GuideDetail(
                        guideImage: imageUrl,
                        guideAge: age,
                        guideName: name,
                        guideLanguage: language,
                      )));
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            isFavorite
                                ? Icon(Icons.favorite, color: Color(0xFFEF7532))
                                : Icon(Icons.favorite_border,
                                    color: Color(0xFFEF7532))
                          ])),
                  Hero(
                      tag: imageUrl,
                      child: CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage(imageUrl),
                      )),
                  SizedBox(height: 7.0),
                  Text(name,
                      style: TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  SizedBox(height: 7.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      children: [
                        Text(language,
                            style: TextStyle(
                                color: Color(0xFFCC8053),
                                fontFamily: 'Varela',
                                fontSize: 10.0)),
                        SizedBox(width: 8.0),
                        Text(rating.toString(),
                            style: TextStyle(
                                color: Color(0xFFCC8053),
                                fontFamily: 'Varela',
                                fontSize: 10.0)),
                        Icon(
                          Icons.star,
                          color: Colors.red,
                          size: 12.0,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
                  Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Book',
                              style: TextStyle(
                                  fontFamily: 'Varela',
                                  color: Color(0xFFD17E50),
                                  fontSize: 20.0))
                        ],
                      ))
                ]))));
  }
}
