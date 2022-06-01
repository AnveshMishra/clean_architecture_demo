
abstract class UseCases<T,P>{
  Future<T> call({required P params});
}