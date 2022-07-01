part of '../header.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  void _onItemTapped(int index) {
    setState(() {
      selectIndexNow = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: getWidget(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: EdgeInsets.only(bottom: 25.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton(
            child: Icon(Icons.house_outlined),
            onPressed: () {
              _onItemTapped(1);
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.gps_fixed),
            label: 'Ekspedisi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.keyboard_arrow_up_sharp),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active_outlined),
            label: 'Informasi',
          ),
        ],
        currentIndex: selectIndexNow,
        selectedItemColor: Colors.blue[300],
        onTap: _onItemTapped,
      ),
    );
  }

  getWidget() {
    if (selectIndexNow == 0) {
      return Container(
        child: Center(
          child: Text("Ekspedisi"),
        ),
      );
      //Or Call Another Class
    } else if (selectIndexNow == 1) {
      return Home();
    } else {
      return Container(
        child: Center(
          child: Text("Informasi"),
        ),
      );
      //Or Call Another Class
    }
  }
}
