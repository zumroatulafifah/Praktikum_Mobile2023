import 'package:get/get.dart';
import 'package:newsapp/app/modules/home/news/controllers/news_controller.dart';
// import 'package:public_api/app/modules/web_view/controllers/web_controller.dart';

class WebBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsController>(
      () => NewsController(),
    );
    Get.put(NewsController());
  }
}
