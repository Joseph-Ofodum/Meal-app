import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>>{
  FiltersNotifier()
   : super({
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  });


  void setFilters(Map<Filter, bool> chosenFilters){
    state = chosenFilters;
  }
  
  void setFilter(Filter filter, bool isActive) {
    // state[filter] = isActive; not Allowed => mutating state.

    state = {
      ...state,
      filter: isActive,
         
    };

  }
}


final filtersProvider = StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) =>  FiltersNotifier(),
  );