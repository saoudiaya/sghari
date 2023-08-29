import 'dart:convert';
import 'dart:ui' as ui;
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_google_places/flutter_google_places.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_webservice/places.dart';
// ignore: depend_on_referenced_packages
import 'package:google_api_headers/google_api_headers.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../DetailsPage/details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController googleMapController;
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  static const CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(36.8065, 10.1815), zoom: 14);

  Set<Marker> markers = {};
  String images = "./assets/logo/playtime.png";
  /*final List<LatLng> _latLen = <LatLng>[
    const LatLng(36.844069, 10.0651046),
    const LatLng(36.8404283, 10.0862972),
    const LatLng(36.8391641, 10.0794368),
    const LatLng(36.791999, 10.0204365),
    const LatLng(36.8357017, 10.0976841),
  ];*/
  static const kGoogleApiKey = '';
  final Mode _mode = Mode.overlay;
  final GlobalKey<ScaffoldState> homeScaffoldKey = GlobalKey<ScaffoldState>();
  List _listofpos = [];

  @override
  void initState() {
    getPosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: initialCameraPosition,
            markers: markers,
            onTap: (position) {
              _customInfoWindowController.hideInfoWindow!();
            },
            onCameraMove: (position) {
              _customInfoWindowController.onCameraMove!();
            },
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller) {
              googleMapController = controller;
              _customInfoWindowController.googleMapController = controller;
            },
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 200,
            width: 300,
            offset: 35,
          ),
          Positioned(
            top: 20,
            left: 10,
            right: 10,
            child: GestureDetector(
              onTap: () {
                _handlePressedButton();
              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 40,
                        child: Image.asset('./assets/logo/search.png'),
                      ),
                      const SizedBox(width: 8.0),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search for a nursery ...',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // declared method to get Images
  Future<Uint8List> getImages(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location permission are permently denied");
    }

    Position position = await Geolocator.getCurrentPosition();
    return position;
  }

  void getPosition() async {
    var url = "http://192.168.1.14:8087/nursery/get";
    var response = await http.get(Uri.parse(url));
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        _listofpos = data;
      });
      // ignore: avoid_print
      print(data);
    }
    final Uint8List markIcons = await getImages(images, 100);
    Position position = await _determinePosition();
    googleMapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(position.latitude, position.longitude), zoom: 12)));
    markers.clear();
    markers.add(Marker(
        markerId: const MarkerId('currentLocation'),
        position: LatLng(position.latitude, position.longitude)));
    for (var item in _listofpos) {
      double longitude = item['position']['longitude'] as double;
      double latitude = item['position']['latitude'] as double;
      markers.add(
        Marker(
            markerId: MarkerId('creche_${item['name']}'), // unique marker ID
            icon: BitmapDescriptor.fromBytes(markIcons),
            position: LatLng(latitude, longitude),
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailPage(_listofpos.indexOf(item))),
                    );
                  },
                  child: Container(
                    height: 400,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 300,
                            height: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('${item['image']}'),
                                    fit: BoxFit.fitWidth,
                                    filterQuality: FilterQuality.high),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 10, right: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    item['name'],
                                    style: const TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.fade,
                                    softWrap: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                                vertical: 10.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: (() {
                                                double totalRating = 0.0;
                                                for (int i = 0;
                                                    i < item['reviews'].length;
                                                    i++) {
                                                  totalRating += item['reviews']
                                                      [i]['rating'] as double;
                                                }
                                                double averageRating =
                                                    totalRating /
                                                        item['reviews'].length;
                                                return averageRating
                                                    .toStringAsFixed(1);
                                              }()),
                                              style: const TextStyle(
                                                  fontSize: 20.0),
                                            ),
                                            const TextSpan(
                                              text: "/5",
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                color: Color(0xFF808080),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SmoothStarRating(
                                        starCount: 5,
                                        rating: (() {
                                          double totalRating = 0.0;
                                          for (int i = 0;
                                              i < item['reviews'].length;
                                              i++) {
                                            totalRating += item['reviews'][i]
                                                ['rating'] as double;
                                          }
                                          double averageRating = totalRating /
                                              item['reviews'].length;
                                          return averageRating;
                                        }()),
                                        size: 15.0,
                                        color: Colors.orange,
                                        borderColor: Colors.orange,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 80,
                                  ),
                                  Text(
                                    '${item['price']} TND/month',
                                    style: const TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
                LatLng(latitude, longitude),
              );
            } // corrected order of longitude and latitude
            ),
      );
    }
    setState(() {});
  }

  void _handlePressedButton() async {
    Prediction? p = await PlacesAutocomplete.show(
        context: context,
        apiKey: kGoogleApiKey,
        onError: onError,
        mode: _mode,
        language: 'en',
        strictbounds: false,
        types: [""],
        components: [Component(Component.country, "pk")]);

    displayPrediction(p!, homeScaffoldKey.currentState);
  }

  void onError(PlacesAutocompleteResponse response) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(response.errorMessage!)));
  }

  Future<void> displayPrediction(
      Prediction p, ScaffoldState? currentState) async {
    GoogleMapsPlaces places = GoogleMapsPlaces(
        apiKey: kGoogleApiKey,
        apiHeaders: await const GoogleApiHeaders().getHeaders());
    PlacesDetailsResponse detail = await places.getDetailsByPlaceId(p.placeId!);
    final lat = detail.result.geometry!.location.lat;
    final lng = detail.result.geometry!.location.lng;

    markers.clear();
    markers.add(Marker(
      markerId: const MarkerId("0"),
      position: LatLng(lat, lng),
    ));
    setState(() {});
    googleMapController
        .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lng), 14.0));
  }
}
