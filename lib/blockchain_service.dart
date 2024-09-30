import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';
import 'constants.dart';

class BlockchainService {
  final Web3Client _client;

  BlockchainService() : _client = Web3Client(Constants.rpcUrl, Client());

  Future<void> createHealthRecord(String ipfsHash) async {
    // Load contract and credentials
    final contract = await _loadContract();
    final credentials = EthPrivateKey.fromHex(Constants.privateKey);

    // Prepare transaction
    final createRecordFunction = contract.function('createRecord');
    await _client.sendTransaction(
      credentials,
      Transaction.callContract(
        contract: contract,
        function: createRecordFunction,
        parameters: [ipfsHash],
      ),
    );
  }

  Future<DeployedContract> _loadContract() async {
    final abi = await rootBundle.loadString('contracts/HealthRecordsABI.json');
    return DeployedContract(ContractAbi.fromJson(abi, 'HealthRecords'),
        EthereumAddress.fromHex(Constants.contractAddress));
  }
}
