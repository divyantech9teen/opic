import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pictiknew/Common/AppService.dart';
import 'package:pictiknew/Common/Constants.dart';
import 'package:pictiknew/Common/Services.dart';
import 'package:pictiknew/Components/LoadinComponent.dart';
import 'package:pictiknew/Components/NoDataComponent.dart';
import 'package:pictiknew/Components/PortfolioComponents.dart';
import 'package:pictiknew/Common/Constants.dart' as cnst;
import 'package:pictiknew/Common/Services.dart';
import 'package:pictiknew/Components/LoadinComponent.dart';
import 'package:pictiknew/Components/NoDataComponent.dart';
import 'package:pictiknew/Components/PortfolioComponents.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioScreen extends StatefulWidget {
  int index;

  PortfolioScreen({this.index});

  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  String studioid = "";
  String studiomobile;
  List portfolioList = [];
  bool isLoading = true;
  var _data;

  @override
  void initState() {
    _StudioDigitalCardId();
    accessToken();
  }

  accessToken() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          isLoading = true;
        });
        SharedPreferences prefs = await SharedPreferences.getInstance();

        AppServices.AccessToken(prefs.getString(Session.opicxoUserId),
                prefs.getString(Session.opicxoUserPass))
            .then((data) async {
          print("done1");
          setState(() {
            isLoading = false;
          });
          //  if (data.value == "true") {
          print("Message : " + data.access_token);
          getOpicxoPortfolio(data.access_token);
          // Navigator.of(context).pushReplacementNamed('/LoginForm');
          // } else {
          //   showMsg("Invalid login Detail");
          //   print("Invalid Cridintional");
          // }
        }, onError: (e) {
          setState(() {
            isLoading = false;
          });
          print("Something Went Wrong");
          print("error is " + e.toString());
        });
      }
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
      print("No Internet Connection");
    }
  }

  getOpicxoPortfolio(String token) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          isLoading = true;
        });
        SharedPreferences prefs = await SharedPreferences.getInstance();
        AppServices.OpicxoPortfolio(
                token, int.parse(prefs.getString(Session.opicxoStudioId)))
            .then((data) async {
          setState(() {
            isLoading = false;
          });
          //print("DAta :" +);

          print("Message : " + data.message);
          print(
              "data data : " + data.studioPortfolio.toString());
          setState(() {
            _data = data.studioPortfolio;
            portfolioList = data.studioPortfolio;
          });
          print("prodile data : ..." + portfolioList.toString());
        }, onError: (e) {
          setState(() {
            isLoading = false;
          });
          print("error on call -> ${e.message}");
          Fluttertoast.showToast(msg: "Something Went Wrong");
        });
      }
    } on SocketException catch (_) {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(msg: "No Internet Connection.");
    }
  }

  showMsg(String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Error"),
          content: new Text(msg),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text(
                "Close",
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _StudioDigitalCardId() async {
    try {
      //check Internet Connection
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        studiomobile = preferences.getString(Session.StudioMobile);
        Future res = Services.StudioDigitalCard(studiomobile);
        res.then((data) async {
          setState(() {
            studioid = data;
          });
          if (data != "0") {
            SharedPreferences prefs = await SharedPreferences.getInstance();
          } else {
            showMsg(data.Message);
          }
        }, onError: (e) {
          print("Error : on Login Call $e");
          showMsg("Try Again.");
        });
      } else {
        showMsg("No Internet Connection.");
      }
    } on SocketException catch (_) {
      showMsg("No Internet Connection.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.index == null
          ? AppBar(
              centerTitle: true,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[
                      cnst.appPrimaryMaterialColorYellow,
                      cnst.appPrimaryMaterialColorPink
                    ],
                  ),
                ),
              ),
              title: Text("Portfolio",
                  style: GoogleFonts.aBeeZee(
                      textStyle: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          color: Colors.white))),
            )
          : null,
      body: Stack(
        children: <Widget>[
          Container(
            child: Opacity(
              opacity: 0.2,
              child: Image.asset(
                "images/13.png",
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.fill,
              ),
            ),
          ),
          // Container(
          //   height: MediaQuery.of(context).size.height,
          //   width: MediaQuery.of(context).size.width,
          //   child: FutureBuilder<List>(
          //     future: Services.GetportfolioGalleryList(),
          //     builder: (BuildContext context, AsyncSnapshot snapshot) {
          //       return snapshot.connectionState == ConnectionState.done
          //           ? snapshot.data != null && snapshot.data.length > 0
          //               ? StaggeredGridView.countBuilder(
          //                   padding: const EdgeInsets.only(
          //                       left: 3, right: 3, top: 5),
          //                   itemCount: snapshot.data.length,
          //                   //shrinkWrap: true,
          //                   scrollDirection: Axis.vertical,
          //                   crossAxisCount: 4,
          //                   addRepaintBoundaries: false,
          //                   staggeredTileBuilder: (_) => StaggeredTile.fit(2),
          //                   mainAxisSpacing: 2,
          //                   crossAxisSpacing: 2,
          //                   itemBuilder: (BuildContext context, int index) {
          //                     return PortfolioComponents(snapshot.data[index]);
          //                   },
          //                 )
          //               : NoDataComponent()
          //           : LoadinComponent();
          //     },
          //   ),
          // ),
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: portfolioList.length > 0
                  ? StaggeredGridView.countBuilder(
                      padding: const EdgeInsets.only(left: 3, right: 3, top: 5),
                      itemCount: portfolioList.length,
                      //shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 4,
                      addRepaintBoundaries: false,
                      staggeredTileBuilder: (_) => StaggeredTile.fit(2),
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                      itemBuilder: (BuildContext context, int index) {
                        return PortfolioComponents(portfolioList[index]);
                      },
                    )
                  : NoDataComponent()),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0, right: 15),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    onPressed: () async {
                      // _StudioDigitalCardId();
                      String profileUrl =
                          cnst.profileUrl.replaceAll("#id", studioid);
                      if (await canLaunch(profileUrl)) {
                        await launch(profileUrl);
                      } else {
                        throw 'Could not launch $profileUrl';
                      }
                    },
                    child: Icon(
                      Icons.preview,
                      size: 35,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
