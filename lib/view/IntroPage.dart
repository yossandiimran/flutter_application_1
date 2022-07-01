part of '../header.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late List<Widget> page;

  int activepage = 0;
  var stats;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  checkLogin() async {
    await preference.initialization();
    var id = await preference.getData("id");
    if (id != null) {
      Navigator.pushNamed(context, "/home");
    }
  }

  @override
  Widget build(BuildContext context) {
    page = [
      Container(
        color: Colors.lightBlue[200],
        child: Center(
          child: Column(
            children: [
              Spacer(),
              Icon(
                Icons.phone_iphone_rounded,
                color: Colors.white,
                size: 80,
              ),
              Container(
                margin: EdgeInsets.all(50),
                child: Text(
                  "Selamat Datang di Aplikasi Ekspedisi Central",
                  textAlign: TextAlign.center,
                  style: global.styleText2(20.0),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
      Container(
        color: Colors.lightBlue[400],
        child: Center(
          child: Column(
            children: [
              Spacer(),
              Icon(
                Icons.developer_mode_rounded,
                color: Colors.white,
                size: 80,
              ),
              Container(
                margin: EdgeInsets.all(50),
                child: Text(
                  "Aplikasi Khusus Ekspedisi by Central Developer V.1.0",
                  textAlign: TextAlign.center,
                  style: global.styleText2(20.0),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
      Center(
        child: Container(
          color: Colors.blue[400],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.login_rounded,
                  color: Colors.white,
                  size: 100,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      Navigator.pushNamed(context, "/login");
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(
                        left: global.getWidth(context) / 5,
                        right: global.getWidth(context) / 5,
                        top: 30,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue[900],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Login Untuk Memulai",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ];

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            top: 0,
            right: 0,
            child: PageView(
              children: page,
              onPageChanged: (value) {
                setState(() {
                  activepage = value;
                });
              },
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) {
                          return Container(
                            margin: const EdgeInsets.all(5),
                            width: activepage == index ? 15 : 5,
                            height: 5,
                            decoration: BoxDecoration(
                              color: activepage == index
                                  ? Colors.black
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
