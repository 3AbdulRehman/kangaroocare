
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kangaroocare/view/screen/home.dart';
import 'package:kangaroocare/view_model/Controller/Auto_Generate.dart';


FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

NumberController controller = Get.put(NumberController());

Future<void> saveNumberToFirebase(String mr)async {
try{
  String formattedNumber = controller.getFormattedNumber();

  // Generate a unique document ID
  String mr = formattedNumber;

  await firebaseFirestore.collection('users').doc(mr).set({
    /*'name': name,
    'age': age,
    'contactNumber': contactNumber,*/
    'mr': mr.toString(),
  });
   controller.incrementNumber();
   Get.to(home());
  Get.snackbar('Success', 'Welcome To KangarooCare!',
      snackPosition: SnackPosition.BOTTOM);

  print(formattedNumber);


}catch(e){
  print("Error : $e");
}
}

