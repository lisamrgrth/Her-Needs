Nama    : Lisa Margaretha Esron Tobing
NPM     : 2306245541
Kelas   : PBP B

Tautan PWS:

TUGAS 2
1. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial).
- Pertama, saya menggunakan command django-admin startproject her_needs . untuk membuat proyek baru
- Setelah berhasil dibuat, saya menjalankan command python manage.py startapp main untuk membuat aplikasi baru dengan nama main
- Saya menambahkan aplikasi main ke dalam INSTALLED_APPS di file settings.py agar Django mengenali aplikasi tersebut.
- Saya menghubungkan aplikasi main dengan proyek melalui file urls.py. Di her_needs/urls.py, saya menambahkan path ke main.urls sehingga aplikasi dapat diakses.
- Lalu, di models.py, saya membuat model Product yang memiliki atribut name, price, dan description. Model ini memungkinkan kita menyimpan data produk di database.
- Di views.py, saya membuat fungsi show_main yang mengirimkan data ke template HTML. Fungsi ini mengirimkan variabel seperti nama dan kelas pengguna ke template untuk ditampilkan.
- Saya membuat file main.html untuk menampilkan nama aplikasi, nama pengguna, dan kelas pengguna. Template ini menerima variabel dari views.py dan menampilkannya di halaman web.
- Setelah selesai, proyek di-deploy ke PWS agar dapat diakses oleh pengguna lain melalui internet.

2. Buatlah bagan yang berisi request client ke web aplikasi berbasis Django beserta responnya dan jelaskan pada bagan tersebut kaitan antara urls.py, views.py, models.py, dan berkas html.

3. Jelaskan fungsi git dalam pengembangan perangkat lunak!

4. Menurut Anda, dari semua framework yang ada, mengapa framework Django dijadikan permulaan pembelajaran pengembangan perangkat lunak?

5. Mengapa model pada Django disebut sebagai ORM?
Model pada Django disebut sebagai ORM (Object-Relational Mapping) karena memungkinkan developer untuk bekerja dengan database menggunakan objek Python. ORM mengubah data dari database (tabel, kolom) menjadi objek Python, sehingga pengembang tidak perlu menulis query SQL langsung untuk berinteraksi dengan database. Hal ini membuat pengembangan lebih efisien dan aman karena query SQL otomatis dihasilkan oleh Django.