import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:trivia/view/provider/trivia_provider.dart';

import 'core/routes/navigation.dart';
import 'core/services/network_service.dart';
import 'core/services/snackbar_service.dart';
import 'data/repository/trivia_repository.dart';
import 'domain/repository/trivia_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Providers
  sl.registerLazySingleton<ChangeNotifierProvider<TriviaProvider>>(
    () => ChangeNotifierProvider<TriviaProvider>(
      (ref) => TriviaProvider(triviaRepository: sl(), snackBarService: sl()),
    ),
  );

  // Repositories
  sl.registerLazySingleton<TriviaRepository>(
      () => TriviaRepositoryImpl(networkService: sl()));

  // Services
  sl.registerLazySingleton<SnackBarService>(() => SnackBarService());
  sl.registerLazySingleton<NetworkService>(() => NetworkService(dio: sl()));
  sl.registerLazySingleton<NavigationHandler>(() => NavigationHandlerImpl());

  // Externals
  sl.registerLazySingleton<Dio>(() => Dio());
}
