import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dart:async';
import 'dart:developer';
// ignore: depend_on_referenced_packages
import "package:google_maps_webservice/places.dart";
// ignore: depend_on_referenced_packages
import 'package:google_api_headers/google_api_headers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sports_app/Data/Cubit/map/get_counteryy_cubit.dart';
import 'package:sports_app/Data/constants/search_field.dart';

import 'customm_button.dart';
import 'map_card.dart';

class AddAddressScreen extends StatefulWidget {
  final LatLng? myLocationIfSelect;

  const AddAddressScreen({
    super.key,
    this.myLocationIfSelect,
  });

  static const LatLng _latlng = LatLng(30.033333, 31.233334);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

const kGoogleApiKey = 'AIzaSyB38_1XJa_Yy92TyTfUCpuRqSCc9hWTpBQ';
final homeScaffoldKey = GlobalKey<ScaffoldState>();

class _AddAddressScreenState extends State<AddAddressScreen> {
  LatLng? _selectLoction;

  final Completer<GoogleMapController> _controller = Completer();
  final Mode _mode = Mode.overlay;
  late GoogleMapController googleMapController;

// static const LatLng _center = LatLng(24.774265, 46.738586);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = AddAddressScreen._latlng;
  final MapType _currentMapType = MapType.normal;
  final String _title = "";
  final String _detail = "";
  static double? _lat;
  static double? _long;
  _getUserLocation() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    final GoogleMapController controller = await _controller.future;
    setState(() {
      _markers.clear();
      _lat = position.latitude;
      _long = position.longitude;
      _markers.add(Marker(
          markerId: MarkerId(position.latitude.toString()),
          position: LatLng(position.latitude, position.longitude),
          infoWindow: InfoWindow(title: _title, snippet: _detail),
          icon: BitmapDescriptor.defaultMarker));
      log(_lat.toString());
      log(_long.toString());
      _selectLoction = LatLng(position.latitude, position.longitude);
      context.read<GetCounteryyCubit>().setAddressTitle('$_lat,$_long',
          EasyLocalization.of(context)!.currentLocale!.languageCode);
    });

    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(position.latitude, position.longitude), zoom: 14),
      ),
    );
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      log(
        "Location services are disabled. Please enable the services",
      );
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        log(
          "Location permissions are denied",
        );

        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      log(
        "Location permissions are permanently denied, we cannot request permissions.",
      );

      return false;
    }
    return true;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    googleMapController = controller;
    // controller.setMapStyle(mapStyle);
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  _onAddMarkerButtonPressed() {
    _markers.clear();
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId(_selectLoction.toString()),
          position: _selectLoction ?? _lastMapPosition,
          infoWindow: InfoWindow(title: _title, snippet: _detail),
          icon: BitmapDescriptor.defaultMarker));
      log(_markers.toString());
    });
  }

  _handleTap(LatLng point) {
    _markers.clear();
    _selectLoction == null;
    // _getLocation(point);
    log(_selectLoction.toString());
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(point.toString()),
        position: point,
        infoWindow: InfoWindow(title: _title, snippet: _detail),
        // icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.mainColor),
      ));
      _lat = point.latitude;
      _long = point.longitude;
      _selectLoction = point;

      context.read<GetCounteryyCubit>().setAddressTitle(
          '${_selectLoction!.latitude},${_selectLoction!.longitude}',
          EasyLocalization.of(context)!.currentLocale!.languageCode);
      log(_selectLoction.toString());
    });
  }

  @override
  void initState() {
    super.initState();
    _selectLoction = widget.myLocationIfSelect;

    widget.myLocationIfSelect != null
        ? _onAddMarkerButtonPressed()
        : _getUserLocation();
    // _onAddMarkerButtonPressed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeScaffoldKey,
      extendBodyBehindAppBar: true,
      extendBody: true,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
            initialCameraPosition: CameraPosition(
              tilt: 0.0,
              target: widget.myLocationIfSelect ?? AddAddressScreen._latlng,
              zoom: 15.0,
            ),
            markers: _markers,
            mapType: _currentMapType,
            onCameraMove: _onCameraMove,
            onTap: _handleTap,
          ),
          context.watch<GetCounteryyCubit>().addressTitle.isEmpty
              ? const SizedBox()
              : Positioned(
                  bottom: 100.h,
                  left: 20.w,
                  right: 20.w,
                  child: MapCard(
                      isSelected: true,
                      text: context.watch<GetCounteryyCubit>().addressTitle)),
          Positioned(
            // bottom: 5,
            top: 100.h,
            // bottom: 10,
            child: InkWell(
              onTap: () {
                _handlePressButton();
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                // alignment: Alignment.center,
                child: SearchField(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.blue,
                  ),
                  hintText: tr("search_for_location"),
                  isFilled: true,
                  isEnable: false,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: context.watch<GetCounteryyCubit>().addressTitle.isEmpty
                ? 100.h
                : 230.h,
            right: 20.w,
            child: FloatingActionButton(
              onPressed: () {
                _getUserLocation();
              },
              backgroundColor: Colors.blue,
              child: const Icon(Icons.map),
            ),
          )
        ],
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      backgroundColor: Colors.white,
      bottomNavigationBar: BlocConsumer<GetCounteryyCubit, GetCounteryyState>(
        listener: (context, state) {},
        builder: (context, state) {
          // if (state is updateLocatinLoading) {
          //   return const Center(
          //     child: LoadingWidget(),
          //   );
          // }
          return Container(
            color: Colors.transparent,
            padding: const EdgeInsets.all(20.0),
            child: TrillaButton(
              onTap: _selectLoction == null
                  ? () {
                      log(_selectLoction.toString());
                    }
                  : () async {
                      context.read<GetCounteryyCubit>().setLocation =
                          _selectLoction!;
                      log('----------${context.read<GetCounteryyCubit>().getLocation}');
                      context.read<GetCounteryyCubit>().setAddressTitle(
                          "${_selectLoction!.latitude},${_selectLoction!.longitude}",
                          Localizations.localeOf(context).languageCode);
                      Navigator.pop(context);
                    },
              width: 336.w,
              text: ("add_address"),
            ),
          );
        },
      ),
    );
  }

  Future<void> _handlePressButton() async {
    Prediction? p = await PlacesAutocomplete.show(
        context: context,
        logo: const SizedBox(),
        apiKey: kGoogleApiKey,
        onError: onError,
        mode: _mode,
        language: 'en',
        strictbounds: false,
        types: [""],
        decoration: InputDecoration(
            hintText: 'Search',
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.white))),
        components: [
          Component(Component.country, "eg"),
        ]);

    displayPrediction(p!, homeScaffoldKey.currentState);
  }

  void onError(PlacesAutocompleteResponse response) {
    log(response.errorMessage.toString());
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: Text(response.status)));
  }

  Future<void> displayPrediction(
      Prediction p, ScaffoldState? currentState) async {
    GoogleMapsPlaces places = GoogleMapsPlaces(
        apiKey: kGoogleApiKey,
        apiHeaders: await const GoogleApiHeaders().getHeaders());
    PlacesDetailsResponse detail = await places.getDetailsByPlaceId(p.placeId!);
    final lat = detail.result.geometry!.location.lat;
    final lng = detail.result.geometry!.location.lng;

    _handleTap(LatLng(lat, lng));
    googleMapController
        .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lng), 14.0));
  }
}
