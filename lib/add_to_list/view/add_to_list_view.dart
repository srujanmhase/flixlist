import 'package:flixlist/add_to_list/cubit/add_to_list_cubit.dart';
import 'package:flixlist/auth/auth_repository.dart';
import 'package:flixlist/services/firestore_repository.dart';
import 'package:flixlist/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AddtoList extends StatefulWidget {
  const AddtoList({Key? key, required this.movieID}) : super(key: key);
  final String movieID;
  @override
  State<AddtoList> createState() => _AddtoListState();
}

class _AddtoListState extends State<AddtoList> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddToListCubit(
        context.read<AuthRepository>(),
        context.read<FirestoreRepository>(),
      ),
      child: AddToListView(
        movieID: widget.movieID,
      ),
    );
  }
}

class AddToListView extends StatefulWidget {
  const AddToListView({Key? key, required this.movieID}) : super(key: key);
  final String movieID;
  @override
  State<AddToListView> createState() => _AddToListViewState();
}

class _AddToListViewState extends State<AddToListView> {
  @override
  void initState() {
    super.initState();
    context.read<AddToListCubit>().fetchYourLists();
  }

  final _listNameController = TextEditingController();

  final List<bool> _selected = <bool>[
    true,
    false,
  ];
  List<Widget> options = <Widget>[
    Text(
      'Private',
      style: TextStyle(
        color: Colors.black,
      ),
    ),
    Text(
      'Public',
      style: TextStyle(
        color: Colors.black,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddToListCubit, AddToListState>(
      listener: (context, state) {
        if (state.movieAdded) Navigator.of(context).pop();
        if (state.error != null) {
          AppUtils.showSnackBar(context, 'Something went wrong');
          Navigator.of(context).pop();
        }
      },
      listenWhen: ((previous, current) => previous != current),
      builder: (context, state) {
        if (state.error != null) {
          return const SizedBox();
        }
        if (state.isLoading) {
          return Column(
            children: [
              Container(
                height: 100,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: CupertinoActivityIndicator(
                  color: Colors.white,
                ),
              ),
            ],
          );
        }
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Material(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add to a Flixlist',
                    style: GoogleFonts.leagueGothic(
                      fontSize: 36,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: TextFormField(
                              controller: _listNameController,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ToggleButtons(
                            onPressed: (int index) {
                              setState(() {
                                // The button that is tapped is set to true, and the others to false.
                                for (int i = 0; i < _selected.length; i++) {
                                  _selected[i] = i == index;
                                }
                              });
                            },
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            selectedBorderColor: Colors.grey[700],
                            selectedColor: Colors.white,
                            fillColor: Colors.grey[200],
                            color: Colors.grey[400],
                            constraints: const BoxConstraints(
                              minHeight: 40.0,
                              minWidth: 80.0,
                            ),
                            isSelected: _selected,
                            children: options,
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_listNameController.text.isNotEmpty) {
                            context.read<AddToListCubit>().addMovieToNewList(
                                  listName: _listNameController.text,
                                  movieID: widget.movieID,
                                  private: _selected.indexOf(true) == 0
                                      ? true
                                      : false,
                                );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: StadiumBorder(),
                          side: BorderSide(),
                          elevation: 0,
                        ),
                        child: Text(
                          'New List',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Existing Lists',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    width: 350,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.yourLists.length,
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                      itemBuilder: (context, index) {
                        return Center(
                          child: InkWell(
                            onTap: () {
                              context
                                  .read<AddToListCubit>()
                                  .addMovieToExistingList(
                                    listID: state.yourLists[index].uuid,
                                    movieID: widget.movieID,
                                    private: state.yourLists[index].private,
                                  );
                            },
                            child: Container(
                              height: 100,
                              width: 145,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    offset: Offset(7, 4),
                                    blurRadius: 12,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  state.yourLists[index].title,
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
