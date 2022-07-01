part of '../header.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
  }

  bool obsText = true;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.blueGrey.shade50,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: global.getHeight(context) / 2,
              left: 0,
              right: 0,
              child: Container(
                width: global.getWidth(context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(
                      global.getWidth(context) / 3,
                    ),
                    bottomLeft: Radius.circular(
                      global.getWidth(context) / 3,
                    ),
                  ),
                  color: Colors.blue[300],
                ),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "DevTemplate",
                      style: global.styleText2(35.0),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              child: Column(
                children: [
                  SizedBox(
                    height: global.getWidth(context) / 1.7,
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(20),
                    decoration: global.decorationContainer1(Colors.white, 20.0),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sign In",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.red[300],
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: username,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Email / Username',
                              labelStyle: TextStyle(fontSize: 15),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: password,
                            obscureText: obsText,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Password',
                              labelStyle: TextStyle(fontSize: 15),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    !obsText ? obsText = true : obsText = false;
                                  });
                                },
                                icon: Icon(
                                  !obsText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 0,
                      bottom: 5,
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await new LoginService(
                              context,
                              username.text,
                              password.text,
                            ).loginService();
                          },
                          child: Container(
                            width: global.getWidth(context) / 1.5,
                            padding: EdgeInsets.all(10),
                            decoration: global.decorationContainer1(
                                Colors.blue[300], 10.0),
                            child: Center(
                              child: Text(
                                "Login",
                                style: global.styleText2(15.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text("Or"),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            global.alertWarning(
                              context,
                              "Menu Registrasi Belum Tersedia",
                            );
                          },
                          child: Container(
                            width: global.getWidth(context) / 1.5,
                            padding: EdgeInsets.all(10),
                            decoration: global.decorationContainer1(
                              Colors.orange[300],
                              10.0,
                            ),
                            child: Center(
                              child: Text(
                                "Register",
                                style: global.styleText2(15.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer()
                ],
              ),
            ),
          ],
        ),
      ),
      onWillPop: () async {
        global.alertConfirmExit(context);
        return false;
      },
    );
  }
}
