import 'article_model.dart';

class BreakingNewsResponseModel {
  final String? status;
  final int? totalResults;
  final List<ArticleModel>? articles;

  BreakingNewsResponseModel({this.status, this.totalResults, this.articles});

  factory BreakingNewsResponseModel.fromJson(Map<String, dynamic> json) {
    return BreakingNewsResponseModel(
        status: json['status'],
        totalResults: json["totalResults"],
        articles: (json["articles"] as List)
            .map((e) => ArticleModel.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}
