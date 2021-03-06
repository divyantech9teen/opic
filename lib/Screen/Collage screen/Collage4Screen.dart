import 'package:flutter/material.dart';
import 'package:pictiknew/Common/Constants.dart';

import 'CollageGallaryScreen.dart';
import 'fade_route_transition.dart';

import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class Collage4Screen extends StatefulWidget {
  String albumId, albumName, totalImg;

  Collage4Screen({this.albumId, this.albumName, this.totalImg});

  @override
  _Collage4ScreenState createState() => _Collage4ScreenState();
}

class _Collage4ScreenState extends State<Collage4Screen> {
  var Image, Image1, Image2, Image3, Image4, Image5, Image6, Image7, Image8;
  GlobalKey _globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    _requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                appPrimaryMaterialColorYellow,
                appPrimaryMaterialColorPink
              ],
            ),
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  _saveScreen();
                },
                child: Container(
                    width: 80,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 3, right: 3, top: 2, bottom: 2),
                      child: Center(
                        child: Text(
                          "Save",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),
                    )),
              ))
        ],
        actionsIconTheme: IconThemeData.fallback(),
        title: Text(
          "Collage Image",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: RepaintBoundary(
          key: _globalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      var image = await Navigator.of(context).push(
                        FadeRouteTransition(
                            //  page: CollageSample(CollageType.VSplit)),
                            page: CollageGallaryScreen(
                          albumId: widget.albumId,
                          albumName: widget.albumName,
                          totalImg: widget.totalImg,
                        )),
                      );
                      setState(() {
                        Image = image;
                      });
                    },
                    child: Image == null
                        ? Container(
                            height: MediaQuery.of(context).size.height / 7,
                            width: MediaQuery.of(context).size.width / 3.2,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(
                              Icons.add,
                              size: 20,
                            ),
                          )
                        : Container(
                            height: MediaQuery.of(context).size.height / 7,
                            width: MediaQuery.of(context).size.width / 3.2,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: ClipRRect(
                              borderRadius: new BorderRadius.circular(5.0),
                              child: FadeInImage.assetNetwork(
                                placeholder: 'images/opicxologo.png',
                                image: "${ImgUrl}${Image}",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3.0),
                    child: GestureDetector(
                      onTap: () async {
                        var image = await Navigator.of(context).push(
                          FadeRouteTransition(
                              //  page: CollageSample(CollageType.VSplit)),
                              page: CollageGallaryScreen(
                            albumId: widget.albumId,
                            albumName: widget.albumName,
                            totalImg: widget.totalImg,
                          )),
                        );
                        setState(() {
                          Image1 = image;
                        });
                      },
                      child: Image1 == null
                          ? Container(
                              height: MediaQuery.of(context).size.height / 7,
                              width: MediaQuery.of(context).size.width / 3.2,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Icon(
                                Icons.add,
                                size: 20,
                              ),
                            )
                          : Container(
                              height: MediaQuery.of(context).size.height / 7,
                              width: MediaQuery.of(context).size.width / 3.2,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: ClipRRect(
                                borderRadius: new BorderRadius.circular(5.0),
                                child: FadeInImage.assetNetwork(
                                  placeholder: 'images/opicxologo.png',
                                  image: "${ImgUrl}${Image1}",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3.0),
                    child: GestureDetector(
                      onTap: () async {
                        var image = await Navigator.of(context).push(
                          FadeRouteTransition(
                              //  page: CollageSample(CollageType.VSplit)),
                              page: CollageGallaryScreen(
                            albumId: widget.albumId,
                            albumName: widget.albumName,
                            totalImg: widget.totalImg,
                          )),
                        );
                        setState(() {
                          Image2 = image;
                        });
                      },
                      child: Image2 == null
                          ? Container(
                              height: MediaQuery.of(context).size.height / 7,
                              width: MediaQuery.of(context).size.width / 3.2,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Icon(
                                Icons.add,
                                size: 20,
                              ),
                            )
                          : Container(
                              height: MediaQuery.of(context).size.height / 7,
                              width: MediaQuery.of(context).size.width / 3.2,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: ClipRRect(
                                borderRadius: new BorderRadius.circular(5.0),
                                child: FadeInImage.assetNetwork(
                                  placeholder: 'images/opicxologo.png',
                                  image: "${ImgUrl}${Image2}",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        var image = await Navigator.of(context).push(
                          FadeRouteTransition(
                              //  page: CollageSample(CollageType.VSplit)),
                              page: CollageGallaryScreen(
                            albumId: widget.albumId,
                            albumName: widget.albumName,
                            totalImg: widget.totalImg,
                          )),
                        );
                        setState(() {
                          Image3 = image;
                        });
                      },
                      child: Image3 == null
                          ? Container(
                              height: MediaQuery.of(context).size.height / 7,
                              width: MediaQuery.of(context).size.width / 3.2,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Icon(
                                Icons.add,
                                size: 20,
                              ),
                            )
                          : Container(
                              height: MediaQuery.of(context).size.height / 7,
                              width: MediaQuery.of(context).size.width / 3.2,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: ClipRRect(
                                borderRadius: new BorderRadius.circular(5.0),
                                child: FadeInImage.assetNetwork(
                                  placeholder: 'images/opicxologo.png',
                                  image: "${ImgUrl}${Image3}",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 3.0),
                      child: GestureDetector(
                        onTap: () async {
                          var image = await Navigator.of(context).push(
                            FadeRouteTransition(
                                //  page: CollageSample(CollageType.VSplit)),
                                page: CollageGallaryScreen(
                              albumId: widget.albumId,
                              albumName: widget.albumName,
                              totalImg: widget.totalImg,
                            )),
                          );
                          setState(() {
                            Image4 = image;
                          });
                        },
                        child: Image4 == null
                            ? Container(
                                height: MediaQuery.of(context).size.height / 7,
                                width: MediaQuery.of(context).size.width / 3.2,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: 20,
                                ),
                              )
                            : Container(
                                height: MediaQuery.of(context).size.height / 7,
                                width: MediaQuery.of(context).size.width / 3.2,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: ClipRRect(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  child: FadeInImage.assetNetwork(
                                    placeholder: 'images/opicxologo.png',
                                    image: "${ImgUrl}${Image4}",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 3.0),
                      child: GestureDetector(
                        onTap: () async {
                          var image = await Navigator.of(context).push(
                            FadeRouteTransition(
                                //  page: CollageSample(CollageType.VSplit)),
                                page: CollageGallaryScreen(
                              albumId: widget.albumId,
                              albumName: widget.albumName,
                              totalImg: widget.totalImg,
                            )),
                          );
                          setState(() {
                            Image5 = image;
                          });
                        },
                        child: Image5 == null
                            ? Container(
                                height: MediaQuery.of(context).size.height / 7,
                                width: MediaQuery.of(context).size.width / 3.2,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: 20,
                                ),
                              )
                            : Container(
                                height: MediaQuery.of(context).size.height / 7,
                                width: MediaQuery.of(context).size.width / 3.2,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: ClipRRect(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  child: FadeInImage.assetNetwork(
                                    placeholder: 'images/opicxologo.png',
                                    image: "${ImgUrl}${Image5}",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        var image = await Navigator.of(context).push(
                          FadeRouteTransition(
                              //  page: CollageSample(CollageType.VSplit)),
                              page: CollageGallaryScreen(
                            albumId: widget.albumId,
                            albumName: widget.albumName,
                            totalImg: widget.totalImg,
                          )),
                        );
                        setState(() {
                          Image6 = image;
                        });
                      },
                      child: Image6 == null
                          ? Container(
                              height: MediaQuery.of(context).size.height / 7,
                              width: MediaQuery.of(context).size.width / 3.2,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Icon(
                                Icons.add,
                                size: 20,
                              ),
                            )
                          : Container(
                              height: MediaQuery.of(context).size.height / 7,
                              width: MediaQuery.of(context).size.width / 3.2,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: ClipRRect(
                                borderRadius: new BorderRadius.circular(5.0),
                                child: FadeInImage.assetNetwork(
                                  placeholder: 'images/opicxologo.png',
                                  image: "${ImgUrl}${Image6}",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 3.0),
                      child: GestureDetector(
                        onTap: () async {
                          var image = await Navigator.of(context).push(
                            FadeRouteTransition(
                                //  page: CollageSample(CollageType.VSplit)),
                                page: CollageGallaryScreen(
                              albumId: widget.albumId,
                              albumName: widget.albumName,
                              totalImg: widget.totalImg,
                            )),
                          );
                          setState(() {
                            Image7 = image;
                          });
                        },
                        child: Image7 == null
                            ? Container(
                                height: MediaQuery.of(context).size.height / 7,
                                width: MediaQuery.of(context).size.width / 3.2,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: 20,
                                ),
                              )
                            : Container(
                                height: MediaQuery.of(context).size.height / 7,
                                width: MediaQuery.of(context).size.width / 3.2,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: ClipRRect(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  child: FadeInImage.assetNetwork(
                                    placeholder: 'images/opicxologo.png',
                                    image: "${ImgUrl}${Image7}",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 3.0),
                      child: GestureDetector(
                        onTap: () async {
                          var image = await Navigator.of(context).push(
                            FadeRouteTransition(
                                //  page: CollageSample(CollageType.VSplit)),
                                page: CollageGallaryScreen(
                              albumId: widget.albumId,
                              albumName: widget.albumName,
                              totalImg: widget.totalImg,
                            )),
                          );
                          setState(() {
                            Image8 = image;
                          });
                        },
                        child: Image8 == null
                            ? Container(
                                height: MediaQuery.of(context).size.height / 7,
                                width: MediaQuery.of(context).size.width / 3.2,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: 20,
                                ),
                              )
                            : Container(
                                height: MediaQuery.of(context).size.height / 7,
                                width: MediaQuery.of(context).size.width / 3.2,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: ClipRRect(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  child: FadeInImage.assetNetwork(
                                    placeholder: 'images/opicxologo.png',
                                    image: "${ImgUrl}${Image8}",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _requestPermission() async {
    PermissionHandler().requestPermissions(<PermissionGroup>[
      PermissionGroup.storage,
    ]);

    final info = PermissionGroup.storage.toString();
    print(info);
    _toastInfo(info);
  }

  _saveScreen() async {
    if (Image != null &&
        Image1 != null &&
        Image2 != null &&
        Image3 != null &&
        Image4 != null &&
        Image5 != null &&
        Image6 != null &&
        Image7 != null &&
        Image8 != null) {
      RenderRepaintBoundary boundary =
          _globalKey.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage();
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      final result =
          await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());

      print(result);
      _toastInfo(result.toString());
    }
  }

  _toastInfo(String info) {
    Fluttertoast.showToast(msg: info, toastLength: Toast.LENGTH_LONG);
  }
}
