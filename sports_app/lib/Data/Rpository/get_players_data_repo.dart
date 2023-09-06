import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sports_app/Data/Models/git_players_data.dart';




class GetPlayersRepo {
  Future<GetPlayersModel?> getPlayers() async {
    try {
      var response = await http.get(Uri.parse(
          "https://apiv2.allsportsapi.com/football/?&met=Players&teamId=10&APIkey=da248f5665aa5f3116c16ddc9a5e3a9841870cb50ff81537c8f4e970c678e876"));

      var decodedResponse = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        GetPlayersModel myResponse = GetPlayersModel.fromJson(decodedResponse);

        return myResponse;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}
