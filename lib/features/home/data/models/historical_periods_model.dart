import 'package:dalel/core/models/data_model.dart';
import 'package:dalel/core/utils/app_strings.dart';

class HistoricalPeriodsModel extends DataModel {
  HistoricalPeriodsModel({
    required super.id,
    required super.name,
    required super.image,
    required super.description,
  });

  factory HistoricalPeriodsModel.fromJson(jsonData) {
    return HistoricalPeriodsModel(
      id: jsonData[FireBaseStrings.id],
      name: jsonData[FireBaseStrings.name],
      image: jsonData[FireBaseStrings.image],
      description: jsonData[FireBaseStrings.description],
    );
  }
}
