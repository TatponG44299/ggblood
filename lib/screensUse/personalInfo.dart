import 'package:flutter/material.dart';
import 'package:ggblood/screensUse/addper_info.dart';

class Personal extends StatefulWidget {
  @override
  _PersonalState createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลส่วนตัว'),
      ),
      body: Stack(
        children: <Widget>[addUsedata()],
      ),
    );
  }

  //ปุ่มกด button
  Row addUsedata() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(right: 16.0, bottom: 16.0),
              child: FloatingActionButton(
                child: Icon(Icons.edit),
                onPressed: () => addEditdata(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void addEditdata() {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (context) => Addinfodata());
    Navigator.push(context, materialPageRoute);
  }
}
