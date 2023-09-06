import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sports_app/Data/Models/get_teams_model.dart';



class GetTeamsRepo {
  Future<GetTeamsModel?> getTeams() async {
    try {
      var response = await http.get(
        Uri.parse(
            "https://apiv2.allsportsapi.com/football/?&met=Teams&teamId=96&APIkey=721ea3a267fe032fa3340245f91a2c4f03112ab652b7adf368388e1d446cc804"),
      );
      var decodedResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        GetTeamsModel myResponse = GetTeamsModel.fromJson(decodedResponse);
        return myResponse;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}
