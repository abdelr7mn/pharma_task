class Patient {
  final String id;
  final String name;
  final String lastUpdate;
  final String profileImage;

  Patient({
    required this.id,
    required this.name,
    required this.lastUpdate,
    required this.profileImage
  });

  // بيانات للعرض فقط - يمكن استبدالها بقاعدة بيانات حقيقية
  static List<Patient> getDummyPatients() {
    return List.generate(
      10,
          (index) => Patient(
        id: 'ID${index + 1}',
        name: 'Dennisa Nodey',
        lastUpdate: '14/08/2023',
        profileImage: 'https://via.placeholder.com/40',
      ),
    );
  }
}