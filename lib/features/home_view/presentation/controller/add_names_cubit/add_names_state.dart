part of 'add_names_cubit.dart';

sealed class AddNamesState {}

final class AddNamesInitial extends AddNamesState {}
final class AddNamesSuccessfully extends AddNamesState {}
final class AddNamesFailed extends AddNamesState {}