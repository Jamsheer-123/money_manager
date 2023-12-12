part of 'catagory_bloc.dart';

@freezed
class CatagoryEvent with _$CatagoryEvent {
  //  this event change the  catgory type (radio button)
  factory CatagoryEvent.chageCatgory() = ChangeCatagoryType;

  //  this event change the  catgory type (radio button)
  factory CatagoryEvent.getCatagory() = GetCatagory;

  //  this event get all catgory

  factory CatagoryEvent.getSpecifedCatagory() = GetSpecifedCatagory;

  factory CatagoryEvent.addCatagory({required CatagoryModel catagoryModel}) =
      AddCatagory;
}
