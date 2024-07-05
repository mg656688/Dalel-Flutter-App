import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/services/search_service.dart';
import 'package:dalel/features/home/data/models/historical_places_model.dart';
import 'package:dalel/features/search/presentation/widgets/place_card.dart';

class HistoricalPlacesPage extends StatefulWidget {
  const HistoricalPlacesPage({super.key});

  @override
  _HistoricalPlacesPageState createState() => _HistoricalPlacesPageState();
}

class _HistoricalPlacesPageState extends State<HistoricalPlacesPage> {
  String _searchQuery = '';
  final TextEditingController _controller = TextEditingController();
  final SearchService _searchService = SearchService();
  List<HistoricalPlacesModel> _places = [];
  List<HistoricalPlacesModel> _searchResults = [];
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _fetchPlaces();
    // _pushData();
  }

  Future<void> _fetchPlaces() async {
    final places = await _searchService.fetchHistoricalPlaces();
    setState(() {
      _places = places;
    });
  }

  // Future<void> _pushData() async {
  //   // Example JSON data with your places
  //   List<Map<String, dynamic>> placesData = [
  //     {
  //       "id": "Cairo Tower",
  //       "name": "Cairo Tower",
  //       "description": "The Cairo Tower is a free-standing concrete tower in Cairo, Egypt. At 187 m it was the tallest structure in Egypt for 37 years until 1998, when it was surpassed by the Suez Canal overhead powerline crossing. It was the tallest structure in North Africa for 21 years until 1982, when it was surpassed by the Nador transmitter in Morocco. It was the tallest structure in Africa for one year until 1962, when it was surpassed by Sentech Tower in South Africa. One of Cairo's well-known modern monuments, sometimes considered Egypt's second most famous landmark after the Pyramids of Giza, it stands in the Gezira district on Gezira Island in the River Nile, close to downtown Cairo.",
  //       "image": "https://firebasestorage.googleapis.com/v0/b/dalel-12a8f.appspot.com/o/Cairo_Tower.jpg?alt=media&token=cc43b5a2-6726-45ba-a314-482351f4dfcc",
  //       "keywords": ["Cairo", "Tower", "Landmark", "Zamalek", "River Nile", "Architecture"]
  //     },
  //
  //     {
  //       "id": "Saladin Citadel",
  //       "name": "Saladin Citadel",
  //       "description": "Salah al-Din al-Ayyubi began constructing a castle on top of Mount Mokattam in a place known as the Dome of the Air. But he did not complete it in his life. But it was completed by Sultan Al-Kamil bin Al-Adil. The first person to inhabit it was King Al-Kamil and he made it a royal residence. This continued until the reign of Khedive Ismail Salah al-Din al-Ayyubi Citadel in Cairo is considered one of the most luxurious military castles built in the Middle Ages. Its strategic location is first-class, as this site provides defensive importance because it controls the cities of Cairo and Fustat. It also forms a high natural barrier between the two cities, and with this location it is possible to provide communication between... The castle and the city are in a state of siege, and it will become the last stronghold to seize it in the event that the city falls into the hands of the enemy.",
  //       "image": "https://firebasestorage.googleapis.com/v0/b/dalel-12a8f.appspot.com/o/salahaldinqalaa.jpeg?alt=media&token=1f9d7388-8618-4fa9-8e2c-37938d26b508",
  //       "keywords": ["Citadel", "Saladin", "Cairo", "Fortification", "Historical Landmark", "Islamic Architecture"]
  //     },
  //
  //     {
  //       "id": "Pyramids Camel Ride",
  //       "name": "Pyramids Camel Ride",
  //       "description": "Experience the Great Pyramid of Giza, the only remaining ancient world wonder, at its most beautiful on this sunrise camel tour. Alongside a private guide, climb atop your camel and enjoy a leisurely ride as the sun is rising above the ancient structures. Not only are the temperatures cooler at sunrise, but there are also fewer tourists so you can capture the best photos.",
  //       "image": "https://firebasestorage.googleapis.com/v0/b/dalel-12a8f.appspot.com/o/pyramids-camel-ride.jpg?alt=media&token=c79f8a1a-bc6a-4b41-a8fe-48a9823658f9",
  //       "keywords": ["Pyramids", "Camel Ride", "Giza", "Tourist Attraction", "Ancient Egypt", "Adventure"]
  //     }
  //
  //
  //
  //   ];
  //
  //
  //   // Initialize Firebase
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //
  //   // Add documents to Firestore
  //   for (var placeData in placesData) {
  //     try {
  //       await firestore.collection('historical_places').add({
  //         'id': placeData['id'],
  //         'name': placeData['name'],
  //         'description': placeData['description'],
  //         'image': placeData['image'],
  //         'keywords': placeData['keywords'],
  //       });
  //       print('Added place: ${placeData['name']}');
  //     } catch (e) {
  //       print('Error adding place: ${placeData['name']}, Error: $e');
  //     }
  //   }
  //
  //   print('Data added to Firestore!');
  // }

    void _updateSearchQuery(String query) {
    setState(() {
      _searchQuery = query;
      _isSearching = query.isNotEmpty;
      _searchResults = _searchService.searchPlaces(query, _places);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Attraction Places & Activities',
          style: CustomTextStyles.poppins600style28.copyWith(fontSize: 22),
        ),
        leadingWidth: 48,
        backgroundColor: AppColors.primaryColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: SvgPicture.asset(Assets.menu),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              onChanged: _updateSearchQuery,
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                labelStyle: CustomTextStyles.poppins500style18,
                border: getBorderStyle(),
                enabledBorder: getBorderStyle(),
                focusedBorder: getBorderStyle(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _isSearching ? _searchResults.length : _places.length,
              itemBuilder: (context, index) {
                final place = _isSearching ? _searchResults[index] : _places[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: PlaceCard(place: place),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

OutlineInputBorder getBorderStyle() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(
      color: Colors.grey,
    ),
  );
}
