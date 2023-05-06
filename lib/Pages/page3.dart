import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

import '../blocc/bloc_bloc.dart';
import '../componant/com.dart';

class OrderMenu extends StatefulWidget {
  const OrderMenu({super.key});

  @override
  State<OrderMenu> createState() => _OrderMenuState();
}

class _OrderMenuState extends State<OrderMenu> {
  int currentindx = 0;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(children: [
        ClipPath(
          clipper: Myclipp(),
          child: Stack(children: [
            Container(
              color: const Color(0xfffff3939),
              height: size.height / 4,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Center(
                  child: Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              )),
            ),
          ]),
        ),
        Container(
          height: size.height / 13,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            height: size.height / 7,
            child: Row(
              children: [
                const Image(
                    //height: 20,
                    //width: 20,
                    image: AssetImage('lib/assets/images/images (14).jpeg')),
                Container(
                  width: size.width / 20,
                ),
                const Text(
                  "5 ج.م",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: size.width / 8,
                ),
                Column(
                  children: [
                    const Text(
                      "طلب صغير",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "فول مدمس بالزيت الحار",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              BlocProvider.of<CounterBloc>(context)
                                  .add(DecreamentEvent());
                            },
                            icon: const Icon(
                                color: Color(0xfffff3939),
                                Icons.remove_circle_outline_sharp)),
                        BlocBuilder<CounterBloc, Counterstate>(
                          builder: (context, state) {
                            if (state is CounterInitial) {
                              return const Text(
                                '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              );
                            } else if (state is CounterValueChangedState) {
                              return Text(
                                state.counter.toString(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              );
                            } else
                              return const SizedBox();
                          },
                        ),
                        IconButton(
                            onPressed: () {
                              BlocProvider.of<CounterBloc>(context)
                                  .add(IncreamentEvent());
                            },
                            icon: const Icon(
                                color: Color(0xfffff3939),
                                Icons.add_circle_outline_sharp)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            height: size.height / 7,
            child: Row(
              children: [
                const Image(
                    //height: 20,
                    //width: 20,
                    image: AssetImage('lib/assets/images/images (23).jpeg')),
                Container(
                  width: size.width / 20,
                ),
                const Text(
                  "5 ج.م",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: size.width / 8,
                ),
                Column(
                  children: [
                    const Text(
                      "طلب وسط",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "فول مدمس بالزيت الحار",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              BlocProvider.of<CounterBloc>(context)
                                  .add(DecreamentEvent());
                            },
                            icon: const Icon(
                                color: Color(0xfffff3939),
                                Icons.remove_circle_outline_sharp)),
// ****
                        BlocBuilder<CounterBloc, Counterstate>(
                          builder: (context, state) {
                            if (state is CounterInitial) {
                              return const Text(
                                '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              );
                            } else if (state is CounterValueChangedState) {
                              return Text(
                                state.counter.toString(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              );
                            } else
                              return const SizedBox();
                          },
                        ),

                        IconButton(
                            onPressed: () {
                              BlocProvider.of<CounterBloc>(context)
                                  .add(IncreamentEvent());
                            },
                            icon: const Icon(
                                color: Color(0xfffff3939),
                                Icons.add_circle_outline_sharp)),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          height: size.height / 10,
        ),
        const Text(
          "25 ج.م",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 140),
          child: Myoutlinebutton(
              hinttext: 'اطلب', backgroundColor: const Color(0xfff409c74)),
        )
      ]),
      bottomNavigationBar: SnakeNavigationBar.color(
        //height: 110,
        selectedItemColor: Colors.white,
        snakeViewColor: const Color(0xfffff3939),
        unselectedItemColor: const Color(0xfffff3939),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'settings',
          )
        ],
        currentIndex: _selectedIndex,

        onTap: (indx) {
          setState(() {
            _selectedIndex = indx;
          });
        },
      ),
    );
  }
}
