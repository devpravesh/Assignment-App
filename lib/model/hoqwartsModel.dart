// To parse this JSON data, do
//
//     final hoqwartsModel = hoqwartsModelFromJson(jsonString);

import 'dart:convert';

List<HoqwartsModel> hoqwartsModelFromJson(String str) =>
    List<HoqwartsModel>.from(
        json.decode(str).map((x) => HoqwartsModel.fromJson(x)));

String hoqwartsModelToJson(List<HoqwartsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HoqwartsModel {
  HoqwartsModel({
    this.id,
    this.name,
    this.alternateNames,
    this.species,
    this.gender,
    this.house,
    this.dateOfBirth,
    this.yearOfBirth,
    this.wizard,
    this.ancestry,
    this.eyeColour,
    this.hairColour,
    this.wand,
    this.patronus,
    this.hogwartsStudent,
    this.hogwartsStaff,
    this.actor,
    this.alternateActors,
    this.alive,
    this.image,
  });

  String? id;
  String? name;
  List<String>? alternateNames;
  Species? species;
  Gender? gender;
  House? house;
  DateOfBirth? dateOfBirth;
  int? yearOfBirth;
  bool? wizard;
  Ancestry? ancestry;
  EyeColour? eyeColour;
  HairColour? hairColour;
  Wand? wand;
  Patronus? patronus;
  bool? hogwartsStudent;
  bool? hogwartsStaff;
  String? actor;
  List<String>? alternateActors;
  bool? alive;
  String? image;
  String? error;
  HoqwartsModel.withError(String errorMessage) {
    error = errorMessage;
  }

  factory HoqwartsModel.fromJson(Map<String, dynamic> json) => HoqwartsModel(
        id: json["id"],
        name: json["name"],
        alternateNames: json["alternate_names"] == null
            ? []
            : List<String>.from(json["alternate_names"]!.map((x) => x)),
        species: speciesValues.map[json["species"]]!,
        gender: genderValues.map[json["gender"]]!,
        house: houseValues.map[json["house"]]!,
        dateOfBirth: dateOfBirthValues.map[json["dateOfBirth"]]!,
        yearOfBirth: json["yearOfBirth"],
        wizard: json["wizard"],
        ancestry: ancestryValues.map[json["ancestry"]]!,
        eyeColour: eyeColourValues.map[json["eyeColour"]]!,
        hairColour: hairColourValues.map[json["hairColour"]]!,
        wand: json["wand"] == null ? null : Wand.fromJson(json["wand"]),
        patronus: patronusValues.map[json["patronus"]]!,
        hogwartsStudent: json["hogwartsStudent"],
        hogwartsStaff: json["hogwartsStaff"],
        actor: json["actor"],
        alternateActors: json["alternate_actors"] == null
            ? []
            : List<String>.from(json["alternate_actors"]!.map((x) => x)),
        alive: json["alive"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "alternate_names": alternateNames == null
            ? []
            : List<dynamic>.from(alternateNames!.map((x) => x)),
        "species": speciesValues.reverse[species],
        "gender": genderValues.reverse[gender],
        "house": houseValues.reverse[house],
        "dateOfBirth": dateOfBirthValues.reverse[dateOfBirth],
        "yearOfBirth": yearOfBirth,
        "wizard": wizard,
        "ancestry": ancestryValues.reverse[ancestry],
        "eyeColour": eyeColourValues.reverse[eyeColour],
        "hairColour": hairColourValues.reverse[hairColour],
        "wand": wand?.toJson(),
        "patronus": patronusValues.reverse[patronus],
        "hogwartsStudent": hogwartsStudent,
        "hogwartsStaff": hogwartsStaff,
        "actor": actor,
        "alternate_actors": alternateActors == null
            ? []
            : List<dynamic>.from(alternateActors!.map((x) => x)),
        "alive": alive,
        "image": image,
      };
}

enum Ancestry { HALF_BLOOD, MUGGLEBORN, PURE_BLOOD, EMPTY }

final ancestryValues = EnumValues({
  "": Ancestry.EMPTY,
  "half-blood": Ancestry.HALF_BLOOD,
  "muggleborn": Ancestry.MUGGLEBORN,
  "pure-blood": Ancestry.PURE_BLOOD
});

enum DateOfBirth {
  THE_31071980,
  THE_19091979,
  THE_01031980,
  THE_05061980,
  EMPTY,
  THE_30071980,
  THE_13021981,
  THE_11081981
}

final dateOfBirthValues = EnumValues({
  "": DateOfBirth.EMPTY,
  "01-03-1980": DateOfBirth.THE_01031980,
  "05-06-1980": DateOfBirth.THE_05061980,
  "11-08-1981": DateOfBirth.THE_11081981,
  "13-02-1981": DateOfBirth.THE_13021981,
  "19-09-1979": DateOfBirth.THE_19091979,
  "30-07-1980": DateOfBirth.THE_30071980,
  "31-07-1980": DateOfBirth.THE_31071980
});

enum EyeColour { GREEN, BROWN, BLUE, GREY, EMPTY, BLACK, DARK }

final eyeColourValues = EnumValues({
  "black": EyeColour.BLACK,
  "blue": EyeColour.BLUE,
  "brown": EyeColour.BROWN,
  "dark": EyeColour.DARK,
  "": EyeColour.EMPTY,
  "green": EyeColour.GREEN,
  "grey": EyeColour.GREY
});

enum Gender { MALE, FEMALE }

final genderValues = EnumValues({"female": Gender.FEMALE, "male": Gender.MALE});

enum HairColour { BLACK, BROWN, RED, BLONDE, EMPTY, SANDY, BLOND, DARK }

final hairColourValues = EnumValues({
  "black": HairColour.BLACK,
  "blond": HairColour.BLOND,
  "blonde": HairColour.BLONDE,
  "brown": HairColour.BROWN,
  "dark": HairColour.DARK,
  "": HairColour.EMPTY,
  "red": HairColour.RED,
  "sandy": HairColour.SANDY
});

enum House { GRYFFINDOR, SLYTHERIN, HUFFLEPUFF, RAVENCLAW, EMPTY }

final houseValues = EnumValues({
  "": House.EMPTY,
  "Gryffindor": House.GRYFFINDOR,
  "Hufflepuff": House.HUFFLEPUFF,
  "Ravenclaw": House.RAVENCLAW,
  "Slytherin": House.SLYTHERIN
});

enum Patronus {
  STAG,
  OTTER,
  JACK_RUSSELL_TERRIER,
  EMPTY,
  SWAN,
  NON_CORPOREAL,
  HARE,
  HORSE,
  BOAR
}

final patronusValues = EnumValues({
  "boar": Patronus.BOAR,
  "": Patronus.EMPTY,
  "hare": Patronus.HARE,
  "horse": Patronus.HORSE,
  "Jack Russell terrier": Patronus.JACK_RUSSELL_TERRIER,
  "Non-Corporeal": Patronus.NON_CORPOREAL,
  "otter": Patronus.OTTER,
  "stag": Patronus.STAG,
  "swan": Patronus.SWAN
});

enum Species { HUMAN }

final speciesValues = EnumValues({"human": Species.HUMAN});

class Wand {
  Wand({
    this.wood,
    this.core,
    this.length,
  });

  Wood? wood;
  Core? core;
  double? length;

  factory Wand.fromJson(Map<String, dynamic> json) => Wand(
        wood: woodValues.map[json["wood"]]!,
        core: coreValues.map[json["core"]]!,
        length: json["length"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "wood": woodValues.reverse[wood],
        "core": coreValues.reverse[core],
        "length": length,
      };
}

enum Core {
  PHOENIX_FEATHER,
  DRAGON_HEARTSTRING,
  UNICORN_TAIL_HAIR,
  UNICORN_HAIR,
  EMPTY
}

final coreValues = EnumValues({
  "dragon heartstring": Core.DRAGON_HEARTSTRING,
  "": Core.EMPTY,
  "phoenix feather": Core.PHOENIX_FEATHER,
  "unicorn hair": Core.UNICORN_HAIR,
  "unicorn tail-hair": Core.UNICORN_TAIL_HAIR
});

enum Wood { HOLLY, VINE, WILLOW, HAWTHORN, ASH, EMPTY, CHERRY, YEW }

final woodValues = EnumValues({
  "ash": Wood.ASH,
  "cherry": Wood.CHERRY,
  "": Wood.EMPTY,
  "hawthorn": Wood.HAWTHORN,
  "holly": Wood.HOLLY,
  "vine": Wood.VINE,
  "willow": Wood.WILLOW,
  "yew": Wood.YEW
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
