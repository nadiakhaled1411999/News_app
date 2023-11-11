// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled5/data/local_data.dart';
import 'package:untitled5/data/news.dart';
import 'package:untitled5/models/artticle_modle.dart';
import 'package:untitled5/models/categoery_model.dart';
import 'package:untitled5/view/article_view.dart';
import 'package:untitled5/view/category_news.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoeryModel> category = [];
  List<ArticleModle> article = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    category = getCateoryies();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    article = newsClass.news;
    setState(() {
      loading = false;
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
      body: loading
          ? Center(
        child:Lottie.asset('assets/images/nk.jpg',height:70,width: 70, ),
      )
          : Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100,
                child: ListView.builder(
                    itemCount: category.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CategoryTile(
                        categoryTitle: category[index].catogeryName,
                        imageUrl: category[index].imageUrl,
                      );
                    }),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
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
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  const CategoryTile({super.key, this.categoryTitle, this.imageUrl});

  final String? categoryTitle, imageUrl;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryScreen(category: categoryTitle!.toLowerCase())));
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imageUrl!,
                height: 100,
                width: 140,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 100,
              width: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Text(
                categoryTitle!,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArticleTile extends StatelessWidget {
  const ArticleTile(
      {super.key, this.imageUrl, this.articleTitle, this.description, this.url});

  final String? imageUrl, articleTitle, description , url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleView(blogUrl: url)));
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                imageUrl!,
              ),
            ),
            Text(
              articleTitle!,
              style: TextStyle(
                fontSize: 17,
                color: Colors.black87,
              ),
            ),
            Text(
              description!,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
