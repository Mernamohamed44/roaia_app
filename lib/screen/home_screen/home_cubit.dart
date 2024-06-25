import 'package:bloc/bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final MapController mapController = MapController();
  LatLng markerPosition = LatLng(0,0);
  //Future<void> _updateLocation() async {
//     // قم بإرسال طلب HTTP للحصول على الموقع الجديد (استخدم مكتبة http)
//     // يجب تعديل الطلب حسب سير العمل الخاص بك
//     final response = await http.get(Uri.parse('YOUR_API_ENDPOINT'));
//     if (response.statusCode == 200) {
//       // استخراج الإحداثيات من الاستجابة (يجب تعديلها وفقًا لتنسيق الاستجابة المتوقع)
//       final latitude = double.parse(response.body['latitude']);
//       final longitude = double.parse(response.body['longitude']);
//       setState(() {
//         markerPosition = LatLng(latitude, longitude);
//       });
//     } else {
//       // إدارة الأخطاء هنا
//     }
//   }
 //Timer.periodic(Duration(minutes: 5), (Timer timer) {
//       _updateLocation();
//     });
}
