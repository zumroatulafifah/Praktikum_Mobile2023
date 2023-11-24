import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final String body;
  final String author;
  final String authorImageUrl;
  final String category;
  final String imageUrl;
  final int views;
  final DateTime createdAt;

  const Article({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.body,
    required this.author,
    required this.authorImageUrl,
    required this.category,
    required this.imageUrl,
    required this.views,
    required this.createdAt,
  });

  static List<Article> articless = [
    Article(
      id: '1',
      title: 'Semangka Simbol Palestina',
      subtitle:
          'Ramai soal buah semangka yang dijadikan sebagai simbol dukungan untuk Palestina, di tengah perang melawan Israel.',
      body:
          'Dilansir Al Jazeera, sejatinya tidak hanya semangka, ada pula buah-buahan lain seperti jeruk, zaitun, dan terong yang juga dianggap sebagai buah-buahan yang mewakili identitas Palestina, namun semangka mungkin adalah yang paling ikonik.',
      author: 'Imelda',
      authorImageUrl:
          'https://images.unsplash.com/photo-1658786403875-ef4086b78196?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80',
      category: 'International news',
      views: 1252,
      imageUrl:
          'https://akcdn.detik.net.id/visual/2023/11/02/simbol-semangka-palestina_169.jpeg?w=900&q=90',
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
    ),
    Article(
      id: '2',
      title: 'Akar-Akar Konflik Israel-Palestina',
      subtitle:
          'Hampir 3000 orang tewas dan lebih dari 10.000 orang terluka dari pihak Palestina dan Israel dalam perang Israel-Hamas dalam seminggu ini',
      body:
          'Kementerian Kesehatan Palestina melaporkan sekitar 1500 orang Palestina meninggal dunia dan lebih dari 7000 orang mengalami luka-luka. Pihak Israel menyebutkan sekitar 1300 orang Israel tewas dan sekitar 3400 orang terluka (cnnindonesia.com, 13 Oktober 2023).',
      author: 'Afifah',
      authorImageUrl:
          'https://images.unsplash.com/photo-1658786403875-ef4086b78196?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80',
      category: 'International news',
      views: 1104,
      imageUrl:
          'https://uinsgd.ac.id/wp-content/uploads/2023/10/palestin1.webp',
      createdAt: DateTime.now().subtract(const Duration(hours: 6)),
    ),
    Article(
      id: '3',
      title: 'Pemerintah Bakal Kirim Bantuan Alat Medis hingga',
      subtitle:
          'Jakarta, CNN Indonesia -- Pemerintah bakal mengirim sekitar 33 ton bantuan kemanusiaan ke Palestina pada Sabtu (4/11).',
      body:
          'Bantuan yang dikirimkan adalah bantuan dari PMI, Kemenkes, Kemhan, Badan Zakat Nasional, dan Forum Zakat berupa alat kesehatan, peralatan medis, hygiene kit (alat mandi), winter equipment (perlengkapan musim dingin), medical assistance (bantuan kesehatan), bahan makanan, dan sleeping bag (alas tidur) dengan total berat 33.103 kg," kata Edwin di Kantor Kemhan, Jakarta Pusat, Kamis (2/11).',
      author: 'Eleanor',
      authorImageUrl:
          'https://images.unsplash.com/photo-1658786403875-ef4086b78196?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80',
      category: 'Mall',
      views: 3204,
      imageUrl:
          'https://akcdn.detik.net.id/visual/2023/11/01/mesir-buka-perbatasan-rafah-siap-tampung-warga-palestina-1_169.jpeg?w=650&q=90',
      createdAt: DateTime.now().subtract(const Duration(hours: 8)),
    ),
  ];

  @override
  List<Object?> get props => [
        id,
        title,
        subtitle,
        body,
        author,
        authorImageUrl,
        category,
        imageUrl,
        createdAt,
      ];
}
