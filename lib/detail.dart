import 'package:flutter/material.dart';
import 'books_data.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen1 extends StatefulWidget {
  final BooksData place;

  const DetailScreen1({Key? key, required this.place}) : super(key: key);


  @override
  State<DetailScreen1> createState() => _DetailScreen1State();
}

class _DetailScreen1State extends State<DetailScreen1> {
  @override
  bool toggle = false;

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("${widget.place.title}"),
        backgroundColor: Colors.lightBlueAccent,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                toggle = !toggle;
              });
            },
            icon: (toggle)
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
          ),
          IconButton(
            onPressed: () {
              // _launchURL(widget.album.albumurl);
            },
            icon: Icon(Icons.share),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
              alignment: Alignment.center,
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 30,),
                    Image.network(widget.place.imageLinks, width: 180,),
                    SizedBox(height: 10,),
                    Text(widget.place.title,
                      style:
                      TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                    Text("Publisher : ${widget.place.publisher}  | Release Date : ${widget.place.publishedDate}",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    SizedBox(height: 5,),
                    Text("ID : ${widget.place.id}  | Categories : ${widget.place.categories}",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),

                    Container(
                      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                      child: Text(widget.place.description,),
                    ),
                    SizedBox(height: 10,),
                    ElevatedButton(onPressed: () {
                      _launchURL(widget.place.previewLink);
                    },
                        child: Text('Preview buku')),
                    SizedBox(height: 50,),
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
  void _launchURL(_url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
