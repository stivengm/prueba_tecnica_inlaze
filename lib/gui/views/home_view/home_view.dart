import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prueba_tecnica_inlaze/core/bloc/home_bloc/home_bloc.dart';
import 'package:prueba_tecnica_inlaze/core/model/book_data.dart';
import 'package:prueba_tecnica_inlaze/core/presenter/home_presenter.dart';
import 'package:prueba_tecnica_inlaze/gui/app_style.dart';
import 'package:prueba_tecnica_inlaze/gui/views/home_view/home_viewmodel.dart';
import 'package:prueba_tecnica_inlaze/gui/views/home_view/widgets/header_sections_books.dart';
import 'package:prueba_tecnica_inlaze/gui/widgets/loader_app_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> implements HomeViewModel {
  late HomePresenter _homePresenter;
  late List<Book> books = [];

  _HomeViewState() {
    _homePresenter = HomePresenter(this);
  }

  @override
  void showContactList(List<Book> items) {
    context.read<HomeBloc>().add(const HandleLoader(false));
    setState(() {
      books = items;
    });
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return state.isLoading 
          ? const LoaderApp() 
          : Scaffold(
            backgroundColor: backgroundApp,
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.notifications))
              ],
            ),
            body: RefreshIndicator(
              onRefresh: () {
                return Future.delayed(const Duration(seconds: 2), () {
                  _homePresenter.getNewBooks();
                });
              },
              child: GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Explorar más.."),
                              const SizedBox(height: 10.0),
                              TextField(
                                textInputAction: TextInputAction.search,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: 'Buscar',
                                  hintStyle: const TextStyle(fontSize: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
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
                        HeaderSectionsBooks(
                          books: books,
                          nameSection: "Nuevos libros",
                        ),
                        // TODO: Crear una lista de libros vistos recientemente.
                      ],
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
