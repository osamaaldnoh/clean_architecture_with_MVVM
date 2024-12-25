abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  // Shared variables and function that will be used through any View Model
}

abstract class BaseViewModelInputs {
  void onStart(); // Start View Model Jop

  void dispose(); // Will be Called When View Model dis
}

abstract class BaseViewModelOutputs {
  // Will be Implemented later
}
