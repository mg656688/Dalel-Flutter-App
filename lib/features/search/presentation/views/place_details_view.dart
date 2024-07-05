import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dalel/features/home/data/models/historical_places_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../widgets/recommended_place_card.dart';

class PlaceDetails extends StatefulWidget {
  final HistoricalPlacesModel place;

  const PlaceDetails({Key? key, required this.place});

  @override
  _PlaceDetailsState createState() => _PlaceDetailsState();
}

class _PlaceDetailsState extends State<PlaceDetails> {
  List<HistoricalPlacesModel> _recommendedPlaces = [];

  @override
  void initState() {
    super.initState();
    _fetchRecommendedPlaces(widget.place.name);
  }

  Future<void> _fetchRecommendedPlaces(String placeName) async {
    var uri = Uri.parse(
        'http://192.168.43.174:5000/recommend'); // Use your server's IP address
    final body = jsonEncode({'place_name': placeName});

    try {
      final response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        final recommendedPlaceIds =
            List<String>.from(responseData['recommendations']);

        // 2. Fetch details of recommended places from Firestore based on IDs
        List<HistoricalPlacesModel> places =
            await _fetchPlacesDetails(recommendedPlaceIds);

        setState(() {
          _recommendedPlaces = places;
        });
      } else {
        if (kDebugMode) {
          print(
              'Failed to get recommendations. Status code: ${response.statusCode}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching recommendations: $e');
      }
    }
  }

  Future<List<HistoricalPlacesModel>> _fetchPlacesDetails(
      List<String> placeIds) async {
    List<HistoricalPlacesModel> places = [];

    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('historical_places')
          .where('id', whereIn: placeIds)
          .get();

      places = querySnapshot.docs
          .map((doc) => HistoricalPlacesModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching recommended places details: $e');
      }
    }

    return places;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.place.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: AspectRatio(
                  aspectRatio: 0.90,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: widget.place.image,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.place.description,
                style: CustomTextStyles.poppins500style18.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:16, top: 16.0),
              child: Text(
                'Recommended Places',
                style: CustomTextStyles.poppins500style18.copyWith(
                  color: AppColors.deepBrown,
                ),
              ),
            ),
            _recommendedPlaces.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SizedBox(
                      height: 180,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _recommendedPlaces.length,
                        itemBuilder: (context, index) {
                          final recommendedPlace = _recommendedPlaces[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: RecommendedPlaceCard(place: recommendedPlace),
                          );
                        },
                      ),
                    ),
                ),
          ],
        ),
      ),
    );
  }
}
