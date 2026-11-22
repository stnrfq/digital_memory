
import 'package:flutter/material.dart';
import '../widgets/legal_document_page.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LegalDocumentPage(
      title: 'Kebijakan Privasi',
      subtitle: 'Terakhir diperbarui: 22 November 2026',
      sections: [
        LegalSection(
          title: '1. Informasi yang Dikumpulkan',
          content:
              'Digital Memory dapat mengumpulkan informasi yang diberikan pengguna, '
              'seperti nama lengkap, username, email, serta informasi barang yang '
              'dicatat dalam inventaris rumah. Informasi tersebut dapat mencakup '
              'nama barang, kategori, lokasi penyimpanan, catatan, dan foto.',
        ),
        LegalSection(
          title: '2. Tujuan Penggunaan Data',
          content:
              'Informasi yang diberikan digunakan untuk membantu pengguna mengelola '
              'inventaris rumah, menyimpan catatan barang, mempermudah pencarian, '
              'mengelola akun, serta mendukung fitur berbagi inventaris bersama '
              'anggota keluarga.',
        ),
        LegalSection(
          title: '3. Penyimpanan Informasi',
          content:
              'Informasi pengguna direncanakan disimpan melalui sistem database '
              'yang digunakan oleh Digital Memory. Penyimpanan dan pengelolaan '
              'data akan disesuaikan dengan implementasi sistem yang digunakan '
              'pada aplikasi.',
        ),
        LegalSection(
          title: '4. Berbagi Informasi',
          content:
              'Informasi inventaris dapat dibagikan kepada anggota keluarga atau '
              'pengguna lain apabila fitur berbagi telah tersedia dan pengguna '
              'memberikan akses. Digital Memory dirancang agar informasi rumah '
              'dapat dikelola bersama oleh pengguna yang memiliki izin.',
        ),
        LegalSection(
          title: '5. Foto dan Informasi Rumah',
          content:
              'Pengguna dapat menambahkan foto dan informasi mengenai barang '
              'yang dimiliki. Pengguna disarankan untuk tidak mengunggah foto '
              'atau catatan yang memuat informasi sensitif, dokumen pribadi, '
              'atau hal lain yang tidak ingin diketahui orang lain.',
        ),
        LegalSection(
          title: '6. Keamanan Data',
          content:
              'Digital Memory dirancang untuk menjaga keamanan informasi pengguna. '
              'Langkah pengamanan akan diterapkan sesuai dengan teknologi dan '
              'infrastruktur yang digunakan dalam pengembangan aplikasi. '
              'Namun, keamanan data juga bergantung pada penggunaan akun dan '
              'perangkat oleh pengguna.',
        ),
        LegalSection(
          title: '7. Pengelolaan Data Pengguna',
          content:
              'Pengguna nantinya dapat mengelola informasi akun dan data '
              'inventaris sesuai fitur yang tersedia di aplikasi, termasuk '
              'melakukan perubahan atau menghapus data tertentu.',
        ),
        LegalSection(
          title: '8. Perubahan Kebijakan Privasi',
          content:
              'Kebijakan privasi ini dapat diperbarui sewaktu-waktu mengikuti '
              'perkembangan fitur, perubahan sistem, maupun kebutuhan '
              'pengelolaan informasi. Pengguna disarankan untuk membaca '
              'kembali kebijakan ini apabila terdapat pembaruan.',
        ),
        LegalSection(
          title: '9. Informasi Kontak',
          content:
              'Apabila pengguna memiliki pertanyaan, masukan, atau keluhan '
              'mengenai privasi dan pengelolaan data, informasi kontak resmi '
              'Digital Memory akan disediakan pada aplikasi ketika layanan '
              'telah siap digunakan.',
        ),
      ],
      notice:
          'Dokumen ini merupakan draft kebijakan privasi untuk kebutuhan '
          'prototype Digital Memory. Isi kebijakan perlu disesuaikan kembali '
          'dengan implementasi database, autentikasi, penyimpanan foto, '
          'dan fitur berbagi data sebelum aplikasi digunakan secara resmi.',
    );
  }
}
