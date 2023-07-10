/// Câu hỏi AI: flutter, check connectivity inside interceptors of dio
// class ConnectivityInterceptor extends Interceptor {
//   final Connectivity connectivity;
//
//   ConnectivityInterceptor(this.connectivity);
//
//   @override
//   Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
//     var connectivityResult = await connectivity.checkConnectivity();
//     if (connectivityResult == ConnectivityResult.none) {
//       throw DioError(
//         error: 'No internet connection',
//         requestOptions: options,
//       );
//     }
//     return super.onRequest(options, handler);
//   }
// }
// void main() {
//   final dio = Dio();
//   final connectivity = Connectivity();
//
//   dio.interceptors.add(ConnectivityInterceptor(connectivity));
//
//   // ...rest of your Dio configuration and API calls
// }
