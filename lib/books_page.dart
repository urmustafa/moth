import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'comment_page.dart';

class BooksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BOOKS PAGE',
      theme: ThemeData(
        fontFamily: 'PermanentMarker',
        iconTheme: IconThemeData(color: Colors.black, size: 40),
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: backgroundGradient(),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomBottomNav(),
            ),
            Column(
              children: [
                CustomBanner(),
                BookListView(
                  title: 'YOUR CHOICES',
                  books: [
                    '1984.jpg',
                    'aylak.jpg',
                    'dogru.jpg',
                    'ermis.jpg',
                    'ferrari.jpg',
                    'gunluk.jpg',
                    'hayvan.jpg',
                    'kuantum.jpg'
                  ],
                ),
                BookListView(
                  title: 'USERS FAVORITES',
                  books: [
                    'kucuk.jpg',
                    'magic.jpg',
                    'marti.jpg',
                    'nutuk.jpg',
                    'power.jpg',
                    'secret.jpg',
                    'simdi.jpg',
                  ],
                ),
                RaisedButton(
                  elevation: 5,
                  padding: EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  color: Colors.white,
                  child: Text(
                    'COMMENT PAGE',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CommentPage()));
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration backgroundGradient() {
    return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          tileMode: TileMode.mirror,
          stops: [
            0.0,
            0.4,
            0.6,
            1
          ],
          colors: [
            Color(0x995ac18e),
            Color(0x665ac18e),
            Color(0x665ac18e),
            Color(0x995ac18e),
          ]),
    );
  }
}

class BookListView extends StatelessWidget {
  final String title;
  final List<String> books;

  const BookListView({Key? key, required this.title, required this.books})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LinePainter(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              title,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            height: 180,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: books.length,
                itemBuilder: (BuildContext context, int index) {
                  return BookCard(
                    file: books[index],
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String file;

  static const filePath = 'assets/images/';

  const BookCard({Key? key, required this.file}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0x665ac18e),
      ),
      child: Image.asset(filePath + file),
    );
  }
}

class CustomBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LinePainter(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        height: 90.0,
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Text(
                  'BOOKS PAGE',
                ),
                Expanded(
                  child: Container(),
                ),
                Icon(Icons.search)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.refresh),
          Icon(Icons.person_outline),
          Icon(Icons.info_outline),
        ],
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white30
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;

    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
