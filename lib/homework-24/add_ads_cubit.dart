// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'add_ads_state.dart';

class AddAdsCubit extends Cubit<AddAdsState> {
  AddAdsCubit() : super(AddAds());

  final ImagePicker _image = ImagePicker();

  getImageCamera() {
    _image.pickImage(source: ImageSource.camera).then((value) async {
      if (value != null) {
        emit((state as AddAds).copyWith(imagePath: value.path));
      }
    });
  }

  getImageGallery() {
    _image.pickImage(source: ImageSource.gallery).then((value) async {
      if (value != null) {
        emit((state as AddAds).copyWith(imagePath: value.path));
      }
    });
  }

  clearImage() {
    emit((state as AddAds).copyWith(imagePath: ""));
  }
}
