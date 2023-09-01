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
  double _zoomLevel = 10.0;
  late Offset _startPosition;
  void _onPanUpdate(DragUpdateDetails details) {
    // Calculate the difference between the starting and current positions.
    final deltaX = details.globalPosition.dx - _startPosition.dx;
    final deltaY = details.globalPosition.dy - _startPosition.dy;

    // Get the current center of the map.
    final currentCenter = _mapController.center;

    // Calculate the new center based on the pan gesture.
    final newCenter = GeoPoint(
      latitude: currentCenter.latitude -
          deltaY * 0.0001, // Adjust the scale as needed
      longitude: currentCenter.longitude +
          deltaX * 0.0001, // Adjust the scale as needed
    );

    // Set the new center for the map.
    _mapController.setCenter(newCenter);

    // Update the starting position for the next frame.
    _startPosition = details.globalPosition;
  }

  void _onPinchUpdate(ScaleUpdateDetails details) {
    // Adjust the zoom level based on the gesture scale.
    _zoomLevel *= details.scale;

    // Limit the zoom level to a sensible range.
    if (_zoomLevel < 3.0) {
      _zoomLevel = 3.0;
    } else if (_zoomLevel > 19.0) {
      _zoomLevel = 19.0;
    }

    // Update the map's zoom level.
    _mapController.setZoom(zoomLevel: _zoomLevel);
  }

  final _mapController = MapController.withUserPosition(
      trackUserLocation: UserTrackingOption(
    enableTracking: true,
    unFollowUser: false,
  ));

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _mapController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onPanStart: (details) {
          _startX = details.globalPosition.dx;
          _startY = details.globalPosition.dy;
        },
        onPanUpdate: _onPanUpdate, // Handle pan gestures.
        onScaleUpdate: _onPinchUpdate, // Handle pinch gestures.
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
                minZoomLevel: 3,
                maxZoomLevel: 19,
                stepZoom: 1.0,
              ),
              userLocationMarker: UserLocationMaker(
                personMarker: MarkerIcon(
                  icon: Icon(
                    Icons.location_history_rounded,
                    color: Colors.red,
                    size: 48,
                  ),
                ),
                directionArrowMarker: MarkerIcon(
                  icon: Icon(
                    Icons.double_arrow,
                    size: 48,
                    color: Colors.red,
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
    );
  }
}
