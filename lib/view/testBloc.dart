part of '../header.dart';

class TestBloc extends StatefulWidget {
  @override
  _TestBlocState createState() => _TestBlocState();
}

class _TestBlocState extends State<TestBloc> {
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<TestBlocController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Provider"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<TestBlocController, int>(
              builder: (context, state) => Text(
                state.toString(),
                style: TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Spacer(),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: global.decorationContainer1(Colors.blue, 10.0),
                    child: Text("Tambah"),
                  ),
                  onTap: () {
                    bloc.add("add");
                  },
                ),
                Spacer(),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: global.decorationContainer1(Colors.blue, 10.0),
                    child: Text("Kurang"),
                  ),
                  onTap: () {
                    bloc.add("minus");
                  },
                ),
                Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
