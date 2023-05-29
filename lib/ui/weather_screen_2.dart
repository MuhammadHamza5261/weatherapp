import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:weathercheckapp/model/new_model.dart';
import '../bloc/weather_bloc.dart';
import '../bloc/weather_state.dart';
import '../model/weather_model.dart';


class WeatherApp2 extends StatelessWidget {
  const WeatherApp2({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: WeatherApp2STF(),
    );
  }
}
///stf
class WeatherApp2STF extends StatefulWidget {
  const WeatherApp2STF({Key? key}) : super(key: key);

  @override
  State<WeatherApp2STF> createState() => _WeatherApp2STFState();
}

class _WeatherApp2STFState extends State<WeatherApp2STF> {
  ///create a dynamic list  the help of model
  List<NewModel> myModelList =
  [
    NewModel('assets/images/w2.png','45','6777'),
    NewModel('assets/images/w2.png','50','8888'),
    NewModel('assets/images/w2.png','50','1111'),
    NewModel('assets/images/w2.png','50','2222'),
    NewModel('assets/images/w2.png','87','8999'),
    NewModel('assets/images/w2.png','98','6544'),
    NewModel('assets/images/w2.png','21','9866'),
    NewModel('assets/images/w2.png','18','0023'),
  ];






  late double width;
  late double height;


  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height =  MediaQuery.of(context).size.height;

    return SafeArea(
      child: Column(
        children: [
          const Center(
            child: Text('Tuesday, May 16',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          const Center(
            child: Text('San Francisco, CA',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),

          BlocBuilder<WeatherBloc,WeatherState>(
            builder: (context,state){
              if(state is WeatherInProgressState){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              else if(state is WeatherDataIsLoadedState){

                WeatherModel weatherModel = state.weatherModel;

                return Container(
                  child: Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          decoration: const  BoxDecoration(
                            // color: Colors.white,
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child:  Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20.0,),
                                  child: const Text('Cloud Pact:',
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 20.0,),
                                  child: Text('${weatherModel.cloudPct}',
                                    style: const TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          decoration: const  BoxDecoration(
                            // color: Colors.white,
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child:  Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 20.0,),
                                  child: const Text('Feels Like:',
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 20.0,),
                                  child: Text('${weatherModel.feelsLike}',
                                    style: const TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          decoration: const  BoxDecoration(
                            // color: Colors.white,
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child:  Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20.0,),
                                  child: Text('Humidity:',
                                    style: const TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 20.0,),
                                  child: Text('${weatherModel.humidity}',
                                    style: const TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),


                              ],
                            ),
                          ),
                        ),
                        const  SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          decoration: const  BoxDecoration(
                            // color: Colors.white,
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child:  Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20.0,),
                                  child: Text('Max Temp:',
                                    style: const TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 20.0,),
                                  child: Text('${weatherModel.maxTemp}',
                                    style: const TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          decoration: const  BoxDecoration(
                            // color: Colors.white,
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child:  Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20.0,),
                                  child: Text('Min Temp:',
                                    style: const TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 20.0,),
                                  child: Text('${weatherModel.minTemp}',
                                    style: const TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),


                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          decoration: const  BoxDecoration(
                            // color: Colors.white,
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child:  Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20.0,),
                                  child: Text('Sun Rice:',
                                    style: const TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 20.0,),
                                  child: Text('${weatherModel.sunrise}',
                                    style: const TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),


                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          decoration: const  BoxDecoration(
                            // color: Colors.white,
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child:  Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20.0,),
                                  child: Text('Wind Degrees:',
                                    style: const TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 20.0,),
                                  child: Text('${weatherModel.windDegrees}',
                                    style: const TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),


                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          decoration: const  BoxDecoration(
                            // color: Colors.white,
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child:  Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 20.0,),
                                  child: const Text('Wind Speed:',
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 20.0,),
                                  child: Text('${weatherModel.windSpeed}',
                                    style: const TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ///single child scroll view
                        // Container(
                        //   margin: EdgeInsets.only(left: 10.0,),
                        //   child: SingleChildScrollView(
                        //     scrollDirection: Axis.horizontal,
                        //     child: Row(
                        //       children: [
                        //         Column(
                        //           children: [
                        //             Container(
                        //               width: MediaQuery.of(context).size.width *0.15,
                        //               child: Image.asset('assets/images/w2.png'),
                        //             ),
                        //             Text('Now',
                        //               style: TextStyle(
                        //                 fontSize: 18.0,
                        //                 color: Colors.white
                        //               ),
                        //             ),
                        //             const SizedBox(
                        //               height: 10.0,
                        //             ),
                        //             Container(
                        //               child: Text('29',
                        //                 style: TextStyle(
                        //                   color: Colors.white,
                        //                   fontSize: 18.0,
                        //                 ),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //         Column(
                        //           children: [
                        //             Container(
                        //               width: MediaQuery.of(context).size.width *0.15,
                        //               child: Image.asset('assets/images/w2.png'),
                        //             ),
                        //             Container(
                        //               child: Text('21:00',
                        //                 style: TextStyle(
                        //                     fontSize: 18.0,
                        //                     color: Colors.white
                        //                 ),
                        //               ),
                        //             ),
                        //             SizedBox(
                        //               height: 10.0,
                        //             ),
                        //             Container(
                        //               child: Text('29',
                        //                 style: TextStyle(
                        //                   color: Colors.white,
                        //                   fontSize: 18.0,
                        //                 ),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //         Column(
                        //           children: [
                        //             Container(
                        //               width: MediaQuery.of(context).size.width *0.15,
                        //               child: Image.asset('assets/images/w2.png'),
                        //             ),
                        //             Container(
                        //               child: Text('22:00',
                        //                 style: TextStyle(
                        //                     fontSize: 18.0,
                        //                     color: Colors.white
                        //                 ),
                        //               ),
                        //             ),
                        //             SizedBox(
                        //               height: 10.0,
                        //             ),
                        //             Container(
                        //               child: Text('29',
                        //                 style: TextStyle(
                        //                   color: Colors.white,
                        //                   fontSize: 18.0,
                        //                 ),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //         Column(
                        //           children: [
                        //             SizedBox(
                        //               width: MediaQuery.of(context).size.width *0.15,
                        //               child: Image.asset('assets/images/w2.png'),
                        //             ),
                        //             const Text('23:00',
                        //               style: TextStyle(
                        //                   fontSize: 18.0,
                        //                   color: Colors.white
                        //               ),
                        //             ),
                        //             const SizedBox(
                        //               height: 10.0,
                        //             ),
                        //             const Text('29',
                        //               style: TextStyle(
                        //                 color: Colors.white,
                        //                 fontSize: 18.0,
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //         Column(
                        //           children: [
                        //             SizedBox(
                        //               width: MediaQuery.of(context).size.width *0.15,
                        //               child: Image.asset('assets/images/w2.png'),
                        //             ),
                        //             const Text('00:00',
                        //               style: TextStyle(
                        //                   fontSize: 18.0,
                        //                   color: Colors.white
                        //               ),
                        //             ),
                        //             const SizedBox(
                        //               height: 10.0,
                        //             ),
                        //             const Text('29',
                        //               style: TextStyle(
                        //                 color: Colors.white,
                        //                 fontSize: 18.0,
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //         Column(
                        //           children: [
                        //             SizedBox(
                        //               width: MediaQuery.of(context).size.width *0.15,
                        //               child: Image.asset('assets/images/w2.png'),
                        //             ),
                        //             const Text('1:00',
                        //               style: TextStyle(
                        //                   fontSize: 18.0,
                        //                   color: Colors.white
                        //               ),
                        //             ),
                        //             const SizedBox(
                        //               height: 10.0,
                        //             ),
                        //             const Text('29',
                        //               style: TextStyle(
                        //                 color: Colors.white,
                        //                 fontSize: 18.0,
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //         Column(
                        //           children: [
                        //             SizedBox(
                        //               width: MediaQuery.of(context).size.width *0.15,
                        //               child: Image.asset('assets/images/w2.png'),
                        //             ),
                        //             const Text('2:00',
                        //               style: TextStyle(
                        //                   fontSize: 18.0,
                        //                   color: Colors.white
                        //               ),
                        //             ),
                        //             const SizedBox(
                        //               height: 10.0,
                        //             ),
                        //             const Text('29',
                        //               style: TextStyle(
                        //                 color: Colors.white,
                        //                 fontSize: 18.0,
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        Container(
                          height: MediaQuery.of(context).size.height *0.15,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: myModelList.length,
                            itemBuilder: (BuildContext context, int index){
                              return Column(
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width *0.15,
                                          child: Image.asset('${myModelList[index].images}'),
                                        ),
                                         Text(
                                          '${myModelList[index].temp}',
                                          style: const TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          '${myModelList[index].time}',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 20.0,),
                              width: MediaQuery.of(context).size.width *0.1,
                              height: MediaQuery.of(context).size.height *0.05,
                              decoration:  BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(30.0,),
                              ),
                              child: const Icon(Icons.add,color: Colors.white,size: 24.0,),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 20.0,),
                              width: MediaQuery.of(context).size.width *0.1,
                              height: MediaQuery.of(context).size.height *0.05,
                              decoration:  BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(30.0,),
                              ),
                              child: const Icon(Icons.settings,color: Colors.white,size: 24.0,),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}

