import 'package:dalel/core/models/data_model.dart';
import 'package:dalel/core/utils/app_strings.dart';

class HistoricalCharactersModel extends DataModel {
  HistoricalCharactersModel({
    required super.id,
    required super.name,
    required super.image,
    required super.description,
  });

  factory HistoricalCharactersModel.fromJson(jsonData) {
    return HistoricalCharactersModel(
      id: jsonData[FireBaseStrings.id],
      name: jsonData[FireBaseStrings.name],
      image: jsonData[FireBaseStrings.image],
      description: jsonData[FireBaseStrings.description],
    );
  }
}