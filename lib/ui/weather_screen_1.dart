import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:weathercheckapp/ui/weather_screen_2.dart';

import '../bloc/weather_bloc.dart';
import '../bloc/weather_event.dart';
import '../bloc/weather_state.dart';


class WeatherAppSTL extends StatelessWidget {
  const WeatherAppSTL({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.black,
      body: WeatherAppSTF(),
    );
  }
}

///stf
class WeatherAppSTF extends StatefulWidget {
  const WeatherAppSTF({Key? key}) : super(key: key);

  @override
  State<WeatherAppSTF> createState() => _WeatherAppSTFState();
}

class _WeatherAppSTFState extends State<WeatherAppSTF> {
  final _formKey = GlobalKey<FormState>();

  final countryController = TextEditingController();
  // String _textValue = '';
  late double width;
  late double height;

  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    ///bloc listner is used for call the functions
    return BlocListener<WeatherBloc, WeatherState>(
      listener: (context, state) {
        if (state is WeatherDataIsLoadedState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => WeatherApp2()),
          );
        }

        else if (state is WeatherErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
            ),
          );
        }
      },
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 70.0,
            ),
            Form(
              key: _formKey,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Image.asset('assets/images/w.png'),
                    ),
                   const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 17.0,),
                      width: width*0.93,
                      height: height*0.056,
                      child: TextFormField(
                        style: TextStyle(color: Colors.orange),
                        controller: countryController,
                        cursorColor: Colors.orange,
                        decoration: const InputDecoration(
                          labelText: 'Enter Your Country Name',
                          labelStyle: TextStyle(
                            color: Colors.orange
                          ),

                          contentPadding: EdgeInsets.only(left: 17.0,top:10.0,),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange,
                                width: 1.2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orange,
                              width: 1.2,
                            ),
                          ),
                          hintText: 'Email',
                        ),
                     validator: (value) {
                    if (value!.isEmpty) {
                    return 'Please enter your country';
                      }
                    return null;
                         },



                        keyboardType: TextInputType.text
                      ),

                    ),
                    // Container(
                    //   child: Padding(
                    //     padding: EdgeInsets.all(16.0),
                    //     child: Column(
                    //       children: [
                    //         TextFormField(
                    //           controller: countryController,
                    //           decoration: const InputDecoration(
                    //             fillColor: Colors.orange,
                    //             enabledBorder: OutlineInputBorder(
                    //               borderSide: BorderSide(color: Colors.orange),
                    //             ),
                    //
                    //             labelText: 'Enter some text',
                    //
                    //
                    //
                    //           ),
                    //           validator: (value) {
                    //             if (value!.isEmpty) {
                    //               return 'Please enter your country';
                    //             }
                    //             return null;
                    //           },
                    //           onChanged: (text) {
                    //             setState(() {
                    //               // _textValue = text;
                    //             });
                    //           },
                    //         ),
                    //         const  SizedBox(height: 16.0),
                    //         // Text('Entered City Name: $_textValue'),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    BlocBuilder<WeatherBloc, WeatherState>(
                        builder: (context, state) {
                          return Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.06,
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.orange
                              ),
                              child: state is WeatherInProgressState
                                  ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                                  : const Text(
                                'Check Weather',
                                style: TextStyle(
                                  fontSize: 23.0,
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  /// cal api on init method in flutter then they will run on when the app is start
                                  ///call the bloc method on init state
                                }
                                BlocProvider.of<WeatherBloc>(context).add(
                                  SetDataToWeatherEvent(
                                    country: countryController.text,
                                  ),
                                );
                              },
                            ),
                          );
                        }
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
