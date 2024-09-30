import 'package:flutter/material.dart';
import 'ipfs_service.dart';
import 'blockchain_service.dart';

class HealthRecordScreen extends StatefulWidget {
  const HealthRecordScreen({super.key});

  @override
  _HealthRecordScreenState createState() => _HealthRecordScreenState();
}

class _HealthRecordScreenState extends State<HealthRecordScreen> {
  String _statusMessage = "Upload your health record";

  Future<void> _uploadHealthRecord(String filePath) async {
    try {
      String ipfsHash = await IPFSService.uploadToIPFS(filePath);
      await BlockchainService().createHealthRecord(ipfsHash);
      setState(() {
        _statusMessage = "Health record uploaded successfully!";
      });
    } catch (e) {
      setState(() {
        _statusMessage = "Error: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Health Record'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_statusMessage),
            ElevatedButton(
              onPressed: () {
                // Example usage
                String sampleFilePath = 'path/to/health_record.txt';
                _uploadHealthRecord(sampleFilePath);
              },
              child: const Text('Upload Record'),
            ),
          ],
        ),
      ),
    );
  }
}
