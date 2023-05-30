import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jsonplaceholder_photos/bloc/bloc.dart';

class PhotosPage extends StatefulWidget {
  const PhotosPage({Key? key}) : super(key: key);

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<PhotosBloc>().add(GetPhotosEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("https://jsonplaceholder.typicode.com/photos"),
      ),
      body: BlocBuilder<PhotosBloc, PhotoState>(builder: (_, state) {
        return GridView.builder(
          itemCount: state.list.length,
          padding: const EdgeInsets.all(5),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: [
                Positioned(
                  child: Image.network(
                    state.list[index].url ?? "",
                    errorBuilder: (_, __, ___) {
                      return Container(
                        height: double.infinity,
                        width: double.infinity,
                        color: Colors.red,
                      );
                    },
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 5,
                    child: Text(
                      state.list[index].title ?? "",
                      style: const TextStyle(fontSize: 6),
                    )),
              ],
            );
          },
        );
      }),
    );
  }
}
