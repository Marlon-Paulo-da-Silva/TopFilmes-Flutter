
import 'package:flutter/material.dart';

class ContentScroll extends StatelessWidget {
  final List<String> images;
  final String title;
  final double imageHeight;
  final double imageWidth;

  ContentScroll({this.images, this.title, this.imageHeight, this.imageWidth});

  @override
  Widget build(BuildContext context) {
    return Column
    (
    children: <Widget>[
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
              
              GestureDetector(
                onTap: () => print('View $title'),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
            ],
            ),

      ),
      Divider(
          color: Color.fromRGBO(139,0,0,1),
          thickness: 4,
          indent: 40,
          endIndent: 40,
      ),

      Container(
        height: imageHeight,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index){
          return Container( 
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            width: imageWidth,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(color: Colors.black54,
                  offset: Offset(0.0, 4.0),
                  blurRadius: 6.0,
                  ),
                  ]
               ),
            child: Image(
                image: AssetImage(images[index]),
                fit: BoxFit.cover,
              ),
          );
        }),
      )
    ],
    );
  }
}