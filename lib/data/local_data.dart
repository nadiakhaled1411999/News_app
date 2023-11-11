import 'package:untitled5/models/categoery_model.dart';

List<CategoeryModel> getCateoryies() {
  List<CategoeryModel> categoery = [];

  //#1
  CategoeryModel categoeryModel = CategoeryModel();
  categoeryModel.catogeryName = "business";
  categoeryModel.imageUrl =
      'https://imageio.forbes.com/specials-images/imageserve/633a774a842d06ecd68286ff/The-5-Biggest-Business-Trends-For-2023/960x0.jpg?height=430&width=711&fit=bounds';
  categoery.add(categoeryModel);
  //#2
  categoeryModel = CategoeryModel();
  categoeryModel.catogeryName = "Entertainment";
  categoeryModel.imageUrl =
      'https://www.apple.com/newsroom/videos/apple-celebrates-entertainment/posters/Apple-celebrates-entertainment-hero.jpg.large_2x.jpg';
  categoery.add(categoeryModel);
//#3
  categoeryModel = CategoeryModel();
  categoeryModel.catogeryName = "General";
  categoeryModel.imageUrl =
      'https://media.defense.gov/2020/Sep/17/2002499485/-1/-1/0/200917-A-CE999-001.JPG';
  categoery.add(categoeryModel);
  //#4
  categoeryModel = CategoeryModel();
  categoeryModel.catogeryName = "Health";
  categoeryModel.imageUrl =
      'https://cdn.the-scientist.com/assets/articleNo/70606/aImg/48090/star-rating-800-s.jpg';
  categoery.add(categoeryModel);
  //#5
  categoeryModel = CategoeryModel();
  categoeryModel.catogeryName = "Science";
  categoeryModel.imageUrl =
      'https://mystudytimes.com/wp-content/uploads/2015/09/Cartoon-Logo.jpg';
  categoery.add(categoeryModel);
  //#6
  categoeryModel = CategoeryModel();
  categoeryModel.catogeryName = "Sports";
  categoeryModel.imageUrl =
      'https://www.shutterstock.com/image-photo/sport-equipment-balls-stadium-background-260nw-1097352449.jpg';
  categoery.add(categoeryModel);
//#7

  categoeryModel = CategoeryModel();
  categoeryModel.catogeryName = "Technology";
  categoeryModel.imageUrl =
      'https://www.vtpass.com/blog/wp-content/uploads/2018/01/72-1.jpg';
  categoery.add(categoeryModel);

  // categoery[0]=categoeryModel;
  // categoery[1]=categoeryModel2;

  return categoery;
}
