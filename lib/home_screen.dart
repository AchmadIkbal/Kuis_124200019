import 'package:flutter/material.dart';
import 'package:kuis/detail.dart';
import 'books_data.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Buku"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: GridView.builder(
        itemBuilder: (context, index) {
          final BooksData book = booksData[index];
          return InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return DetailScreen1(place: book);
                }),
              );
              // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(username: place.name)));
            },
            child: Container(
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.deepOrange,
                  ),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20,),
                      Image.network(book.imageLinks, width: 200, height: 200,),
                      SizedBox(height: 5,),
                      Text(book.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          // fontSize: 40,
                        ),),
                      SizedBox(height: 5,),
                      Text("Authors : ${book.authors[0]}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          // fontSize: 40,
                        ),),
                      Text("Release Date : ${book.publishedDate}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          // fontSize: 40,
                        ),),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: booksData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
        ),
      ),
    );
  }
}
