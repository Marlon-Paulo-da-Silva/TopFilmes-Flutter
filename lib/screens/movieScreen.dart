import 'package:app/models/movie_model.dart';
import 'package:app/screens/videoplayer_screen.dart';
import 'package:app/widgets/content_scroll.dart';
import 'package:flutter/material.dart';


class MovieScreen extends StatefulWidget {
  final Movie movie;

  MovieScreen({this.movie});

  @override
  _MovieScreenState createState() => _MovieScreenState();
}



class _MovieScreenState extends State<MovieScreen> {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
          Stack(children: <Widget>[
            Container(
              transform: Matrix4.translationValues(0.0, -50, 0.0),
              child: ClipPath(
                clipper: ClipHome(),
                child: Hero(
                  tag: widget.movie.imageUrl,
                  
                    child: Image(
                      height: 400.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: AssetImage(widget.movie.imageUrl)),
                  ),
              ),
                
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.only(left: 30.0),
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back),
                  iconSize: 30.0,
                  color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 1.5),
                    child: Text('TOPFILMES',
                      style: TextStyle(
                        color: Color.fromRGBO(139,0,0,1),
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        letterSpacing: 2,
                        
                      ),
                        ),
                  ),
                  IconButton(
                    padding: EdgeInsets.only(left: 30.0),
                  onPressed: () => print(' adicionar aos favoritos'),
                  icon: Icon(Icons.favorite_border),
                  iconSize: 30.0,
                  color: Colors.white,
                  ),
                ],
              ),
              Positioned.fill(
                bottom: 50.0,
                child: Align(
                alignment: Alignment.bottomCenter,
                child: RawMaterialButton(
                  padding: EdgeInsets.all(10.0),
                  elevation: 12.0,
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => VideoPlayer())),
                  shape: CircleBorder(),
                  fillColor: Colors.white,
                  child: Icon(Icons.play_arrow, size: 60.0, color: Colors.red,)
                  ),
                  // shape: CircleBorder(),
                  
              )),
              Positioned(
                bottom: 0.0,
                left: 20.0,
                child: IconButton(
                  onPressed: () => print('Adicionar para minha lista'),
                  iconSize: 40.0,
                  color: Colors.white,
                  icon: Icon(Icons.add),
                ),
                
                ),
                Positioned(
                bottom: 0.0,
                right: 20.0,
                child: IconButton(
                  onPressed: () => print('compartilhar'),
                  iconSize: 40.0,
                  color: Colors.white,
                  icon: Icon(Icons.share),
                ),
                ),
            
          ],),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(widget.movie.title.toUpperCase(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.0),
                Text(widget.movie.categories,
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 16.0
                  ),),
                SizedBox(height: 10.0),
                Text('⭐ ⭐ ⭐ ⭐',
                style: TextStyle(fontSize: 25.0),),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'Ano',
                          style: TextStyle(color: Colors.white54, fontSize: 16.0)
                        ),

                    SizedBox(height: 2.0),
                    Text(
                      widget.movie.year.toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600)
                    )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'País',
                          style: TextStyle(color: Colors.white54, fontSize: 16.0)
                        ),

                    SizedBox(height: 2.0),
                    Text(
                      widget.movie.country.toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600)
                    )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Duração',
                          style: TextStyle(color: Colors.white54, fontSize: 16.0)
                        ),

                    SizedBox(height: 2.0),
                    Text(
                      '${widget.movie.length.toString()} min',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600)
                    )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 25.0),
                
                Container(
                  height: 120.0,
                  child: SingleChildScrollView(
                     child: Text(
                      widget.movie.description,
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
               
              ],
              
              ),
            ),
                 ContentScroll(
                  images: widget.movie.screenshots,
                  title: 'Capturas de telas',
                  imageHeight: 200.0,
                  imageWidth: 250.0,

                ),
            
        ],
      ),
    );
  }
}

class ClipHome extends CustomClipper<Path>{

  @override
  Path getClip(Size size){
    Path path = Path();

     path.lineTo(0.0, size.height );//posição de x= 0  e y = o valor máximo

    var controlPoint = Offset((size.width+ 700), size.height -200);//X = ((size.width/2)/2) e Y = ((size.heigth/2)/2) ponto de controle
    var endPoint = Offset(size.width, 0);//pontos da reta x= valor máximo e y = 0
    path.quadraticBezierTo(
      controlPoint.dx, controlPoint.dy, 
      endPoint.dx, endPoint.dy);//posição de x= o valor máximo e y = 0
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return oldClipper !=this;
  }

}