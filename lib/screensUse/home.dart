import 'package:flutter/material.dart';
import 'package:ggblood/screensUse/login.dart';
import 'package:ggblood/screensUse/notifications.dart';
import 'package:ggblood/screensUse/personalInfo.dart';
import 'package:ggblood/screensUse/prepare.dart';
import 'package:ggblood/screensUse/project_donate.dart';
import 'package:ggblood/screensUse/query.dart';
import 'package:ggblood/screensUse/statistics.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name;

  @override
  void initState() {
    super.initState();
    memUse();
  }

  //จำ User ไม่ต้องไป login  ซ้ำ
  Future<Null> memUse() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    name = preferences.getString('name');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: showDrawer(),
    );
  }

//แทบ Menu ข้างซ้าย
  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            showDrawerHeader(),
            usedataMenu(),
            queryMenu(),
            prodonatMenu(),
            notificMenu(),
            statisticsMenu(),
            prepareMenu(),
            logoutMenu()
          ],
        ),
      );

//แทบแบบสอบถาม
  ListTile queryMenu() {
    return ListTile(
      leading: Icon(Icons.book),
      title: Text('แบบสอบถาม'),
      onTap: () {
        //กดเปลี่ยนหน้า
        Navigator.pop(context);
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => Query());
        Navigator.push(context, route);
      },
    );
  }

//แทบเมนูโครงการที่รับบริจาค
  ListTile prodonatMenu() {
    return ListTile(
      leading: Icon(Icons.location_city),
      title: Text('โครงการรับบริจาค'),
      onTap: () {
        Navigator.pop(context);
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => ProjectDonate());
        Navigator.push(context, route);
      },
    );
  }

//แทบเมนูการแจ้งเตือน
  ListTile notificMenu() {
    return ListTile(
      leading: Icon(Icons.notifications),
      title: Text('การแจ้งเตือน'),
      onTap: () {
        Navigator.pop(context);
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => Notfic());
        Navigator.push(context, route);
      },
    );
  }

//แทบเมนูสถิติ
  ListTile statisticsMenu() {
    return ListTile(
      leading: Icon(Icons.insert_chart),
      title: Text('สถิติ'),
      onTap: () {
        Navigator.pop(context);
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => Statistics());
        Navigator.push(context, route);
      },
    );
  }

//แทบเมนูเตรียมตัว
  ListTile prepareMenu() {
    return ListTile(
      leading: Icon(Icons.bookmark_border),
      title: Text('เตรียมตัวบริจาค'),
      onTap: () {
        Navigator.pop(context);
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => Prepare());
        Navigator.push(context, route);
      },
    );
  }

//แทบเมนูออกจากระบบ
  ListTile logoutMenu() {
    return ListTile(
      leading: Icon(Icons.keyboard_return),
      title: Text('ออกจากระบบ'),
      onTap: () {
        logoutProcees();
        //Navigator.pop(context);
        //MaterialPageRoute route = MaterialPageRoute(builder: (value) => Logout());
        //Navigator.push(context, route);
      },
    );
  }

  Future<Null> logoutProcees() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => Login());
        Navigator.push(context, route);
  }

//แทบเมนูข้อมูลผู้ใช้
  ListTile usedataMenu() {
    return ListTile(
      leading: Icon(Icons.account_box),
      title: Text('ข้อมูลผู้ใช้'),
      onTap: () {
        Navigator.pop(context);
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => Personal());
        Navigator.push(context, route);
      },
    );
  }

//UserAccountDrawrHead
  UserAccountsDrawerHeader showDrawerHeader() {
    return UserAccountsDrawerHeader(
        accountName: Text('Guest'), accountEmail: null);
  }
}
