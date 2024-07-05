class HomeState{}

final class HomeInitial extends HomeState {}


final class GetHistoricalPeriodSuccess extends HomeState{}
final class GetHistoricalPeriodFailure extends HomeState{
  final String errormassege;
  GetHistoricalPeriodFailure({required this.errormassege});
}
final class GetHistoricalPeriodsLoading extends HomeState{}



final class GetHistoricalCharactersSuccess extends HomeState{}
final class GetHistoricalCharactersFailure extends HomeState{
  final String errormassege;
  GetHistoricalCharactersFailure({required this.errormassege});
}
final class GetHistoricalCharactersLoading extends HomeState{}



final class GetHistoricalPlacesSuccess extends HomeState{}
final class GetHistoricalPlacesFailure extends HomeState{
  final String errormassege;
  GetHistoricalPlacesFailure({required this.errormassege});
}
final class GetHistoricalPlacesLoading extends HomeState{}




final class GetEgyptionWarsSuccess extends HomeState{}
final class GetEgyptionWarsFailure extends HomeState{
  final String errormassege;
  GetEgyptionWarsFailure({required this.errormassege});
}
final class GetEgyptionWarsLoading extends HomeState{}