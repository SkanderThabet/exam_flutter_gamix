import 'package:exam_gamix/models/pays_model.dart';
import 'package:exam_gamix/repository/pays_repository.dart';

class PaysController {
  late final PaysRepository _paysRepository;

  PaysController(this._paysRepository);

  Future<List<PaysModel>> fetchCountries() async {
    return _paysRepository.getPays();
  }

}
