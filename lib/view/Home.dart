part of '../header.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Widget> page;
  int activepage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    page = [
      Container(
        margin: EdgeInsets.all(10),
        decoration: global.decorationContainer1(Colors.blue[200], 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.explore,
              color: Colors.white,
              size: global.getWidth(context) / 5,
            ),
            Text(
              "ini tampilan Home",
              style: global.styleText2(global.getWidth(context) / 17),
            )
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.all(10),
        decoration: global.decorationContainer1(Colors.orange[100], 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.app_registration,
              color: Colors.white,
              size: global.getWidth(context) / 5,
            ),
            Text(
              preference.getData("name"),
              style: global.styleText2(global.getWidth(context) / 17),
            )
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.all(10),
        decoration: global.decorationContainer1(Colors.greenAccent[100], 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.assignment_turned_in_outlined,
              color: Colors.white,
              size: global.getWidth(context) / 5,
            ),
            Text(
              "Berita 2",
              style: global.styleText2(global.getWidth(context) / 17),
            )
          ],
        ),
      )
    ];

    return WillPopScope(
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade50,
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        body: getBody(context),
      ),
      onWillPop: () async {
        global.alertConfirmExit(context);
        return false;
      },
    );
  }

  getBody(context) {
    return Stack(
      children: [
        Positioned(
          bottom: global.getHeight(context) / 1.35,
          left: 0,
          right: 0,
          top: global.getHeight(context) / 12,
          child: Container(
            height: 200,
            margin: EdgeInsets.all(10),
            decoration: global.decorationContainer1(Colors.white, 10.0),
            child: Container(
              child: Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Apa yang anda cari?...",
                      style: global.styleText1(),
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.question_answer,
                      color: Colors.blue[400],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      global.alertLogout(context);
                    },
                    icon: Icon(
                      Icons.logout,
                      color: Colors.red[400],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: global.getHeight(context) / 2,
          left: 0,
          right: 0,
          top: global.getHeight(context) / 5.5,
          child: Container(
            child: PageView(
              children: page,
              onPageChanged: (value) {
                setState(() {
                  activepage = value;
                });
              },
            ),
          ),
        ),
        Positioned(
          bottom: global.getHeight(context) / 2.6,
          left: 0,
          right: 0,
          top: global.getHeight(context) / 2.35,
          child: Center(
            child: Row(
              children: [
                Spacer(),
                Container(
                  width: global.getWidth(context) / 6,
                  margin: EdgeInsets.all(10),
                  decoration: global.decorationContainer1(Colors.white, 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.notifications,
                        color: Colors.orange,
                        size: 30,
                      ),
                      Text(
                        "informasi",
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
                Container(
                  width: global.getWidth(context) / 6,
                  margin: EdgeInsets.all(10),
                  decoration: global.decorationContainer1(Colors.white, 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.date_range_sharp,
                        color: Colors.red,
                        size: 30,
                      ),
                      Text(
                        "jadwal",
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
                Container(
                  width: global.getWidth(context) / 6,
                  margin: EdgeInsets.all(10),
                  decoration: global.decorationContainer1(Colors.white, 10.0),
                  child: GestureDetector(
                    onTap: () async {
                      Navigator.pushNamed(context, "/testBloc");
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.blue,
                          size: 30,
                        ),
                        Text(
                          "Driver",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: global.getWidth(context) / 6,
                  margin: EdgeInsets.all(10),
                  decoration: global.decorationContainer1(Colors.white, 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Icon(
                          Icons.settings,
                          color: Colors.green,
                          size: 30,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, "/settingNetwork");
                        },
                      ),
                      Text(
                        "Setting",
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
