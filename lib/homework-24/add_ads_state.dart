part of 'add_ads_cubit.dart';

@immutable
abstract class AddAdsState {}

class AddAdsInitial extends AddAdsState {}

// ignore: must_be_immutable
class AddAds extends AddAdsState {
  String imagePath;
  String name;

  AddAds({this.imagePath = "", this.name = ""});

  AddAds copyWith({String? imagePath, String? name}) {
    return AddAds(
        imagePath: imagePath ?? this.imagePath, name: name ?? this.name);
  }
}
