const String _apiKey =
// "962ec1bd77d940a0860aca999616bcba";
    "94f37f7206cd4aec87f948f7a29183e9";

class ArticleRequestParams {
  final String apiKey;
  final String country;
  final String category;
  final int page;
  final int pageSize;

  ArticleRequestParams(
      {this.apiKey = _apiKey,
      this.country = "us",
      this.category = "general",
      this.page = 1,
      this.pageSize = 20});
}
