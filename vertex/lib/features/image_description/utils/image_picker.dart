import 'package:image_picker/image_picker.dart';

Future<String> pickImage() async {
  final ImagePicker picker = ImagePicker();

  String selectedImage = '';
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  if (image != null) {
    selectedImage = image.path;
  }

  return selectedImage;
}
