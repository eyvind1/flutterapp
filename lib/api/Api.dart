import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ServicioApi{
  final String _url = "http://localhost:8000/api/";

  postData(data, apiUrl) async {
    var _fullUrl = _url+apiUrl + await _getToken();
    return await http.post(
      _fullUrl,
      body: jsonEncode(data),
      headers: _setHeaders()
    );
  }

  getData(apiUrl) async {
    var _fullUrl = _url+apiUrl + await _getToken();
    return await http.get(
        _fullUrl,
        headers: _setHeaders()
    );
  }

  _getToken() async{
    SharedPreferences _session = await SharedPreferences.getInstance();
    var _token = _session.getString('token');
    return '?token=$_token';
  }

  _setHeaders() =>{
    'Content-type' : 'application/json',
    'Accept' : 'application/json'
  };
}