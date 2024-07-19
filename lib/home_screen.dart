import 'package:flutter/material.dart';
import 'package:qr_code_scanner_and_generator/generate_qr_code.dart';
import 'package:qr_code_scanner_and_generator/scan_qr_code.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context)=>const ScanQrCode()
                        )
                    );
                  });
                },
                child:const Text("Scan QR code"),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.02,),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context)=>const GenerateQrCode()
                      )
                  );
                });
              },
              style:const ButtonStyle(

              ),
              child:const Text("Generate QR code"),
            ),
          ],
        ),
      ),
    );
  }
}
