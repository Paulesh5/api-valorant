import 'package:flutter/material.dart';
import '../services/api_service.dart';

class PokemonProvider with ChangeNotifier {
  List<String> _agentPortraits = [];
  bool _isLoading = false;

  List<String> get agentPortraits => _agentPortraits;
  bool get isLoading => _isLoading;

  Future<void> fetchAgentPortraits() async {
    _isLoading = true;
    notifyListeners();

    try {
      ApiService apiService = ApiService();
      _agentPortraits = await apiService.fetchAgentPortraits();
    } catch (e) {
      // errores
    }

    _isLoading = false;
    notifyListeners();
  }
}
