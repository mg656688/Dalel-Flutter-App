import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/features/home/data/models/historical_places_model.dart';

class SearchService {
  Future<List<HistoricalPlacesModel>> fetchHistoricalPlaces() async {
    final querySnapshot = await FirebaseFirestore.instance.collection('historical_places').get();
    return querySnapshot.docs.map((doc) => HistoricalPlacesModel.fromJson(doc.data())).toList();
  }

  List<HistoricalPlacesModel> searchPlaces(String query, List<HistoricalPlacesModel> places) {
    return places.where((place) {
      final queryLower = query.toLowerCase();
      final nameMatches = place.name.toLowerCase().contains(queryLower);

      // Check if any of the keywords match the query
      final keywordMatches = place.keywords.any((keyword) {
        return keyword.toLowerCase().contains(queryLower);
      });

      return nameMatches || keywordMatches;
    }).toList();
  }

}
