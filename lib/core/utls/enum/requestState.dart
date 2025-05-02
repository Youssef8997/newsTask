import 'package:flutter/material.dart';

enum RequestState {
  loading,
  loaded,
  error,
}
class RequestStateBuilder extends StatelessWidget {
  final RequestState state;
  final String? message;
  final Widget Function()? onLoading;
  final Widget Function()? onLoaded;

  const RequestStateBuilder({
    Key? key,
    required this.state,
    this.onLoading,
     this.message,
    this.onLoaded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case RequestState.loading:
        return onLoading?.call() ?? const Center(child: CircularProgressIndicator(color: Colors.black,));

      case RequestState.error:
        return  Center(
              child: Text(
                message??"",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
            );

      case RequestState.loaded:
        return onLoaded?.call() ?? const SizedBox.shrink();
    }
  }
}