import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:proj_clean_arch/domain/state/home_state.dart';
import 'package:proj_clean_arch/internal/dependencies/home_page_module.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _latController = TextEditingController();
  final _lngController = TextEditingController();

  HomePageState _homePageState = HomePageModule.homePageState();

  @override
  void initState() {
    super.initState();
    _homePageState = HomePageModule.homePageState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: _getBody(),
      ),
    );
  }

  Widget _getBody() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _getRowInput(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getDay,
              child: const Text('Получить'),
            ),
            const SizedBox(height: 20),
            _getDayInfo()
          ],
        ),
      ),
    );
  }

  Widget _getRowInput() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _latController,
            keyboardType: const TextInputType.numberWithOptions(
                decimal: true, signed: true),
            decoration: const InputDecoration(hintText: 'Широта'),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: TextField(
            controller: _lngController,
            keyboardType: const TextInputType.numberWithOptions(
                decimal: true, signed: true),
            decoration: const InputDecoration(hintText: 'Долгота'),
          ),
        ),
      ],
    );
  }

  Widget _getDayInfo() {
    return Observer(
      builder: (_) {
        if (_homePageState.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        };
        if (_homePageState.day == null) return Container();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Восход: ${_homePageState.day!.sunrise.toLocal()}'),
            Text('Заход: ${_homePageState.day!.sunset.toLocal()}'),
            Text('Полдень: ${_homePageState.day!.solarNoon.toLocal()}'),
            Text('Продолжительность: ${Duration(seconds: _homePageState.day!.dayLength)}'),
          ],
        );
      },
    );
  }

  void _getDay() {
    final lat = double.tryParse(_latController.text);
    final lng = double.tryParse(_lngController.text);
    _homePageState.getDay(latitude: lat!, longitude: lng!);
  }
}
