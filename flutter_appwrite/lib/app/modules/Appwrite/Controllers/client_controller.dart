import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';

class ClientController extends GetxController {
  Client client = Client();
  @override
  void onInit() {
    super.onInit();
// appwrite
    // const endPoint = "https://192.168.74.28:8181/v1";
    const endPoint = "https://cloud.appwrite.io/v1";

    const projectID = "65657dcced98145f1ed8";
    // const projectID ="6568a566bad7dbc1b491";
    client
        .setEndpoint(endPoint)
        .setProject(projectID)
        .setSelfSigned(status: true);
  }
}
