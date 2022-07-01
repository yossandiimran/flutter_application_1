import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Preference.dart';

Preference preference = new Preference();
Global global = new Global();
int selectIndexNow = 1;

class Global {
  late String name, email, token, typeUser;

  getWidth(context) {
    return MediaQuery.of(context).size.width;
  }

  getHeight(context) {
    return MediaQuery.of(context).size.height;
  }

  //Handle Service ===============================================================
  var baseUrl = 'http://10.0.2.2:30/e-patroli/public/api/';

  getMainServiceUrl(String link) {
    var url = Uri.parse(this.baseUrl + link);
    return url;
  }

  errorResponse(context, message) {
    Navigator.pop(context);
    this.alertWarning(context, message);
  }

  errorResponseNavigate(context, message, route) {
    Navigator.popAndPushNamed(context, route);
    this.alertWarning(context, message);
  }

  successResponse(context, message) {
    Navigator.pop(context);
    this.alertSuccess(context, message);
  }

  successResponseNavigate(context, message, route) {
    Navigator.popAndPushNamed(context, route);
    this.alertSuccess(context, message);
  }
  //END Handle Service ===========================================================

  //Simple Alert =================================================================
  alertWarning(context, text) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          contentPadding: EdgeInsets.only(top: 10.0),
          content: Container(
            height: this.getWidth(context) / 3,
            child: Column(
              children: [
                Spacer(),
                Icon(
                  Icons.warning_amber_rounded,
                  color: Colors.orange[400],
                  size: this.getWidth(context) / 8,
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    "$text",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: this.getWidth(context) / 20,
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }

  alertSuccess(context, text) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          contentPadding: EdgeInsets.only(top: 10.0),
          content: Container(
            height: this.getWidth(context) / 3,
            child: Column(
              children: [
                Spacer(),
                Icon(
                  Icons.check_circle_outline_outlined,
                  color: Colors.greenAccent,
                  size: this.getWidth(context) / 8,
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    "$text",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: this.getWidth(context) / 20,
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }

  loadingAlert(context, text, disabled) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              height: this.getWidth(context) / 3,
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Spacer(),
                  CircularProgressIndicator(),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "$text",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: this.getWidth(context) / 20,
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
          onWillPop: () async {
            return disabled;
          },
        );
      },
    );
  }

  alertConfirmExit(context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          content: new Text("Apakah Anda ingin keluar dari Aplikasi?"),
          actions: <Widget>[
            new TextButton(
              child: new Text("Tidak"),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            new TextButton(
              child: new Text("Ya"),
              onPressed: () async {
                exit(0);
              },
            )
          ],
        );
      },
    );
  }

  alertLogout(context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          content: new Text("Anda Yakin Untuk Logout?"),
          actions: <Widget>[
            new TextButton(
              child: new Text("Tidak"),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            new TextButton(
              child: new Text("Ya"),
              onPressed: () async {
                await preference.clearPreference();
                Navigator.pushNamed(context, "/login");
                global.alertSuccess(context, "Berhasil Logout");
              },
            )
          ],
        );
      },
    );
  }
  //End Of Alert =================================================================

  //Styling ======================================================================
  styleText1() {
    return TextStyle(
      color: Colors.grey,
    );
  }

  styleText2(size) {
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: size,
    );
  }

  decorationContainer1(color, radius) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(radius),
        topLeft: Radius.circular(radius),
        topRight: Radius.circular(radius),
        bottomRight: Radius.circular(radius),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    );
  }
  //End Styling ======================================================================
}
