import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/widgets.dart';
import '../res/res.dart';

class FullScreenImage extends StatelessWidget {
  final String photoLink;
  final String altDescription;
  final String userName;
  final String name;

  FullScreenImage(
      {Key key, this.photoLink, this.altDescription, this.name, this.userName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(CupertinoIcons.back),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
      ),
      body: Center(
        child: Column(children: <Widget>[
          Photo(photoLink: photoLink),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: altDescription != null
                ? Description(description: altDescription)
                : Description(
                    description:
                        'Описание картинки Описание картинки Описание картинки Описание картинки Описание картинки Описание картинки Описание картинки Описание картинки Описание картинки Описание картинки '),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    UserAvatar(
                        'https://skill-branch.ru/img/speakers/Adechenko.jpg'),
                    SizedBox(
                      width: 6,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Name(name: 'Kirill Adeshchenko'),
                        UserName(userName: 'kaparray'),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                LikeButton(likeCount: 10, isLiked: true),
                GestureDetector(
                    onTap: () {
                      print('tapSave');
                    },
                    child: Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                        color: AppColors.dodgerBlue,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          'Save',
                          style: AppStyles.h2Black
                              .copyWith(color: AppColors.white),
                        ),
                      ),
                    )),
                GestureDetector(
                    onTap: () {
                      print('tapVisit');
                    },
                    child: Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                        color: AppColors.dodgerBlue,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          'Visit',
                          style: AppStyles.h2Black
                              .copyWith(color: AppColors.white),
                        ),
                      ),
                    ))
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class Name extends StatelessWidget {
  final String name;

  Name({this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: AppStyles.h1Black,
    );
  }
}

class UserName extends StatelessWidget {
  final String userName;

  UserName({this.userName});

  @override
  Widget build(BuildContext context) {
    return Text(
      "@$userName",
      style: AppStyles.h5Black.copyWith(color: AppColors.manatee),
    );
  }
}

class Description extends StatelessWidget {
  final String description;

  Description({this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: AppStyles.h3.copyWith(color: AppColors.manatee),
    );
  }
}
