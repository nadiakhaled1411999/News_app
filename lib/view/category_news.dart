// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, use_key_in_widget_constructors, no_logic_in_create_state, avoid_unnecessary_containers, unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled5/data/news.dart';
import 'package:untitled5/models/artticle_modle.dart';
import 'package:untitled5/view/home_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.category});

  final String? category;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<ArticleModle> article = [];
  bool _isloading = true;

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNewsClass newsClass= CategoryNewsClass();
   await newsClass.getNews(widget.category!);
    article = newsClass.news;
    setState(() {
      _isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Image.asset('assets/images/spacenews8544.logowik.com.webp'),
      ),
      body: _isloading
          ? Center(
              child:Lottie.asset('assets/images/nk.jpg',height: 70,width: 70,),
            )
          : Container(
              padding: EdgeInsets.only(
                top: 10,
                right: 10,
                left: 10,
              ),
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  child: ListView.builder(
                      itemCount: article.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ArticleTile(
                          imageUrl: article[index].urltoimage,
                          articleTitle: article[index].title,
                          description: article[index].description,
                         url: article[index].url,


                        );

                      }),
                ),
              ),
            ),
    );
  }
}


