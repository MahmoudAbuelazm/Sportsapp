import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sports_app/Data/Models/git_country_model.dart';

class GitCountryRepo {
 
Future<GitCountryModel?> GitCountry()async{
try{
  var response = await http.get(Uri.parse(
    "https://apiv2.allsportsapi.com/football/?met=Countries&APIkey=06ddb4b3f5a1b7c6c5714606da70878138d54131369da0480835c76ea4ea51d9"));
 
 var decodedRespons= jsonDecode(response.body);
  
  
  if(response.statusCode==200){
    GitCountryModel myRespons = GitCountryModel.fromJson(decodedRespons);
        
       return myRespons;
  }else {
    return null;
  }

 
 }catch(erorr){
return null;
 }
}
}