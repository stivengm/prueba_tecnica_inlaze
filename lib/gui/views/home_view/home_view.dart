import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:prueba_tecnica_inlaze/core/bloc/home_bloc/home_bloc.dart';
import 'package:prueba_tecnica_inlaze/core/model/book_data.dart';
import 'package:prueba_tecnica_inlaze/core/presenter/home_presenter.dart';
import 'package:prueba_tecnica_inlaze/core/services/shared_preferences/key_value_storage_impl.dart';
import 'package:prueba_tecnica_inlaze/gui/app_style.dart';
import 'package:prueba_tecnica_inlaze/gui/views/details_book_view/details_book_view.dart';
import 'package:prueba_tecnica_inlaze/gui/views/home_view/home_viewmodel.dart';
import 'package:prueba_tecnica_inlaze/gui/views/home_view/widgets/header_sections_books.dart';
import 'package:prueba_tecnica_inlaze/gui/widgets/loader_app_widget.dart';
import 'package:prueba_tecnica_inlaze/gui/widgets/primary_button.dart';
import 'package:prueba_tecnica_inlaze/gui/widgets/rich_text_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> implements HomeViewModel {
  late HomePresenter _homePresenter;
  TextEditingController searchController = TextEditingController();

  _HomeViewState() {
    _homePresenter = HomePresenter(this);
  }

  @override
  void showBooksList(List<Book> items) {
    context.read<HomeBloc>().add(const HandleLoader(false));
    context.read<HomeBloc>().add( HandleBooks(items) );
  }

  @override
  void searchBooksList(List<Book> items, String searchValue, bool eventSearch) {
    context.read<HomeBloc>().add(HandleValueSearch(searchValue));
    context.read<HomeBloc>().add(HandleResultSearch(items));
    var searchRecient = context.read<HomeBloc>().state.searchRecient!;
    List<String> newValueSearch = [];
    
    if (eventSearch) {
      if (searchRecient.isEmpty) {
        newValueSearch.add(searchValue);
      } else {
        newValueSearch = searchRecient;
        if (!searchRecient.contains(searchValue)) {
          newValueSearch.add(searchValue);
        }
        if (searchRecient.length > 5) {
          searchRecient.removeAt(0);
        }
      }
      context.read<HomeBloc>().add(SearchRecient(newValueSearch));
    }
    context.read<HomeBloc>().add(HandleValueSearch(searchValue));
  }

  @override
  void showError() {
    // TODO: implement showError
  }

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(const HandleLoader(true));
    _homePresenter.getNewBooks();
  }

  void openDialogEditTask(context) async {
    final keyValueStorageImpl = KeyValueStorageImpl();

    final email = await keyValueStorageImpl.getValue<String>('email');
    final password = await keyValueStorageImpl.getValue<String>('password');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("SharedPreferences", style: Theme.of(context).textTheme.headlineLarge!.copyWith( fontWeight: FontWeight.bold, fontSize: 20.0 ), textAlign: TextAlign.center,),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichTextWidget(name: "Email: ", value: "$email"),
            const SizedBox(height: 10.0),
            RichTextWidget(name: "Contraseña: ", value: "$password"),
          ],
        ),
        actions: [
          SizedBox(
            child: PrimaryButton(
              text: 'Aceptar', 
              onPressed: () {
                Navigator.pop(context);
              }
            ),
          )
        ],
      )
    );

  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return state.isLoading && state.books!.isEmpty
          ? const LoaderApp() 
          : Scaffold(
            backgroundColor: backgroundApp,
            appBar: AppBar(
              backgroundColor: backgroundApp,
              actions: [
                IconButton(
                  onPressed: () => openDialogEditTask(context),
                  icon: const Icon(
                    Icons.notifications
                  )
                )
              ],
            ),
            body: RefreshIndicator(
              onRefresh: () {
                return Future.delayed(const Duration(seconds: 2), () {
                  context.read<HomeBloc>().add(const HandleLoader(true));
                  context.read<HomeBloc>().add(const HandleBooks([]));
                  _homePresenter.saveSearchRecient("", false);
                  searchController.text = "";
                  _homePresenter.getNewBooks();
                });
              },
              child: GestureDetector(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  context.read<HomeBloc>().add( const HandleFocusSearch(false) );
                },
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0, top: 20.0, right: 25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Explorar más...", style: Theme.of(context).textTheme.headlineMedium!.copyWith( fontSize: 20.0 )),
                              const SizedBox(height: 10.0),
                              TextField(
                                controller: searchController,
                                textInputAction: TextInputAction.search,
                                keyboardType: TextInputType.text,
                                onChanged: (value) {
                                  _homePresenter.saveSearchRecient(value, false);
                                },
                                onTap: () {
                                  context.read<HomeBloc>().add( const HandleFocusSearch(true) );
                                },
                                onSubmitted: (value) {
                                  _homePresenter.saveSearchRecient(value, true);
                                },
                                decoration: InputDecoration(
                                  hintText: 'Buscar',
                                  // helperText: "Ejemplo: Flutter, C#, NodeJs",
                                  // helperStyle: const TextStyle(fontSize: 10.0),
                                  hintStyle: const TextStyle(fontSize: 16),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      if (state.valueSearch != "") {
                                        searchController.text = "";
                                        _homePresenter.saveSearchRecient("", false);
                                      }
                                    },
                                    icon: state.valueSearch != "" ? const Icon(
                                      Icons.close
                                    ) : const Icon(
                                      Icons.search
                                    )
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: const Radius.circular(8),
                                      topRight: const Radius.circular(8),
                                      bottomLeft: state.isFocusedSearch && state.searchRecient!.isNotEmpty ? const Radius.circular(0) : const Radius.circular(8),
                                      bottomRight: state.isFocusedSearch && state.searchRecient!.isNotEmpty ? const Radius.circular(0) : const Radius.circular(8)
                                    ),
                                    borderSide: const BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: whiteColor,
                                  contentPadding: const EdgeInsets.all(16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        state.valueSearch != "" 
                        ? ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: state.resultsSearch!.length,
                          itemBuilder: (context, i) {
                            var newBook = Book(
                              image: state.resultsSearch![i].image,
                              isbn13: 'search-${state.resultsSearch![i].isbn13}',
                              price: state.resultsSearch![i].price,
                              subtitle: state.resultsSearch![i].subtitle,
                              title: state.resultsSearch![i].title,
                              url: state.resultsSearch![i].url
                            );
                            return ListTile(
                              leading: Hero(
                                tag: newBook.isbn13,
                                child: FadeInImage(
                                  fadeInDuration: const Duration(milliseconds: 200),
                                  placeholder: const AssetImage('assets/loader_image.gif'),
                                  image: NetworkImage(newBook.image),
                                ),
                              ),
                              trailing: const FaIcon(
                                FontAwesomeIcons.arrowRight
                              ),
                              title: Text(newBook.title),
                              subtitle: Text(newBook.subtitle),
                              onTap: () {
                                Navigator.pushNamed(context, 'details_book', arguments: DetailsBookArguments(newBook));
                                context.read<HomeBloc>().add( const HandleFocusSearch(false) );
                                FocusManager.instance.primaryFocus?.unfocus();
                                _homePresenter.saveSearchRecient(searchController.text.trim(), true);
                              },
                            );
                          }
                        )
                        : Stack(
                          children: [
                            Column(
                              children: [
                                const SizedBox(height: 20.0),
                                HeaderSectionsBooks(
                                  books: state.books!,
                                  nameSection: "Nuevos libros",
                                ),
                              ],
                            ),
                            // Búsqueda
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 5),
                              child: Text("Ejemplo: Flutter, C#, NodeJs", style: Theme.of(context).textTheme.headlineSmall!.copyWith( fontSize: 10.0 ),),
                            ),
                            state.isFocusedSearch && state.searchRecient!.isNotEmpty ? Container(
                              margin: const EdgeInsets.symmetric(horizontal: 25.0),
                              decoration: BoxDecoration(
                                color: whiteColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemCount: state.searchRecient!.length,
                                itemBuilder: (context, i) {
                                  return ListTile(
                                    title: Text(state.searchRecient![i]),
                                    trailing: IconButton(
                                      onPressed: () {
                                        List<String> searchRecient = state.searchRecient!;
                                        searchRecient.removeAt(i);
                                        context.read<HomeBloc>().add( SearchRecient(searchRecient) );
                                        context.read<HomeBloc>().add( const HandleFocusSearch(false) );
                                        FocusManager.instance.primaryFocus?.unfocus();
                                      },
                                      icon: const Icon(
                                        Icons.close
                                      ),
                                    ),
                                    onTap: () {
                                      searchController.text = state.searchRecient![i];
                                      _homePresenter.saveSearchRecient(state.searchRecient![i], false);
                                      FocusManager.instance.primaryFocus?.unfocus();
                                    },
                                  );
                                }
                              ),
                            ) : const SizedBox(),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: 0,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  label: 'Inicio',
                  icon: FaIcon(
                    FontAwesomeIcons.houseChimney
                  )
                ),
                BottomNavigationBarItem(
                  label: 'Favoritos',
                  icon: FaIcon(
                    FontAwesomeIcons.heart
                  )
                ),
                BottomNavigationBarItem(
                  label: 'Configuración',
                  icon: FaIcon(
                    FontAwesomeIcons.gear
                  )
                )
              ],
              selectedItemColor: primaryColor,
              onTap: (i) {
                context.read<HomeBloc>().add( const HandleFocusSearch(false) );
                FocusManager.instance.primaryFocus?.unfocus();
                _homePresenter.saveSearchRecient("", false);
                searchController.text = "";
              },
            ),
          );
      },
    );
  }
}
