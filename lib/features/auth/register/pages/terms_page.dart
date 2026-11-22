import 'package:flutter/material.dart';

import '../widgets/legal_document_page.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LegalDocumentPage(
      title: 'Syarat Penggunaan',
      subtitle: 'Terakhir diperbarui: 22 November 2026',
      notice:
          'Dengan menggunakan Digital Memory, kamu dianggap telah membaca dan memahami syarat penggunaan ini. '
          'Dokumen ini merupakan rancangan awal untuk kebutuhan prototype aplikasi.',
      sections: [
        LegalSection(
          title: '1. Tentang Digital Memory',
          content:
              'Digital Memory merupakan aplikasi yang membantu pengguna mencatat, '
              'mengelola, dan menemukan barang-barang yang dimiliki beserta lokasi penyimpanannya '
              'di rumah. Aplikasi ini dirancang untuk memudahkan pengelolaan inventaris rumah '
              'secara digital.',
        ),
        LegalSection(
          title: '2. Penggunaan Akun',
          content:
              'Pengguna bertanggung jawab atas informasi yang diberikan saat membuat akun, '
              'termasuk nama, username, dan email. Pengguna wajib menjaga keamanan akun '
              'dan tidak membagikan informasi login kepada pihak lain secara sembarangan.',
        ),
        LegalSection(
          title: '3. Pencatatan Inventaris',
          content:
              'Pengguna dapat mencatat informasi barang, kategori, foto, jumlah, kondisi, '
              'serta lokasi penyimpanan. Pengguna bertanggung jawab memastikan informasi '
              'inventaris yang dimasukkan sesuai dengan kondisi sebenarnya.',
        ),
        LegalSection(
          title: '4. Keakuratan Informasi',
          content:
              'Digital Memory membantu menyimpan dan menemukan informasi berdasarkan data '
              'yang dimasukkan pengguna. Aplikasi tidak menjamin bahwa lokasi atau informasi '
              'barang selalu akurat apabila pengguna tidak memperbarui catatannya.',
        ),
        LegalSection(
          title: '5. Berbagi Inventaris',
          content:
              'Jika fitur berbagi inventaris tersedia, pengguna bertanggung jawab atas '
              'informasi yang dibagikan kepada anggota keluarga atau pihak lain. Pengguna '
              'disarankan untuk tidak membagikan informasi yang bersifat sensitif atau '
              'tidak diperlukan.',
        ),
        LegalSection(
          title: '6. Penggunaan yang Dilarang',
          content:
              'Pengguna tidak diperkenankan menggunakan aplikasi untuk aktivitas ilegal, '
              'mengganggu sistem, mencoba mengakses akun orang lain tanpa izin, atau '
              'melakukan tindakan yang dapat merugikan pengguna lain maupun layanan aplikasi.',
        ),
        LegalSection(
          title: '7. Perubahan Layanan',
          content:
              'Fitur, tampilan, maupun layanan Digital Memory dapat dikembangkan, '
              'diubah, atau diperbarui untuk meningkatkan kualitas dan kenyamanan penggunaan.',
        ),
        LegalSection(
          title: '8. Persetujuan',
          content:
              'Dengan membuat akun dan menggunakan Digital Memory, pengguna menyatakan '
              'bersedia mematuhi ketentuan penggunaan aplikasi yang berlaku.',
        ),
      ],
    );
  }
}
