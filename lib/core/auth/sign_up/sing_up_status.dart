// بعدين استخدمه من اريد اطوره 
class SignUpState {

  final bool isLoading;
  final bool isSuccess;
  final String? error;

  const SignUpState({
    this.isLoading = false,
     this.isSuccess = false,
    this.error,
  });

  SignUpState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? error,
  }) {
    return SignUpState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error,
    );
  }
}
