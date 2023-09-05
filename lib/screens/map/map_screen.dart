import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:visit_cyprus/screens/whileLoading.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  static const String routeName = "/map";

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => MapScreen(), settings: RouteSettings(name: routeName));
  }

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late double _startX;
  late double _startY;
  int currentZoom = 3;
  final _mapController = MapController.withUserPosition(
      trackUserLocation: UserTrackingOption(
    enableTracking: true,
    unFollowUser: false,
  ));

  void doubleTapHandle() {
    if (currentZoom < 19) {
      currentZoom += 1;
      _mapController.zoomIn();
    } else {
      while (currentZoom > 10) {
        currentZoom -= 1;
        _mapController.zoomOut();
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _mapController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onDoubleTap: () {},
            child: OSMFlutter(
                mapIsLoading: WhileLoadingScreen(),
                controller: _mapController,
                osmOption: OSMOption(
                  userTrackingOption: UserTrackingOption(
                    enableTracking: true,
                    unFollowUser: false,
                  ),
                  zoomOption: ZoomOption(
                    initZoom: 15,
                    minZoomLevel: 8,
                    maxZoomLevel: 19,
                    stepZoom: 1.0,
                  ),
                  userLocationMarker: UserLocationMaker(
                    personMarker: MarkerIcon(
                      icon: Icon(
                        Icons.location_history_rounded,
                        color: Colors.red,
                        size: currentZoom * 20,
                      ),
                    ),
                    directionArrowMarker: MarkerIcon(
                      icon: Icon(
                        Icons.double_arrow,
                        size: 1,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  roadConfiguration: RoadOption(
                    roadColor: Colors.yellowAccent,
                  ),
                  markerOption: MarkerOption(
                      defaultMarker: MarkerIcon(
                    icon: Icon(
                      Icons.person_pin_circle,
                      color: Colors.blue,
                      size: 56,
                    ),
                  )),
                )),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
                padding: EdgeInsets.all(16),
                onPressed: () async {
                  var myLoc = await _mapController.myLocation();
                  await _mapController.currentLocation();
                },
                icon: Icon(
                  Icons.my_location,
                  size: 30,
                )),
          )
        ],
      ),
    );
  }
}
