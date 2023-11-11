 import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class ArticleView extends StatefulWidget {
   ArticleView({super.key , required this.blogUrl});

  String? blogUrl;

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Image.asset('assets/images/spacenews8544.logowik.com.webp'),
      ),
      body: WebViewPlus(
        initialUrl: widget.blogUrl,
      ),
    );
  }
}
