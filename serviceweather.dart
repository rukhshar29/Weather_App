import 'package:demo/weatherapp.dart/modelweather.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';



class WeatherServices{
  fetchWeather()async{
    final response=await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=20.2961°&lon=85.8245°&appid=6dd2583beac6332cd566315b4c050ad4"),

    );
    try{
      if (response.statusCode==200){
        var json =jsonDecode(response.body);
        return WeatherData.formJson(json);
      }else{
        throw Exception('failed to load Weather data');
      }
    }catch(e){
      print(e.toString());
    }
  }
}