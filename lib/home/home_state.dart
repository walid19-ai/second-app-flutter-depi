part of 'home_cubit.dart';


abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {

}
class HomeSucccess extends HomeState {
  final List<ArticleModel> data;
  HomeSucccess(this.data);
}
class HomeFailure extends HomeState
{
  final String msg;
  HomeFailure(
      this.msg
      );
}
