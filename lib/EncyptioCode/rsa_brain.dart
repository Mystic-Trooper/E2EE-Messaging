import 'package:crypton/crypton.dart';

class RSABrain {
  RSABrain() {
    _myRsaKeypair = RSAKeypair.fromRandom();
  }

  RSAKeypair _myRsaKeypair;
  RSAPublicKey _receiverRsaPublicKey;

  void setReceiverPublicKey(String pubKey) {
    try {
      _receiverRsaPublicKey = RSAPublicKey.fromString(pubKey);
    } catch (error) {
      _receiverRsaPublicKey = null;
    }
    print("reciver public key is");
    print(_receiverRsaPublicKey);
  }

  String getOwnPublicKey() {
    return _myRsaKeypair.publicKey.toString();
  }

  String encryptTheSetterMessage(String message) {
    try {
      return _receiverRsaPublicKey.encrypt(message);
    } catch (error) {
      return null;
    }
  }

  String decryptTheGetterMessage(String message) {
    try {
      return _myRsaKeypair.privateKey.decrypt(message);
    } catch (error) {
      return null;
    }
  }
}
