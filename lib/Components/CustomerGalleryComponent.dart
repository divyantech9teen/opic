import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pictiknew/Pages/Home.dart';
import 'package:pictiknew/Common/Constants.dart' as cnst;

class GalleryComponent extends StatefulWidget {
  var GalleryData;

  GalleryComponent(this.GalleryData);

  @override
  _GalleryComponentState createState() => _GalleryComponentState();
}

class _GalleryComponentState extends State<GalleryComponent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Isselected = ${widget.GalleryData["IsSelectionDone"]}");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Home(
                    widget.GalleryData["Id"].toString(),
                    widget.GalleryData["Title"].toString(),
                    widget.GalleryData["IsSelectionDone"].toString())));
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.27,
        width: MediaQuery.of(context).size.width * 0.85,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(9)),
          ),
          //color: Colors.green,
          margin: EdgeInsets.all(8),
          elevation: 6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 130,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: new BorderRadius.circular(9.0),
                  child: widget.GalleryData["GalleryCover"] != null
                      ? FadeInImage.assetNetwork(
                          placeholder: 'images/opicxologo.png',
                          image: "${widget.GalleryData["GalleryCover"]}",
                          fit: BoxFit.fitWidth,
                        )
                      : Image.asset(
                          'images/opicxologo.png',
                          height: 100,
                        ),
                ),
              ),
              /*Container(
                  height: 190,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(0, 0, 0, 0.5),
                        Color.fromRGBO(0, 0, 0, 0.5),
                        Color.fromRGBO(0, 0, 0, 0.5),
                        Color.fromRGBO(0, 0, 0, 0.5)
                      ],
                    ),
                    borderRadius: new BorderRadius.all(Radius.circular(6)),
                  ),
                ),*/
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  //height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 10),
                        child: Text(
                          '${widget.GalleryData["Title"]}',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.aBeeZee(
                            textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
