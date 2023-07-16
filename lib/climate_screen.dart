import 'package:climate_bloc/climate_bloc/climate_event.dart';
import 'package:climate_bloc/climate_bloc/climate_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:climate_bloc/climate_bloc/climate_bloc.dart';

class ClimateScreen extends StatelessWidget {
  ClimateScreen({super.key});
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Climate App'),
      ),
      body: BlocBuilder<ClimateBloc, ClimateState>(builder: (context, state) {
        if (state is ClimateLoadedState) {
          return Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(state.cityName),
              Text(state.temperature.toString()),
            ]),
          );
        } else if (state is InitialClimateState) {
          return Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text("Enter City Name"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                        hintText: 'Pune',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<ClimateBloc>(context)
                          .add(GetClimate(_controller.text));
                    },
                    child: const Text('Get Weather'))
              ],
            ),
          );
        } else if (state is ClimateLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ClimateErrorState) {
          return const Center(
            child: Text('Error'),
          );
        }
        return Container();
      }),
    );
  }
}
