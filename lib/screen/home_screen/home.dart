import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roaia_app/screen/home_screen/components/custom_drawer.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:roaia_app/screen/home_screen/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    // الإحداثيات الابتدائية
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return FlutterMap(
            mapController: cubit.mapController,
            options: MapOptions(
              center: cubit.markerPosition,
              zoom: 10.0,
            ),
            children: [
              TileLayer(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: cubit.markerPosition,
                    builder: (ctx) =>
                        Container(
                          child: Icon(
                            Icons.location_on,
                            color: Colors.red,
                            size: 40.0,
                          ),
                        ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
      endDrawer: CustomDrawer(),
    );
  }
}
