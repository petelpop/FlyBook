import 'package:airplane/models/destination.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DestinationService {
  CollectionReference _destinationRef = FirebaseFirestore.instance.collection('destinations');

  Future<List<DestinationModel>> fetchDestination() async{
    try {
      QuerySnapshot result = await _destinationRef.get();

      List<DestinationModel> destinations = result.docs.map((e){
        return DestinationModel.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return destinations;
    } catch (e) {
      throw e;
    }
  }
}