import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/home/data/models/egyption_wars_model.dart';
import 'package:dalel/features/home/data/models/historical_character_model.dart';
import 'package:dalel/features/home/data/models/historical_periods_model.dart';
import 'package:dalel/features/home/data/models/historical_places_model.dart';
import 'package:dalel/features/home/presentation/cubit/home_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<HistoricalPeriodsModel> historicalPeriods = [];
  List<HistoricalCharactersModel> historicalCharacters = [];
  List<HistoricalPlacesModel> historicalPlaces = [];
  List<EgyptionWarsModel> egyptionWars = [];

  Future<void> getHistoricalPeriods() async {
    try {
      emit(GetHistoricalPeriodsLoading());
      final value = await FirebaseFirestore.instance
          .collection(FireBaseStrings.historical_periods)
          .get();
      historicalPeriods = value.docs
          .map((doc) => HistoricalPeriodsModel.fromJson(doc.data()))
          .toList();
      if (kDebugMode) {
        print('Historical Periods: $historicalPeriods');
      }
      emit(GetHistoricalPeriodSuccess());
    } catch (e) {
      emit(GetHistoricalPeriodFailure(errormassege: e.toString()));
    }
  }

  Future<void> getHistoricalPlaces() async {
    try {
      emit(GetHistoricalPlacesLoading());
      final value = await FirebaseFirestore.instance
          .collection(FireBaseStrings.historical_places)
          .get();
      historicalPlaces = value.docs
          .map((doc) => HistoricalPlacesModel.fromJson(doc.data()))
          .toList();
      emit(GetHistoricalPlacesSuccess());
    } catch (e) {
      emit(GetHistoricalPlacesFailure(errormassege: e.toString()));
    }
  }

  Future<void> getHistoricalCharacters() async {
    try {
      emit(GetHistoricalCharactersLoading());
      final value = await FirebaseFirestore.instance
          .collection(FireBaseStrings.historical_characters)
          .get();
      historicalCharacters = value.docs
          .map((doc) => HistoricalCharactersModel.fromJson(doc.data()))
          .toList();
      if (kDebugMode) {
        print('Historical Characters: $historicalCharacters');
      }
      emit(GetHistoricalCharactersSuccess());
    } catch (e) {
      emit(GetHistoricalCharactersFailure(errormassege: e.toString()));
    }
  }

  Future<void> getEgyptionWars() async {
    try {
      emit(GetEgyptionWarsLoading());
      final value = await FirebaseFirestore.instance
          .collection(FireBaseStrings.egyption_wars)
          .get();
      egyptionWars = value.docs
          .map((doc) => EgyptionWarsModel.fromJson(doc.data()))
          .toList();
      emit(GetEgyptionWarsSuccess());
    } catch (e) {
      emit(GetEgyptionWarsFailure(errormassege: e.toString()));
    }
  }
}
