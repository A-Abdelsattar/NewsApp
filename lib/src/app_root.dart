import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/blocs/news/news_cubit.dart';
import 'package:news_app/screens/nav_bar_screen.dart';
import 'package:news_app/screens/offline_screen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => NewsCubit()..getBusiness())
            ],
            child: BlocConsumer<NewsCubit, NewsState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return MaterialApp(
                    home: OfflineBuilder(
                      connectivityBuilder: (
                        BuildContext context,
                        ConnectivityResult connectivity,
                        Widget child,
                      ) {
                        final bool connected = connectivity != ConnectivityResult.none;
                        if (connected){
                          return NavBarScreen();
                        }
                        else{
                          return OfflineScreen();
                        }
                      },
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    // const NavBarScreen(),
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                      scaffoldBackgroundColor: Colors.white,
                      primarySwatch: Colors.indigo,
                      appBarTheme: const AppBarTheme(
                          color: Colors.white,
                          elevation: 0,
                          titleTextStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                          iconTheme: IconThemeData(color: Colors.black)),
                      bottomNavigationBarTheme:
                          const BottomNavigationBarThemeData(
                              type: BottomNavigationBarType.fixed,
                              selectedItemColor: Colors.indigo),
                      textTheme: const TextTheme(
                          displaySmall: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                    ),
                    darkTheme: ThemeData(
                        scaffoldBackgroundColor: Colors.black54,
                        primarySwatch: Colors.indigo,
                        appBarTheme: const AppBarTheme(
                            color: Colors.black54,
                            elevation: 0,
                            titleTextStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                            //actionsIconTheme: IconThemeData(color: Colors.white),
                            iconTheme: IconThemeData(color: Colors.white)),
                        bottomNavigationBarTheme:
                            const BottomNavigationBarThemeData(
                                backgroundColor: Colors.black54,
                                type: BottomNavigationBarType.fixed,
                                unselectedItemColor: Colors.white,
                                elevation: 20,
                                selectedItemColor: Colors.indigo),
                        textTheme: const TextTheme(
                            displaySmall: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white))),
                    themeMode: NewsCubit.get(context).isDark
                        ? ThemeMode.dark
                        : ThemeMode.light,
                  );
                }),
          );
        });
  }
}
