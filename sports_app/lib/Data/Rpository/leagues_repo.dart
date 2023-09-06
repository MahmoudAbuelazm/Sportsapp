import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sports_app/Data/Models/data/leagues.dart';


class LeaguesRepo {
  Future<Leagues?> getAllLeagues(String countryId) async {
    try {
      http.Response response = await http.get(Uri.parse(
          "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=56c74531e88d4ce2df8cd2a150a449c5425f14eda66bc15b7b8e1c96e8c386e6&countryId=5"));

      Map<String, dynamic> data = json.decode(response.body);

      if (response.statusCode == 200) {
        Leagues leagues = Leagues.fromJson(data);
        return leagues;
      } else {
        // ignore: avoid_print
        print("request failed");
        return null;
      }
    } catch (error) {
      debugPrint("error : $error");
      return null;
    }
  }
}
var countryId = 5;