import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanQrCode extends StatefulWidget {
  const ScanQrCode({super.key});

  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  String qrResult = 'Scanned Data will Appear here';

  Future<void> scanQR() async{

    try{
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff66666',
          'Cancel',
          true,
          ScanMode.QR
      );
      //if(!mounted) return;
      setState(() {
        qrResult = qrCode.toString();
      });
    }on PlatformException{
      qrResult = "Fail to read QR";
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("QR Scanner & Generator",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*.03,),
            Text(qrResult,style: const TextStyle(color: Colors.white,fontSize: 20),),
            SizedBox(height: MediaQuery.of(context).size.height*.03,),
            ElevatedButton(onPressed: scanQR, child:const Text("Scan Code")),
          ],
        ),
      ),
    );
  }
}
