class ArticleModel{
  String? author;
  String? image;
  String? date;
  String? title;
  String? description;
  String? con;

  ArticleModel({

    this.con,
    this.author,this.date,this.description, this.image,this.title
  });

  ArticleModel.fromJson(Map<String,dynamic> json){
    author = json['author'];

    image = json['urlToImage'];
    date =json['publishedAt'];
    title = json['title'];
    description = json['description'];
    con = json['content'];


  }
}