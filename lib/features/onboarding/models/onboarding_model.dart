class OnboardingModel {
  final String title;
  final String description;
  final String image;

  const OnboardingModel({
    required this.title,
    required this.description,
    required this.image,
  });
}

const List<OnboardingModel> onboardingData = [
  OnboardingModel(
    title: 'Semua Barang,\nTercatat Rapi',
    description: 'Catat barang-barang di rumah beserta lokasi penyimpanannya. Semua informasi tersimpan dalam satu tempat yang mudah dikelola.',
    image: 'assets/images/onboarding_1.png',
  ),
  OnboardingModel(
    title: 'Temukan Tanpa\nMencari Lama',
    description: 'Lupa menyimpan barang di mana? Cukup cari nama barang untuk mengetahui lokasi penyimpanan terakhir yang kamu catat.',
    image: 'assets/images/onboarding_2.png',
  ),
  OnboardingModel(
    title: 'Satu Database\nuntuk Keluarga',
    description: 'Bagikan inventaris rumah dengan anggota keluarga agar semua orang dapat mengetahui barang apa saja yang dimiliki dan di mana barang tersebut disimpan.',
    image: 'assets/images/onboarding_3.png',
  ),
];
