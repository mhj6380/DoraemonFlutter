import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decode/jwt_decode.dart';

class AuthService {
  final baseUrl = 'https://playmango.wiztheplanet.com/api';

  Future<dynamic> register(String email, String password) async {
    try {
      var res = await http.post('${baseUrl}/auth/register',
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({'user_id': email, 'password': password}));

      var result = jsonDecode(res.body);
      print(result);

      if (result['status'] == 200) {
        print("성공 ㅎㅎ");
        final prefs = await SharedPreferences.getInstance();

        // shared_preferences에 accessToken 저장
        prefs.setString('accessToken', result['accessToken']);

        // Map<String, dynamic> payload = Jwt.parseJwt(result['accessToken']);
        // var userId = payload['user_id'];
        // 유저정보 조회 API

        print("CHECK POINT - 1");
        var userData = await http.get('${baseUrl}/auth/user/${email}');
        print(userData.body);
        print("CHECK POINT - 2");
        prefs.setString('my', userData.body.toString());
        print("SHARED!");

        print(prefs.getString('my'));
        // https://playmango.wiztheplanet.com/api/auth/user/test@gmail.com

        // var userData = await http.get('${baseUrl}/users');
        // print(userData.body);
      }

      return res?.body;
    } catch (e) {
      print("ERROR");
      print(e);
    } finally {}
  }

  Future<dynamic> login(String email, String password) async {
    try {
      var res = await http.post('${baseUrl}/auth/login',
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({'user_id': email, 'password': password}));

      if (res.statusCode == 200) {
        var result = jsonDecode(res.body);
        final prefs = await SharedPreferences.getInstance();

        // shared_preferences에 accessToken 저장
        prefs.setString('accessToken', result['accessToken']);

        Map<String, dynamic> payload = Jwt.parseJwt(result['accessToken']);

        var userId = payload['user_id'];
        // 유저정보 조회 API
        var userData = await http.get('${baseUrl}/auth/user/${userId}');
        print(userData.body);

        prefs.setString('my', userData.body.toString());
        print("SHARED!");

        print(prefs.getString('my'));
        // https://playmango.wiztheplanet.com/api/auth/user/test@gmail.com

        // var userData = await http.get('${baseUrl}/users');
        // print(userData.body);
      }

      return res?.body;
    } catch (e) {
      print("ERROR");
      print(e);
    } finally {}
  }

  static setToken(String token, String refreshToken) async {
    // _AuthData data = _AuthData(token, refreshToken);

    // return await session.set('token', data);
  }

  static getToken() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString('accessToken');
  }
}

class _AuthData {
  String token, refreshToken, clienId;
  _AuthData(this.token, this.refreshToken, {this.clienId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['token'] = token;
    data['refreshToken'] = refreshToken;
    data['clientId'] = clienId;

    return data;
  }
}
