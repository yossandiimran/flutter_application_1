part of '../header.dart';

class LoginService {
  final BuildContext context;
  final String username;
  final String password;

  LoginService(this.context, this.username, this.password);

  Future loginService() async {
    global.loadingAlert(context, "Mohon Tunggu", true);

    var url = global.getMainServiceUrl('login');

    try {
      await http.post(url, body: {
        'email': this.username,
        'password': this.password,
        'device_token': global.deviceToken,
      }).then((res) async {
        var data = json.decode(res.body);
        var lm = LoginModel.fromJson(data);
        if (res.statusCode == 200) {
          if (lm.success == false) {
            return global.errorResponse(context, lm.message);
          } else {
            await setUserPreference(lm, password);
            return global.successResponseNavigate(context, lm.message, '/home');
          }
        } else {
          return global.errorResponse(context, lm.message);
        }
      }).catchError((err1) {
        return global.errorResponse(context, err1.toString());
      });
    } catch (err2) {
      return global.errorResponse(context, err2.toString());
    }
  }

  setUserPreference(lm, pass) async {
    preference.setInt("id", lm.data!.user!.id);
    preference.setString("name", lm.data!.user!.nama);
    preference.setString("user", lm.data!.user!.nama);
    preference.setString("pass", pass);
    preference.setString("email", lm.data!.user!.email);
    preference.setString("token", lm.data!.accessToken);
  }
}
