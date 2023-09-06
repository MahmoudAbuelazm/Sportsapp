import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'get_counteryy_state.dart';

class GetCounteryyCubit extends Cubit<GetCounteryyState> {
  GetCounteryyCubit() : super(GetCounteryyInitial());
  LatLng? _setLocation;
  LatLng? get getLocation => _setLocation;
  set setLocation(LatLng latLng) {
    _setLocation = latLng;
  }

  late TextEditingController locationController = TextEditingController();

  String addressTitle = '';
  Future<void> setAddressTitle(String coordinates, String local) async {
    emit(SettingAddressTitle());
    List<Placemark>? placemarks = await placemarkFromCoordinates(
        double.parse(coordinates.split(',')[0]),
        double.parse(coordinates.split(',')[1]),
        localeIdentifier: local);
    List<Placemark>? placemarksEn = await placemarkFromCoordinates(
        double.parse(coordinates.split(',')[0]),
        double.parse(coordinates.split(',')[1]),
        localeIdentifier: "en");
    List<Placemark>? placemarksAr = await placemarkFromCoordinates(
        double.parse(coordinates.split(',')[0]),
        double.parse(coordinates.split(',')[1]),
        localeIdentifier: "ar");
    addressTitle =
        "${placemarks[0].locality},${placemarks[0].administrativeArea},${placemarks[0].country}";
    locationController.text = addressTitle;
    log(placemarks.toString());
    emit(SetAddressTitle());
  }
}
