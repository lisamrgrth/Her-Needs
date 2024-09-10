# TUGAS 2: Implementasi Model-View-Template (MVT) pada Django
### Lisa Margaretha Esron Tobing (2306245541) - PBP B

*[Tautan PWS: http://lisa-margaretha-herneeds.pbp.cs.ui.ac.id ]*

---

## 1. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial).

### Membuat sebuah proyek Django baru
Pertama, saya membuat direktori baru bernama **her-needs** untuk e-commerce yang akan saya buat. Saya mengaktifkan **virtual environment** agar dependencies aplikasi terisolasi dari aplikasi lain di komputer. Setelah itu, saya menginstall beberapa dependencies dan menambahkannya ke berkas **requirements.txt**. Lalu, saya menjalankan perintah `django-admin startproject her_needs .` untuk membuat proyek baru. Setelah itu, saya mengonfigurasi **ALLOWED_HOSTS** agar aplikasi bisa diakses oleh semua pengguna. 

Setelah itu, saya menjalankan perintah `python manage.py runserver` dan membuka http://localhost:8000/ di browser untuk memastikan server berhasil dijalankan. Saya juga membuat repositori Git bernama **her-needs**, menginisiasi direktori lokal sebagai repositori Git, lalu melakukan **add, commit**, dan **push** dari repositori lokal ke GitHub.

### Membuat aplikasi dengan nama main pada proyek tersebut
Saya menjalankan perintah `python manage.py startapp main` untuk membuat aplikasi **main**. Setelah itu, saya menambahkan aplikasi ini ke dalam `INSTALLED_APPS` di **settings.py**. Langkah selanjutnya, saya mulai mengimplementasikan struktur **MVT** di dalam aplikasi **main**.

### Melakukan routing pada proyek agar dapat menjalankan aplikasi main
Saya menambahkan routing di **urls.py** untuk menghubungkan ke aplikasi **main**. Pada berkas **urls.py**, saya mengimpor fungsi `include` dari `django.urls` untuk mengimpor rute URL dari aplikasi **main** ke berkas **urls.py** proyek. Saya juga menambahkan rute `path('', include('main.urls'))` di variabel `urlpatterns` untuk mengarahkan ke tampilan main.

### Membuat model pada aplikasi main dengan nama Product dan memiliki atribut wajib
Saya mengubah berkas **models.py** di aplikasi **main** untuk mendefinisikan model **Product**. Model **Product** memiliki atribut: **name**, **price**, **description**, **stock**, dan **size**, dengan tipe data: **CharField**, **IntegerField**, **TextField**, **IntegerField**, dan **CharField**. Setiap kali mengubah model, saya menjalankan perintah migrasi untuk menerapkan perubahan ke database.

### Membuat sebuah fungsi pada views.py untuk dikembalikan ke dalam sebuah template HTML yang menampilkan nama aplikasi serta nama dan kelas kamu.
Saya mengimpor fungsi `render` dari `django.shortcuts` untuk mengirimkan data ke template HTML. Pada **views.py**, saya membuat fungsi yang mengirimkan data **app**, **name**, dan **class** ke template **main.html**. Template ini digunakan untuk menampilkan data tersebut di halaman web.

### Membuat sebuah routing pada urls.py aplikasi main untuk memetakan fungsi yang telah dibuat pada views.py. 
Saya membuat berkas **urls.py** di aplikasi **main** untuk mengatur rute URL yang terkait dengan aplikasi main. Saya juga menggunakan fungsi **show_main** dari modul **main.views** sebagai tampilan yang akan ditampilkan ketika URL diakses.

### Melakukan deployment ke PWS terhadap aplikasi yang sudah dibuat sehingga nantinya dapat diakses oleh teman-temanmu melalui Internet.

Saya membuat projek baru di PWS dan menambahkan URL PWS ke **ALLOWED_HOSTS** di **settings.py**:

```python
ALLOWED_HOSTS = ["localhost", "127.0.0.1", "lisa-margaretha-herneeds.pbp.cs.ui.ac.id"]
```

Hal ini dilakukan agar proyek Django saya dapat diakses melalui URL deployment. Setelah itu, saya melakukan `git add`, `commit`, dan `push` untuk perubahan yang sudah saya lakukan di GitHub. Selanjutnya, saya menjalankan perintah yang terdapat pada **Project Command** di halaman PWS. Setelah itu, saya menjalankan perintah `git branch -M main` untuk mengubah nama branch utama menjadi **main**. Ketika status aplikasi menunjukkan **Running**, proyek sudah dapat diakses melalui URL deployment. Jika ada perubahan pada proyek Django, saya hanya perlu menjalankan perintah `git push pws main:master`, kemudian melakukan `git add` dan `commit` untuk menyimpan perubahan tersebut.

### Membuat sebuah README.md yang berisi tautan menuju aplikasi PWS yang sudah di-deploy 
Saya membuat file **README.md** untuk menjawab beberapa pertanyaan terkait Tugas 2 dan menyertakan tautan menuju aplikasi PWS yang telah di-deploy.

## 2. Buatlah bagan yang berisi request client ke web aplikasi berbasis Django beserta responnya dan jelaskan pada bagan tersebut kaitan antara urls.py, views.py, models.py, dan berkas html.

![Bagan_Tugas2](https://github.com/user-attachments/assets/fe6084cb-db1e-4835-9669-0d540ae585c0)
### Penjelasan Bagan:
a. Client mengirimkan **HTTP request** ke server Django.  
b. **urls.py** memetakan URL yang di-request client ke view yang sesuai saat server menerima request (routing).  
c. **views.py** menerima request dari **urls.py**, memprosesnya, lalu memutuskan apa yang akan di-return ke client.  
d. Jika view membutuhkan data dari database, view akan memanggil **models.py** untuk mengambil data dari database.  
e. **models.py** akan mengambil data dari database lalu mengembalikannya ke **views.py**.  
f. Setelah **views.py** memproses data, view akan meneruskan data ke **template HTML**. Template akan menampilkan data yang diterima dari **views.py** dan dirender oleh Django menjadi HTML.  
g. Setelah template dirender, Django mengirimkan **respon HTML** tersebut kembali ke client.

### Secara singkat:
- **urls.py**: Memetakan URL ke view yang sesuai.
- **views.py**: Memproses request client dan berinteraksi dengan **models.py** untuk mengambil data dari database, serta menentukan template mana yang digunakan untuk merender data.
- **models.py**: Berinteraksi dengan database, baik mengambil maupun menyimpan data.
- **Template HTML**: Merender data yang diterima dari view dan menampilkannya kepada client.

## 3. Jelaskan fungsi Git dalam pengembangan perangkat lunak!

Dalam pengembangan perangkat lunak, **Git** berfungsi sebagai sistem kontrol versi yang membantu pengembang untuk menyimpan, mengelola, dan berbagi kode sumber secara efisien dan kolaboratif. Git memungkinkan pengembang untuk melacak setiap perubahan yang dilakukan pada kode, sehingga mereka dapat melihat siapa yang membuat perubahan, kapan perubahan terjadi, dan apa yang diubah. 

Selain itu, Git menyediakan **backup otomatis** dari semua perubahan yang dilakukan, sehingga pengembang tidak perlu khawatir kehilangan kode yang telah ditulis. Git juga memiliki fitur **branching** yang memungkinkan pengembang untuk bekerja secara paralel di beberapa cabang tanpa memengaruhi cabang utama. Setelah selesai, perubahan tersebut dapat digabungkan kembali menggunakan fitur **merge**, sehingga pengembangan menjadi lebih terorganisir dan terstruktur.

## 4. Menurut Anda, dari semua framework yang ada, mengapa framework Django dijadikan permulaan pembelajaran pengembangan perangkat lunak?

Framework **Django** memiliki dokumentasi yang lengkap dan komunitas yang besar, yang membuat Django mudah dipelajari oleh pemula. Selain itu, Django menggunakan pola **Model-View-Template (MVT)**, yang memisahkan logika bisnis, data, dan tampilan, sehingga pengembangan aplikasi dapat dilakukan secara terstruktur dan rapi.

Framework **Django** juga menerapkan **security** yang baik, dengan fitur keamanan bawaan yang melindungi aplikasi dari serangan. Framework **Django** juga menyediakan hampir semua hal yang diperlukan untuk pengembangan aplikasi web tanpa perlu menginstal library tambahan. Dengan semua fitur bawaan ini, Django memungkinkan pengembang fokus pada logika aplikasi dan pengembangan tanpa perlu mengonfigurasi banyak alat eksternal.

## 5. Mengapa model pada Django disebut sebagai ORM?

Model pada Django disebut sebagai **ORM (Object-Relational Mapping)** karena memungkinkan developer untuk bekerja dengan database menggunakan objek Python. **ORM** mengubah data dari database (seperti tabel dan kolom) menjadi objek Python, sehingga developer tidak perlu menulis query SQL secara langsung untuk berinteraksi dengan database.

Hal ini membuat pengembangan menjadi lebih efisien dan aman, karena query SQL dihasilkan secara otomatis oleh Django. Dengan ORM, developer dapat fokus pada logika aplikasi tanpa perlu memahami detail teknis dari SQL, namun tetap bisa melakukan operasi database yang kompleks.


## Referensi:
- [PBP Fasilkom UI Tutorial 0](https://pbp-fasilkom-ui.github.io/ganjil-2025/docs/tutorial-0)
- [PBP Fasilkom UI Tutorial 1](https://pbp-fasilkom-ui.github.io/ganjil-2025/docs/tutorial-1)
- [MTV Django Architecture PDF](https://scele.cs.ui.ac.id/pluginfile.php/237029/mod_resource/content/1/03%20-%20MTV%20Django%20Architecture.pdf)
- [Apa Itu Git? - dCloud](https://dcloud.co.id/blog/apa-itu-git.html#:~:text=Git%20adalah%20alat%20software%20development,code)%20secara%20efisien%20dan%20kolaboratif.)
-  [Introduction to the Internet and Web Framework - PDF](https://scele.cs.ui.ac.id/pluginfile.php/236179/mod_resource/content/1/02%20-%20Introduction%20to%20the%20Internet%20and%20Web%20Framework.pdf)
- [Django ORM - AlmaBetter](https://www.almabetter.com/bytes/tutorials/django/django-orm#:~:text=Django%20ORM%20(Object%2DRelational%20Mapping,of%20writing%20SQL%20queries%20directly.)
