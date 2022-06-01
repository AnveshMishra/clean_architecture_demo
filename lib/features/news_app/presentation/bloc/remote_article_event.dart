part of 'remote_article_bloc.dart';

abstract class RemoteArticleEvent extends Equatable {
  const RemoteArticleEvent();
}

class GetArticles extends RemoteArticleEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
