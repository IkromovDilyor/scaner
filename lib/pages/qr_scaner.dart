
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanPage extends StatefulWidget {
  static final String id="scan_page";
  const ScanPage({Key? key}) : super(key: key);

  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final qrKey=GlobalKey(debugLabel: "QR");
  QRViewController ? controller;
  @override
  void dispose() {
    controller?.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  Barcode? barcode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children:<Widget> [
          builQrView(context),
          Positioned(child: builResult(),bottom: 10,),
          Positioned(child: buildControlButtons(),top: 10,)

        ],
      ),
    );
  }
  builQrView(BuildContext context)=>QRView(
    key: qrKey,
    onQRViewCreated: onQRViewCreated,
    overlay: QrScannerOverlayShape(
      cutOutSize: MediaQuery.of(context).size.width*0.8,
      borderWidth: 10,
      borderLength: 20,
      borderRadius: 10,
      borderColor: Theme.of(context).accentColor,
    ),

  );
  void onQRViewCreated(QRViewController controller){
    setState(() {
      this.controller=controller;
    });
    controller.scannedDataStream.listen((  barcode) {
      setState(() {
        this.barcode=barcode;
      });
    });
  }
  Widget builResult () =>Container(
    padding: EdgeInsets.all(12),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(8),
      color: Colors.white
      ),
      child:Text(
  barcode!=null?"Result${barcode!.code}": "Scan a code!",
  maxLines: 3,

  )
  ) ;



  Widget buildControlButtons()=>Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [

   IconButton(
    icon: Icon(Icons.flash_off,color: Colors.white,),
    onPressed: ()async{
      await controller?.toggleFlash();
    },
  ),
      IconButton(
        icon: Icon(Icons.camera_alt_outlined,color: Colors.white,),
        onPressed: ()async{
          await controller?.flipCamera();
        },
      ),


    ],
  );

}
