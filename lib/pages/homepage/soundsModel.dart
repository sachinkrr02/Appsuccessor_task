class SleepStoryModel {
  final String image, title, desc;

  SleepStoryModel({
    required this.image,
    required this.title,
    required this.desc,
  });
}

final List<SleepStoryModel> Sounds = [
  SleepStoryModel(
    image: "assets/sound1.png",
    title: "Nature",
    desc: "2.5K Listners",
  ),
  SleepStoryModel(
    image: "assets/sound2.png",
    title: "ASMR",
    desc: "3k listners ",
  ),
  SleepStoryModel(
    image: "assets/sound3.png",
    title: "Instrumental",
    desc: "7.1k Listners",
  ),
];
