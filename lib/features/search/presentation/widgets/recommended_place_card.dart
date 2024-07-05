import 'package:flutter/material.dart';
import 'package:dalel/features/home/data/models/historical_places_model.dart';
import 'package:dalel/features/search/presentation/views/place_details_view.dart';

class RecommendedPlaceCard extends StatelessWidget {
  const RecommendedPlaceCard({Key? key, required this.place}) : super(key: key);

  final HistoricalPlacesModel place;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => PlaceDetails(place: place),
          ),
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side:  BorderSide(color: Colors.grey.shade300),
        ),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 120,
                  width: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(place.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 120,
                  width: 160,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Text(
                place.name,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
