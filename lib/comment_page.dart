import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';

class CommentPage extends StatefulWidget {

  @override
  _TestMeState createState() => _TestMeState();
}

class _TestMeState extends State<CommentPage> {


  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List filedata = [
    {
      'name': 'Buse',
      'pic':
          'https://st3.depositphotos.com/1039762/15793/i/600/depositphotos_157937858-stock-photo-70th-anniversary-screening-premiere.jpg',
      'message': 'kurk mantolu madonna çok güzel okumanızı tavsiye ederim'
    },
    {
      'name': 'Utku',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Evet ben de okudum.Kitaba hayran kaldım :)'
    },
    {
      'name': 'Melis',
      'pic':
          'https://thumbs.dreamstime.com/b/close-up-photo-beautiful-amazing-her-lady-bad-person-tongue-out-mouth-showing-forehead-loser-symbol-teasing-friends-impolite-148230653.jpg',
      'message': 'Martı Jonathan benim en sevdigim kitap'
    },
    {
      'name': 'Ezgi',
      'pic':
          'https://blog.hubspot.com/hs-fs/hubfs/picnoi-free-stock-photos.jpg?width=350&name=picnoi-free-stock-photos.jpg',
      'message': 'The secret bas ucu kitaplarımdan biridir'
    },
  ];

  Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                      color: Colors.blue,
                      borderRadius: new BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(data[i]['pic'] + "$i")),
                ),
              ),
              title: Text(
                data[i]['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i]['message']),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Comment Page"),
        backgroundColor: Color(0xff5ac18e),
      ),
      body: Container(
        child: CommentBox(
          userImage:
              "https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400",
          child: commentChild(filedata),
          labelText: 'Write a comment...',
          withBorder: false,
          errorText: 'Comment cannot be blank',
          sendButtonMethod: () {

            if (formKey.currentState!.validate()) {
              print(commentController.text);
              setState(() {
                var value = {
                  'name': 'Mahir',
                  'pic':
                      'https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400',
                  'message': commentController.text
                };
                filedata.insert(0, value);
              });
              commentController.clear();
              FocusScope.of(context).unfocus();
            } else {
              print("Not validated");
            }
          },
          formKey: formKey,
          commentController: commentController,
          backgroundColor: Color(0xff5ac18e),
          textColor: Colors.white,
          sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
        ),
      ),
    );
  }
}

