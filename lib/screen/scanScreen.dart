import 'package:flutter/material.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  String _nfcMessage = "Ready to scan";

  Future<void> _startNfcScan() async {
    try {
      setState(() {
        _nfcMessage = "Scanning...";
      });

      var tag = await FlutterNfcKit.poll();

      setState(() {
        _nfcMessage = "NFC Tag Scanned:\nID: ${tag.id}";
      });
    } catch (e) {
      setState(() {
        _nfcMessage = "Error scanning NFC tag";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan NFC Tag'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/nfc.png', // Add your image asset here
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Tap the button below to start scanning NFC tags',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _startNfcScan,
              child: Text('Start Scanning'),
            ),
            SizedBox(height: 20),
            Text(
              _nfcMessage,
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
