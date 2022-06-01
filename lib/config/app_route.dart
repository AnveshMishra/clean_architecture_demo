
import 'package:flutter/material.dart';

import '../features/news_app/presentation/views/breaking_news_article.dart';

class AppRoute{
  static Route? onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case "/":
        return _route(BreakingNewsArticleView());
    }
  }

  static Route<dynamic> _route(Widget view){
    return MaterialPageRoute(builder: (_)=>view);
  }
}