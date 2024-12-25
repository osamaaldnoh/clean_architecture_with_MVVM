import 'dart:async';
import 'dart:ffi';

import 'package:clean_architecture_with_mvvm/domain/model/models.dart';
import 'package:clean_architecture_with_mvvm/presentation/base/baseviewmodel.dart';
import 'package:clean_architecture_with_mvvm/presentation/resources/app_strings.dart';

import '../../resources/assets_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  // Stream Controllers Outputs
  StreamController _streamController = StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void onStart() {
    // onStart
    _list = _getSliderViewObject();
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = ++_currentIndex;
    if (nextIndex == _list.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = --_currentIndex;
    if (previousIndex == -1) {
      previousIndex = _list.length - 1;
    }
    return previousIndex;
  }

  @override
  void onPageChange(int index) {
    // onPageChange
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  //OnBoarding ViewModel Outputs
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  void _postDataToView() {
    inputSliderViewObject.add(
        SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }

  List<SliderObject> _getSliderViewObject() => [
        SliderObject(AppStrings.onBoardingTitle1,
            AppStrings.onBoardingSubTitle1, ImageAssets.onboardingLogo1),
        SliderObject(AppStrings.onBoardingTitle2,
            AppStrings.onBoardingSubTitle2, ImageAssets.onboardingLogo2),
        SliderObject(AppStrings.onBoardingTitle3,
            AppStrings.onBoardingSubTitle3, ImageAssets.onboardingLogo3),
        SliderObject(AppStrings.onBoardingTitle4,
            AppStrings.onBoardingSubTitle4, ImageAssets.onboardingLogo4),
      ];
}

// Inputs Mean
abstract class OnBoardingViewModelInputs {
  int goNext(); // when user click right arrow or swipe left
  int goPrevious(); // when user click left arrow or swipe right
  void onPageChange(int index);

  // Stream Controllers Inputs
  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutputs {
  // Stream Controllers Outputs
  Stream<SliderViewObject> get outputSliderViewObject;
}
