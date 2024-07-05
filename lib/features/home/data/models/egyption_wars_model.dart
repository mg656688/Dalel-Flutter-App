import 'package:dalel/core/models/data_model.dart';
import 'package:dalel/core/utils/app_strings.dart';

class EgyptionWarsModel extends DataModel {
  EgyptionWarsModel({
    required super.name,
    required super.image,
    required super.description,
    required super.id,
  });

  factory EgyptionWarsModel.fromJson(jsonData) {
    return EgyptionWarsModel(
      name: jsonData[FireBaseStrings.name],
      image: jsonData[FireBaseStrings.image],
      description: jsonData[FireBaseStrings.description],
      id: jsonData[FireBaseStrings.id],
    );
  }
}