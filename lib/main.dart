import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';


void main(){
  runApp(new MyApp());

}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    title:"Pharmacie Application",
    debugShowCheckedModeBanner: false,
    theme:new ThemeData(
      primarySwatch: Colors.green
    ),
    home: Home(),
  );
  }
}


class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
 return new _Home();

  }

}
class _Home extends State<Home> {
  String barcodeValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.local_pharmacy_rounded),
        title: Text("Pharmac'app"),
        toolbarHeight: 100,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            margin: EdgeInsets.zero,
            child: CarouselSlider(
              disableGesture: mounted,
              items: <Widget>[
                // Ajoutez les widgets que vous souhaitez afficher dans le carrousel ici
                Image.asset('assets/anxieties-g91bc99650_1280.jpg'),
                Image.asset('assets/first-aid-g3f0338df2_1280.jpg'),
                Image.asset('assets/health-gd7b806b28_1280.jpg'),
                Image.asset('assets/medications-g3b7c5e827_1280.jpg'),
                Image.asset('assets/vitamins-g7869f22b8_1280.jpg'),
              ],
              options: CarouselOptions(
                height: 300, // Hauteur du carrousel
                autoPlay: true, // Lecture automatique
                autoPlayCurve: Curves.decelerate,
                enlargeCenterPage: true,
                viewportFraction: 1,
                pageSnapping: false,
               pauseAutoPlayOnTouch: true,
                  animateToClosest: true,
                // Ajoutez d'autres options selon vos besoins
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 20.0,
            direction: Axis.vertical,
            children: [
              SizedBox(
                width: 300.0,
                height: 60.0,
                child: ElevatedButton(
                  onPressed: () {
                    // Action du premier bouton
                  },

                  child: Text('Commandes'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.green,

                    // Couleur personnalisée
                  ),
                ),
              ),
              SizedBox(
                width: 300.0,
                height: 60.0,
                child: ElevatedButton(
                  onPressed: () {
                    // Action du deuxième bouton
                  },
                  child: Text('Recherches'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.green,// Couleur personnalisée
                  ),
                ),
              ),
              SizedBox(
                width: 300.0,
                height: 60.0,
                child: ElevatedButton(
                  onPressed: () {
                    // Action du troisième bouton
                  },

                  child: Text('Stock de médicaments'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.green,// Couleur personnalisée
                  ),

                ),
              ),

            ],


          ),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(

        onPressed: () async {
          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              '#ff6666',  // Couleur personnalisée pour la barre de scan
              'Annuler',  // Texte du bouton d'annulation
              true,       // Afficher l'icône de flash
              ScanMode.BARCODE  // Mode de numérisation du code-barres
          );
          setState(() {
            barcodeValue = barcodeScanRes;
          });
          print(barcodeValue);
          Fluttertoast.showToast(
            msg: "Code-barres scanné : $barcodeValue",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
          );


        },
        icon: Icon(Icons.qr_code_scanner),
        label: Text('scan'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,


    );
  }
}



