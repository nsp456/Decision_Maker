import 'package:flutter/material.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';

import 'formRandom.dart';
import 'multipleAttributes.dart';
import 'flipCoin.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FSBStatus drawerStatus;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FoldableSidebarBuilder(
          drawerBackgroundColor: Colors.green,
          drawer: CustomDrawer(
            closeDrawer: () {
              setState(() {
                drawerStatus = FSBStatus.FSB_CLOSE;
              });
            },
          ),
          screenContents: Home(),
          status: drawerStatus,
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green,
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                drawerStatus = drawerStatus == FSBStatus.FSB_OPEN
                    ? FSBStatus.FSB_CLOSE
                    : FSBStatus.FSB_OPEN;
              });
            }),
      ),
    );
  }
}

class CustomDrawer extends StatefulWidget {
  final Function closeDrawer;

  const CustomDrawer({Key key, this.closeDrawer}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      color: Colors.white,
      width: mediaQuery.size.width * 0.60,
      height: mediaQuery.size.height,
      child: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey.withAlpha(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Decision Maker",
                    textAlign: TextAlign.center,
                    style:
                        (TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                  Image.asset(
                    "assets/images/dm_logo.jpg",
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Hello User",
                    textAlign: TextAlign.center,
                    style:
                        (TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                ],
              )),
          Text.rich(
            TextSpan(
              style: TextStyle(fontSize: 16),
              children: [
                TextSpan(
                    text: 'Dark Theme ',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                WidgetSpan(
                  child: CustomSwitch(
                    activeColor: Colors.green,
                    value: status,
                    onChanged: (value) {
                      print("VALUE : $value");
                      setState(() {
                        status = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            //textAlign: TextAlign.center,
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.date_range),
            title: Text("History"),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.insert_invitation_outlined),
            title: Text("Incomplete"),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.exit_to_app),
            title: Text("Log Out"),
          ),
        ],
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //color: Colors.transparent,
      home: Container(
        decoration: BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
                image: AssetImage("assets/images/light_mode.jpg"),
                fit: BoxFit.cover)),
        child: Scaffold(
          appBar: AppBar(
            titleSpacing: 0.0,
            backgroundColor: Colors.green,
            title: Text(
              '      Home',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          body: Container(
            color: Colors.transparent,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(15.0),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 8 / 10,
                    height: MediaQuery.of(context).size.height * 1.5 / 10,
                    child: RaisedButton(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                          side: BorderSide(color: Colors.blue)),
                      child: Text(
                        "Many Alternatives \n  with Attributes",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SOF(),
                          ),
                        );
                      },
                      color: Colors.green,
                      textColor: Colors.white,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      splashColor: Colors.red,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 8 / 10,
                    height: MediaQuery.of(context).size.height * 1.5 / 10,
                    child: RaisedButton(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                          side: BorderSide(color: Colors.blue)),
                      child: Text(
                        "Randomly choose \nan alternative",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyForm()),
                        );
                      },
                      color: Colors.green,
                      textColor: Colors.white,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      splashColor: Colors.red,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 8 / 10,
                    height: MediaQuery.of(context).size.height * 1.5 / 10,
                    child: RaisedButton(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                          side: BorderSide(color: Colors.blue)),
                      child: Text(
                        "Flip A \n  Coin",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FlipCoin(),
                          ),
                        );
                      },
                      color: Colors.green,
                      textColor: Colors.white,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      splashColor: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
