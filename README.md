# TUGAS 2: Implementasi Model-View-Template (MVT) pada Django
### Lisa Margaretha Esron Tobing (2306245541) - PBP B

*[Tautan PWS: http://lisa-margaretha-herneeds.pbp.cs.ui.ac.id ]*
*[Tautan Vercel https://her-needs.vercel.app/]*

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
- [Apa Itu Git? - dCloud] (https://dcloud.co.id/blog/apa-itu-git.html#:~:text=Git%20adalah%20alat%20software%20development,code)
-  [Introduction to the Internet and Web Framework - PDF](https://scele.cs.ui.ac.id/pluginfile.php/236179/mod_resource/content/1/02%20-%20Introduction%20to%20the%20Internet%20and%20Web%20Framework.pdf)
- [Django ORM - AlmaBetter] (https://www.almabetter.com/bytes/tutorials/django/django-orm)

---

# TUGAS 3: Implementasi Form dan Data Delivery pada Django

## 1. Jelaskan mengapa kita memerlukan data delivery dalam pengimplementasian sebuah platform?

Kita memerlukan **data delivery** dalam pengimplementasian sebuah platform karena data adalah komponen utama dari komunikasi antara klien dan server. **Data delivery** memungkinkan transfer data yang efisien dan terstruktur melalui protokol **HTTP/HTTPS**. Tanpa mekanisme data delivery, sebuah platform tidak dapat memperbarui konten tanpa harus memuat ulang seluruh halaman, yang dapat mengurangi efisiensi dan pengalaman pengguna. Dengan data delivery, platform dapat menghemat bandwidth dan mempercepat waktu muat halaman. Selain itu, data delivery juga memungkinkan hasil yang diperoleh secara real-time berdasarkan input dari pengguna. Hal ini membuat pengguna mendapatkan respons yang lebih cepat dan interaktif, yang sangat penting dalam pengembangan platform.

## 2. Menurutmu, mana yang lebih baik antara XML dan JSON? Mengapa JSON lebih populer dibandingkan XML?

Menurut saya, baik **XML** maupun **JSON** adalah format yang baik untuk digunakan, tergantung pada kebutuhan developer dalam mengembangkan platform. Namun, **JSON** dianggap lebih baik dan lebih populer dibandingkan **XML** karena beberapa alasan.

Pertama, **JSON** memiliki sintaks yang lebih sederhana dan ringkas, sehingga lebih mudah dibaca oleh manusia dan diproses oleh mesin. Kedua, karena sintaksnya yang lebih ringan, **JSON** jauh lebih cepat diproses oleh browser dan server. Data dalam format **JSON** dapat dengan mudah dikonversi menjadi objek **JavaScript**, berbeda dengan **XML** yang memerlukan parsing yang lebih kompleks. 

Ketiga, dokumen **JSON** umumnya lebih kecil dibandingkan **XML** karena tidak memiliki tag pembuka dan penutup yang berlebihan, sehingga menghasilkan transfer data yang lebih cepat dan lebih efisien.

## 3. Jelaskan Fungsi dari Method `is_valid()` pada form Django dan mengapa kita membutuhkan method tersebut?

Method `is_valid()` pada form Django digunakan untuk memeriksa apakah data yang dikirimkan ke form sudah memenuhi semua kriteria validasi yang ditentukan. Method ini mengembalikan **True** jika semua field valid, dan **False** jika sebaliknya.

Kita membutuhkan method `is_valid()` karena beberapa alasan:
- `is_valid()` memungkinkan Django untuk menangani proses validasi secara otomatis. Hal ini mengurangi potensi kesalahan dan memastikan bahwa semua data yang masuk sudah diverifikasi sebelum diproses lebih lanjut.
- `is_valid()` memastikan bahwa data yang dikirimkan dari form tidak merusak sistem. Data yang tidak valid tidak akan diproses atau disimpan, sehingga mencegah terjadinya bug atau potensi celah keamanan.
- `is_valid()` memastikan bahwa data yang akan disimpan adalah data yang valid dan memenuhi aturan yang diharapkan. Jika data tidak valid, method ini akan mengembalikan **False**, dan Django akan menambahkan pesan kesalahan ke form. Pesan ini dapat ditampilkan kepada pengguna di halaman form, sehingga mereka dapat memperbaiki input yang salah.

## 4. Mengapa kita membutuhkan `csrf_token` saat membuat form di Django? Apa yang dapat terjadi jika kita tidak menambahkan `csrf_token` pada form Django? Bagaimana hal tersebut dapat dimanfaatkan oleh penyerang?

**CSRF (Cross-Site Request Forgery)** adalah jenis serangan di mana penyerang memanfaatkan sesi aktif pengguna untuk mengirimkan permintaan yang tidak diotorisasi atas nama pengguna tersebut ke server. Di Django, **`csrf_token`** adalah token keamanan acak yang dihasilkan oleh server dan disisipkan ke setiap form HTML. Fungsi utamanya adalah mencegah serangan CSRF dengan memastikan bahwa setiap request POST yang dikirim dari form berasal dari sumber yang sah.

Jika **`csrf_token`** tidak ditambahkan pada form di Django, aplikasi akan menjadi rentan terhadap serangan CSRF. Penyerang bisa membuat halaman web berbahaya yang mengirimkan permintaan POST ke server Django atas nama pengguna yang sedang login tanpa sepengetahuan mereka. Penyerang juga dapat memiliki akses tidak langsung ke akun pengguna dengan memanipulasi pengguna agar mengunjungi halaman berbahaya, yang secara otomatis mengirimkan permintaan berbahaya ke server yang ditargetkan. Jika **`csrf_token`** tidak digunakan, penyerang dapat memanfaatkan celah ini untuk mengubah atau menghapus data di akun pengguna.

Tanpa **`csrf_token`**, penyerang dapat:
- Memanipulasi tindakan di aplikasi dengan menggunakan sesi yang sudah aktif milik pengguna yang sah.
- Membuat form berbahaya di situs mereka yang secara otomatis mengirimkan permintaan POST ke server saat pengguna yang sudah terautentikasi mengunjungi situs tersebut.
Karena server tidak dapat memverifikasi asal permintaan tersebut, permintaan berbahaya akan diproses, dan penyerang dapat memodifikasi atau menghapus data akun pengguna tanpa izin. Oleh karena itu, penggunaan **`csrf_token`** sangat penting untuk memastikan bahwa setiap permintaan POST benar-benar berasal dari aplikasi yang sah dan melindungi aplikasi dari manipulasi data oleh penyerang.

## 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial).

### Membuat input form untuk menambahkan objek model pada app sebelumnya

Sebelum saya membuat form, langkah pertama yang saya lakukan adalah membuat *skeleton* atau kerangka dasar dari views web. Saya memulai dengan membuat folder **templates** di root proyek dan menambahkan berkas HTML bernama **base.html** yang berfungsi sebagai kerangka umum untuk halaman web lain di dalam proyek. Di dalam **base.html**, sterdapat baris yang dikurung dalam tanda `{% ... %}` yang disebut **template tags** dalam Django. Baris ini berfungsi untuk memuat data secara dinamis ke dalam HTML dari Django.

Setelah itu, saya mengedit file **settings.py** yang berada di direktori **her_needs**, lalu menambahkan key **DIRS** dengan path `BASE_DIR / 'templates'`. Penambahan ini memungkinkan Django untuk mendeteksi **base.html**. Dengan ini berkas **base.html** dapat terdeteksi sebagai berkas template. Selanjutnya, pada subdirektori **templates** yang ada di dalam direktori **main**, saya menambahkan kode berikut:
```html
{% extends 'base.html' %}
<!-- Kode sebelumnya -->
{% endblock content %}
```
Dengan ini, kita bisa menggunakan **base.html** sebagai template utama.

Selanjutnya, saya juga mengubah primary key dari integer menjadi UUID. Di berkas **models.py** yang berada di subdirektori **main/**, saya menambahkan `import uuid` di baris paling atas, kemudian menambahkan **id**:
```python
id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
```
Tidak lupa, saya melakukan migrasi model dengan menjalankan perintah `python manage.py makemigrations` kemudian `python manage.py migrate`.

Setelah itu, saya membuat form input dengan menambahkan berkas baru di direktori **main/** dengan nama **forms.py**. Langkah ini dilakukan agar dapat menerima data **Product** baru. Di dalam berkas **forms.py** tersebut, saya menambahkan kode berikut:
```python
class ProductForm(ModelForm):
    class Meta:
        model = Product
        fields = ["name", "price", "description", "stock", "size"]
```

Kemudian, di berkas **views.py** pada folder **main**, saya membuat fungsi **create_product_entry** yang menerima parameter **request**. Fungsi ini akan menghasilkan form yang memungkinkan pengguna menambahkan data **Product** secara otomatis ketika data di-submit melalui form. Lalu, saya mengimpor fungsi **create_product_entry** ke dalam berkas **urls.py** pada direktori **main** dan menambahkan path URL ke dalam variabel **urlpatterns** agar fungsi yang sudah di-import dapat diakses. Selanjutnya, saya membuat berkas HTML baru bernama **create_product_entry.html** di direktori **main** agar pengguna dapat menambahkan entri produk baru. Form ini nantinya akan mengumpulkan data yang diisi oleh pengguna dan mengirimkannya ke server menggunakan metode POST, setelah memverifikasi **CSRF token**. Terakhir, di dalam **main.html**, saya menambahkan kode di dalam tag `{% block content %}` untuk menampilkan data **Product** dalam bentuk tabel, serta menambahkan tombol "Add New Product Entry" yang akan mengarahkan pengguna ke halaman form.

### Tambahkan 4 fungsi views baru untuk melihat objek yang sudah ditambahkan dalam format XML, JSON, XML by ID, dan JSON by ID.

Pertama, saya mengimpor **HttpResponse** dan **serializers** di berkas **views.py** dengan menambahkan baris berikut:
```python
from django.http import HttpResponse
from django.core import serializers
```

Selanjutnya, saya membuat dua fungsi baru, yaitu **show_xml** dan **show_json**, yang masing-masing menerima parameter **request**. Di dalam fungsi ini, terdapat variabel yang menyimpan hasil query dari seluruh data yang ada di model **Product**. Fungsi-fungsi ini akan mengembalikan semua data dari **Product** dalam bentuk **XML** atau **JSON**.
Berikut adalah isi dari fungsi **show_xml**:
```python
def show_xml(request):
    data = Product.objects.all()
    return HttpResponse(serializers.serialize("xml", data), content_type="application/xml")
```
Untuk fungsi **show_json**, konsepnya hampir sama dengan **show_xml**. Perbedaannya terletak pada serializer, di mana fungsi ini menggunakan **serializers** yang mengonversi hasil query data ke dalam format **JSON**. 

Selain itu, saya juga membuat dua fungsi, yaitu **show_xml_by_id** dan **show_json_by_id**, yang menerima parameter **request** dan **id**. Fungsi ini menyimpan hasil query dari data berdasarkan **id** tertentu yang ada pada model **Product**.
Berikut adalah isi dari fungsi **show_xml_by_id**:
```python
def show_xml_by_id(request, id):
    data = Product.objects.filter(pk=id)
    return HttpResponse(serializers.serialize("xml", data), content_type="application/xml")
```

### Membuat routing URL untuk masing-masing views yang telah ditambahkan pada poin 2.

Pada berkas **urls.py** yang ada di direktori **main**, saya meng-import semua fungsi yang telah dibuat sebelumnya dengan menambahkan baris berikut:
```python
from main.views import show_main, create_product_entry, show_xml, show_json, show_xml_by_id, show_json_by_id
```

Setelah itu, pada variabel **urlpatterns**, saya menambahkan path URL untuk masing-masing fungsi yang telah diimpor sebelumnya:
```python
path('xml/', show_xml, name='show_xml'),
path('json/', show_json, name='show_json'),
path('xml/<str:id>/', show_xml_by_id, name='show_xml_by_id'),
path('json/<str:id>/', show_json_by_id, name='show_json_by_id'),
```
Hal ini berguna agar saya dapat mengakses fungsi yang telah diimpor sebelumnya.

Terakhir, saya menjalankan perintah **git add**, **git commit**, dan **git push** ke GitHub, yang sekaligus melakukan push ke PWS untuk menyimpan semua perubahan yang telah saya lakukan.

### Screenshot hasil akses URL pada Postman
#### XML
![Screenshot (2767)](https://github.com/user-attachments/assets/43c8e98f-9c10-46c7-9c19-5ff1d4e80530)
#### JSON
![Screenshot (2768)](https://github.com/user-attachments/assets/9e38597d-4b35-4d32-b4fa-23f333a7bc5b)
#### XML by ID
![Screenshot (2769)](https://github.com/user-attachments/assets/885b6117-b5d7-4c60-a241-6166448adcc0)
#### JSON by ID
![Screenshot (2770)](https://github.com/user-attachments/assets/1c59d330-0a31-4018-99b5-36d1073602ff)


## Referensi:
- [Data Delivery](https://scele.cs.ui.ac.id/pluginfile.php/238122/mod_resource/content/1/04%20-%20Data%20Delivery.pdf)
- [Difference between JSON and XML](https://www.geeksforgeeks.org/difference-between-json-and-xml/)
- [JSON vs XML on W3Schools](https://www.w3schools.com/js/js_json_xml.asp)
- [Django Form Validation](https://www.javatpoint.com/django-form-validation#:~:text=The%20is_valid()%20method%20is,data%20into%20a%20cleaned_data%20attribute.)
- [CSRF Token in Django](https://www.geeksforgeeks.org/csrf-token-in-django/)
- [Tutorial PBP Fasilkom UI](https://pbp-fasilkom-ui.github.io/ganjil-2025/docs/tutorial-2)

---

# TUGAS 4: Implementasi Autentikasi, Session, dan Cookies pada Django

## Apa perbedaan antara HttpResponseRedirect() dan redirect()

1. **`HttpResponseRedirect()`** adalah kelas bawaan Django yang digunakan untuk mengarahkan pengguna ke URL lain setelah suatu aksi dilakukan. `HttpResponseRedirect()` membutuhkan URL yang ditulis secara eksplisit sebagai parameter (hanya bisa menerima URL).
2. **`redirect()`** adalah fungsi shortcut dari Django yang lebih sederhana untuk melakukan pengalihan (redirect). `redirect()` dapat menerima beberapa jenis parameter, seperti:
   - URL,
   - Nama view,
   - Instance model.

   `redirect()` jauh lebih fleksibel dan sederhana dibandingkan `HttpResponseRedirect()`.

## Jelaskan cara kerja penghubungan model Product dengan User!

Model Product dihubungkan dengan User dalam Django dengam menggunakan ForeignKey. ForeignKey menciptakan hubungan many-to-one, dimana setiap instance dari model ProductEntry bisa dihubungkan dengan satu instace model User, tetapi satu User bisa terkait dengan banyak ProductEntry. 
Saya menambahkan user = models.ForeignKey(User, on_delete=models.CASCADE) pada models.py di class ProductEntry, hal ini memungkinkan tiap satu entry product terasosiasi dan memiliki hubungan dengan pengguna yang melakukan entry, sehingga nantinya hanya entry yang dibuat oleh pengguna yang sedang login tersebut yang ditampilkan.


Dalam Django, kita dapat menghubungkan model `ProductEntry` dengan model `User` menggunakan `ForeignKey`. `ForeignKey` menciptakan hubungan many-to-one, di mana:
- Setiap instance dari model `ProductEntry` dapat dihubungkan dengan satu instance dari model `User`.
- Satu `User` bisa memiliki banyak entri produk (`ProductEntry`).
Sebagai contoh dalam Tugas 4, saya menambahkan kode berikut pada `models.py` di dalam class `ProductEntry`:
```python
user = models.ForeignKey(User, on_delete=models.CASCADE)
```
Hal ini memungkinkan tiap satu entry product terasosiasi dan memiliki hubungan dengan pengguna yang melakukan entry, sehingga nantinya hanya entry yang dibuat oleh pengguna yang sedang login tersebut yang ditampilkan.

## Apa perbedaan antara authentication dan authorization, apakah yang dilakukan saat pengguna login? Jelaskan bagaimana Django mengimplementasikan kedua konsep tersebut.

1. **Authentication** (Autentikasi) adalah proses verifikasi identitas pengguna. Contoh umumnya adalah ketika pengguna melakukan login dengan memasukkan **username** dan **password**. Tujuan dari authentication adalah untuk memastikan bahwa pengguna sudah terdaftar dan kredensial yang di-input valid.
   **Contoh:**
   - Pengguna memasukkan username dan password untuk masuk ke sistem.

2. **Authorization** (Otorisasi) adalah proses memastikan bahwa pengguna memiliki izin untuk mengakses sesuatu setelah mereka berhasil diautentikasi. Misalnya, setelah login, pengguna hanya dapat mengakses profil mereka sendiri, sedangkan hanya admin yang memiliki hak untuk mengakses halaman manajemen pengguna.
   **Tujuan:**
   - Untuk memastikan apakah pengguna yang sudah diautentikasi memiliki hak akses untuk melakukan tindakan atau mengakses bagian tertentu dari aplikasi.
   **Contoh:**
   - Pengguna biasa hanya bisa mengakses profil mereka sendiri.
   - Admin dapat mengakses dan mengelola semua akun pengguna di halaman manajemen pengguna.

Apa yang dilakukan saat pengguna login:
- Pengguna memasukkan **username** dan **password** di halaman login.
- Lalu, Django memproses input pengguna dan melakukan authentication untuk memverifikasi kredensial.
- Jika kredensial valid, Django mencatat status login pengguna dengan menyimpan detail pengguna ke dalam session. Pengguna kemudian dianggap **authenticated** (terautentikasi) untuk semua permintaan berikutnya selama sesi tersebut.
- Setelah berhasil diautentikasi, Django menerapkan authorization untuk memastikan pengguna memiliki izin untuk mengakses halaman tertentu atau melakukan tindakan tertentu.

Cara Django mengimplementasikan authentication dan authorization:
1. Django menyediakan sistem autentikasi yang lengkap melalui `django.contrib.auth`. Beberapa fungsi utama yang disediakan adalah:
   - **`authenticate()`**: Memverifikasi kredensial pengguna.
   - **`login()`**: Setelah terautentikasi, Django mencatat pengguna di session menggunakan `login()`.
   - **`logout()`**: Menghapus status login pengguna dan mengakhiri sesi autentikasi.
   - Django juga menggunakan model `User` untuk menyimpan informasi pengguna, seperti username dan password.
2.   Setelah proses authentication, Django memeriksa apakah pengguna memiliki izin untuk mengakses fitur tertentu, seperti fitur admin. Jika pengguna tidak memiliki hak akses, maka akses mereka akan ditolak.

## Bagaimana Django mengingat pengguna yang telah login? Jelaskan kegunaan lain dari cookies dan apakah semua cookies aman digunakan?

Django mengingat pengguna yang telah login menggunakan session dan cookies. Prosesnya sebagai berikut:
1. **Simpan Informasi Sesi**: Ketika pengguna berhasil login, Django menyimpan informasi sesi pengguna di server.
2. **Kirim Session ID**: Django mengirimkan session ID ke browser pengguna melalui cookie.
3. **HTTP Request Baru**: Setiap kali pengguna melakukan HTTP request baru ke server, browser akan mengirimkan session cookie bersama dengan request tersebut.
4. **Identifikasi Pengguna**: Dengan adanya session cookie, Django dapat mengidentifikasi pengguna yang sedang melakukan request.

Selain untuk mengingat pengguna yang telah login (Autentikasi), cookies memiliki kegunaan lain, antara lain:
1. **Menyimpan Preferensi Pengguna**:
   - Cookies dapat menyimpan preferensi pengguna, seperti pilihan bahasa pada suatu situs. Hal ini memungkinkan situs untuk memberikan pengalaman yang lebih personal setiap kali pengguna mengunjungi kembali situs tersebut.
2. **Melacak Aktivitas Pengguna**:
   - Cookies digunakan untuk melacak bagaimana pengguna berinteraksi dengan situs. Informasi ini digunakan untuk **web analytics**, membantu pemilik situs memahami perilaku pengunjung, bagaimana mereka menggunakan situs, dan area apa yang bisa ditingkatkan untuk memperbaiki pengalaman pengguna.

Sebagian besar cookies aman digunakan karena berfungsi untuk tujuan yang sah, tetapi tidak semua cookies aman digunakan. Ada beberapa risiko keamanan yang perlu diperhatikan:
1. **Pencurian Cookie**:
   - Cookies bisa dicuri oleh penyerang melalui serangan **XSS (Cross-Site Scripting)**, di mana penyerang melakukan injeksi script berbahaya di halaman web untuk mendapatkan akses ke cookie pengguna.
2. **Session Hijacking**:
   - **Session hijacking** terjadi ketika penyerang mencuri session cookie pengguna. Dengan menggunakan session ID yang dicuri, penyerang dapat mengakses akun pengguna tanpa harus login ulang.
Untuk melindungi privasi, penting bagi kita sebagai pengguna untuk:
- Memastikan bahwa penggunaan cookies sesuai dengan **kebijakan privasi situs**.
- Mematuhi **peraturan yang berlaku** terkait perlindungan data pribadi, seperti **GDPR** atau **CCPA**, untuk menjaga privasi dan keamanan kita sebagai pengguna.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial).

### Mengimplementasikan fungsi registrasi, login, dan logout untuk memungkinkan pengguna untuk mengakses aplikasi sebelumnya dengan lancar.

Pertama-tama, pada berkas `views.py`, saya menambahkan import `UserCreationForm` dan `messages`. Fungsi `UserCreationForm` memudahkan pembuatan formulir pendaftaran pengguna dalam aplikasi web, sehingga pengguna baru bisa mendaftar dengan mudah. Saya kemudian membuat fungsi `register`, yang berfungsi untuk menghasilkan formulir registrasi secara otomatis dan menghasilkan akun pengguna ketika data di-submit. Selanjutnya, saya membuat berkas HTML baru bernama `register.html` di direktori `main/templates`. Untuk menghubungkan tampilan ini dengan URL, di berkas `urls.py` pada subdirektori `main`, saya mengimpor fungsi `register` dan menambahkan URL path `path('register/', register, name='register')` ke dalam `urlpatterns`, sehingga nantinya bisa mengakses fungsi yang sudah diimpor sebelumnya.

Selanjutnya, pada berkas `views.py`, saya menambahkan import `authenticate`, `login`, dan `AuthenticationForm`. Fungsi `authenticate` dan `login` digunakan untuk melakukan autentikasi dan login jika autentikasi berhasil. Setelah itu, saya membuat fungsi `login_user` yang berguna untuk mengautentikasi pengguna yang ingin login. Saya juga membuat berkas HTML baru bernama `login.html` pada direktori `main/templates’. Kemudian, di berkas `urls.py` yang terletak pada subdirektori `main`, saya mengimpor fungsi `login_user` dan menambahkan URL path `path('login/', login_user, name='login')` ke dalam `urlpatterns`, sehingga nantinya bisa mengakses fungsi yang sudah diimpor sebelumnya.

Terakhir, pada berkas `views.py`, saya menambahkan import `logout`. Setelah itu, saya membuat fungsi `logout_user` yang berfungsi untuk melakukan mekanisme logout. Lalu, pada berkas `main.html` yang ada di direktori `main/templates`, saya menambahkan kode berikut setelah tag hyperlink untuk "Add New Product Entry":

```html
<a href="{% url 'main:logout' %}">
  <button>Logout</button>
</a>
```
Setelah itu, di berkas `urls.py` yang terletak pada subdirektori `main`, saya mengimpor fungsi `logout_user` dan menambahkan path URL `path('logout/', logout_user, name='logout')` ke dalam `urlpatterns`, sehingga nantinya bisa mengakses fungsi yang sudah diimpor sebelumnya.

### Membuat dua akun pengguna dengan masing-masing tiga dummy data menggunakan model yang telah dibuat pada aplikasi sebelumnya untuk setiap akun di lokal.

### Menghubungkan model Product dengan User.

Pertama-tama, saya membuka `models.py` yang ada pada direktori `main` dan menambahkan kode `from django.contrib.auth.models import User` untuk mengimpor model. Lalu, pada model `ProductEntry`, saya menambahkan `user = models.ForeignKey(User, on_delete=models.CASCADE)` yang berfungsi untuk menghubungkan tiap entry product dengan satu user, di mana tiap entry product harus terkait dengan seorang user. Setelah itu, pada berkas `views.py` yang terletak di direktori `main`, saya mengubah beberapa bagian pada fungsi `create_product_entry` dan `show_main` sehingga nantinya hanya akan menampilkan objek `Product` yang terasosiasi dengan user yang sedang login. Hal ini dilakukan dengan menyaring seluruh objek `Product` di mana field `user` terisi dengan objek `User` yang sama dengan pengguna yang sedang login. Karena saya melakukan perubahan pada `models.py`, tidak lupa saya menjalankan migrasi dengan perintah `python manage.py makemigrations` dan `python manage.py migrate` untuk menerapkan perubahan tersebut. Dengan ini, setiap entry product akan terasosiasi dengan pengguna yang membuatnya, dan hanya entry yang dibuat oleh pengguna yang sedang login yang akan ditampilkan.

### Menampilkan detail informasi pengguna yang sedang logged in seperti username dan menerapkan cookies seperti last login pada halaman utama aplikasi.

Pertama-tama, pada berkas `views.py` yang terletak pada direktori `main`, saya menambahkan import `HttpResponseRedirect`, `reverse`, dan `datetime`. Lalu, pada fungsi `login_user`, saya mengganti kode yang ada pada blok `if form.is_valid()` untuk melihat kapan terakhir kali pengguna melakukan login. Kodenya adalah sebagai berikut:

```python
if form.is_valid():
    user = form.get_user()
    login(request, user)
    response = HttpResponseRedirect(reverse("main:show_main"))
    response.set_cookie('last_login', str(datetime.datetime.now()))
    return response
```

Selanjutnya, pada fungsi `show_main`, saya menambahkan kode `'last_login': request.COOKIES['last_login']` ke dalam variabel `context`. Hal ini berfungsi untuk menambahkan informasi dari cookie `last_login` ke dalam response yang akan ditampilkan di halaman web. Setelah itu, saya juga mengubah fungsi `logout_user` agar dapat menghapus cookie `last_login` saat pengguna melakukan logout.

Terakhir, pada berkas `main.html`, saya menambahkan kode berikut setelah tombol logout:

```html
<h5>Sesi terakhir login: {{ last_login }}</h5>
```
Dengan kode ini, data `last_login` dapat ditampilkan. Sekarang, jika pengguna melakukan login, maka data `last_login` akan muncul pada halaman utama yang terletak di bawah tombol logout.


## Referensi:
- [Stack Overflow: What the difference between using Django redirect and HttpResponseRedirect](https://stackoverflow.com/questions/13304149/what-the-difference-between-using-django-redirect-and-httpresponseredirect#:~:text=There%20is%20a%20difference%20between,it%20can%20%22redirect%22%20to.)
- [PBP Fasilkom UI: Tutorial 3](https://pbp-fasilkom-ui.github.io/ganjil-2025/docs/tutorial-3)
- [Django Documentation: Authorization](https://docs.djangoproject.com/en/5.1/topics/auth/default/#topic-authorization)
- [SCELE CS UI: Form, Authentication, Session, and Cookie](https://scele.cs.ui.ac.id/pluginfile.php/238638/mod_resource/content/2/05%20-%20Form%2C%20Authentication%2C%20Session%2C%20and%20Cookie.pdf)
- [Domainesia: Apakah Mengizinkan Cookies pada Website Itu Berbahaya](https://www.domainesia.com/berita/cookies/#Apakah_Mengizinkan_Cookies_pada_Website_itu_Berbahaya)             


---
# TUGAS 5: Desain Web menggunakan HTML, CSS dan Framework CSS

##  Jika terdapat beberapa CSS selector untuk suatu elemen HTML, jelaskan urutan prioritas pengambilan CSS selector tersebut!

Ketika ada beberapa CSS selector yang diterapkan pada elemen HTML yang sama, browser akan menentukan prioritas berdasarkan urutan **specificity** (spesifisitas selector). Berikut adalah urutan prioritas pengambilan CSS selector:

1. Inline Styles
- **Prioritas Tertinggi:** Gaya CSS yang diterapkan langsung pada elemen HTML menggunakan atribut `style=""` memiliki prioritas tertinggi dibandingkan selector lainnya.
- **Contoh:**
  ```html
  <div style="color: red;">Contoh Teks</div>
   ```
2. ID Selector
- **Prioritas Kedua:** Selector ID memiliki tingkat spesifisitas yang lebih tinggi dibandingkan class, attribute, dan element selectors.
- **Contoh:**
   ```html
   #example {
      color: blue;
   }
   ```
3. Class, Attribute, dan Pseudo-Class Selector
- **Prioritas Ketiga**  terdiri dari:
   - **Class Selectors (`.example`)**: Digunakan untuk menargetkan elemen berdasarkan kelas yang diberikan pada atribut `class` dalam HTML. Class selectors biasanya digunakan untuk mendefinisikan gaya yang dapat diterapkan pada banyak elemen sekaligus.
   - **Attribute Selectors (`[type="text"]`)**: Menargetkan elemen berdasarkan atribut tertentu yang ada dalam tag HTML. Contohnya, `[type="text"]` akan menargetkan semua elemen dengan `type="text"`.
   - **Pseudo-Class Selectors (`:hover`, `:focus`)**: Digunakan untuk menargetkan elemen dalam keadaan tertentu, seperti saat pengguna mengarahkan kursor ke elemen (`:hover`) atau ketika elemen tersebut dalam fokus (`:focus`).

- **Contoh:**
   ```css
   /* Class Selector */
   .example {
   color: green; /* Akan diterapkan pada elemen dengan class="example" */
   }

   /* Attribute Selector */
   [type="text"] {
   border: 1px solid; /* Akan diterapkan pada elemen input dengan type="text" */
   }

   /* Pseudo-Class Selector */
   .button:hover {
   background-color: yellow; /* Akan diterapkan saat elemen dengan class="button" di-hover */
   }
   ```

## Mengapa responsive design menjadi konsep yang penting dalam pengembangan aplikasi web? Berikan contoh aplikasi yang sudah dan belum menerapkan responsive design!

Responsive design sangat penting dalam pengembangan aplikasi web karena beberapa alasan:
1. Menjamin Pengalaman Pengguna (User Experience) yang Optimal
Di era digital saat ini, pengguna mengakses aplikasi web melalui berbagai perangkat seperti ponsel, tablet, dan desktop dengan ukuran layar yang berbeda-beda. Responsive design memastikan tampilan dan konten situs web tetap rapi dan mudah dibaca di berbagai ukuran layar, sehingga meningkatkan kenyamanan dan kepuasan pengguna.
2. Efisiensi dalam Pengembangan dan Pemeliharaan
Dengan menerapkan responsive design, developer hanya perlu mengelola satu versi situs web yang dapat beradaptasi untuk semua perangkat. Hal ini menghemat waktu dan biaya pemeliharaan, dibandingkan jika harus membuat dan mengelola versi terpisah untuk desktop dan mobile.

Contoh Aplikasi yang sudah menerapkan Responsive Design
- **Twitter**: Twitter secara otomatis menyesuaikan tampilannya ketika diakses melalui ponsel atau desktop, memastikan pengalaman pengguna yang nyaman di berbagai perangkat.
- **Instagram**: Mirip dengan Twitter, Instagram juga memiliki desain responsif yang memungkinkan pengguna untuk menikmati pengalaman yang optimal, baik saat mengakses dari ponsel maupun desktop.

Contoh Aplikasi yang belum menerapkan Responsive Design
- **SIAKNG**: SIAKNG memiliki tampilan yang baik ketika diakses dari desktop, tetapi sayangnya tampilannya tidak responsif ketika dibuka melalui ponsel. Akibatnya, saya sebagai pengguna, terkadang merasa tidak nyaman karena ukuran font yang terlalu kecil dan tampilan yang tidak menyesuaikan layar perangkat mobile.


## Jelaskan perbedaan antara margin, border, dan padding, serta cara untuk mengimplementasikan ketiga hal tersebut!

1. **Margin** adalah ruang kosong di luar elemen yang digunakan untuk memberikan jarak antara elemen tersebut dengan elemen lainnya. Fungsinya adalah untuk memisahkan elemen satu dengan elemen lainnya, sehingga menciptakan spasi yang rapi dan terstruktur pada halaman web.

2. **Border** merupakan garis yang mengelilingi elemen, terletak di antara margin dan padding. Border berfungsi sebagai batas atau penanda elemen dan dapat disesuaikan dalam hal warna, ketebalan, serta jenis garisnya. Border membantu menegaskan batas elemen, sehingga lebih jelas terlihat di antara elemen-elemen lainnya.

3. **Padding** adalah ruang kosong di dalam elemen yang memberi jarak antara konten elemen dan border. Fungsi padding adalah untuk memastikan konten tidak terlalu rapat dengan border, sehingga konten terlihat lebih nyaman dan mudah dibaca.

### Visualisasi Margin, Border, dan Padding
![image](https://github.com/user-attachments/assets/e3f600b8-86ef-47b8-8b1b-5bbd6f8fb649)


Urutan dari luar ke dalam elemen adalah sebagai berikut:
**Margin → Border → Padding → Content**


## Jelaskan konsep flex box dan grid layout beserta kegunaannya!

1. **Flexbox (Flexible Box Layout)** adalah metode layout CSS yang dirancang untuk menyusun elemen dalam satu dimensi, baik secara horizontal (row) maupun vertikal (column). Flexbox memungkinkan elemen untuk menyesuaikan ukurannya secara fleksibel, mengatur spasi antar elemen, dan mendistribusikan elemen di dalam sebuah container dengan lebih mudah.
Kegunaan Flexbox:
- **Membuat Layout Responsif dengan Cepat:** Flexbox sangat efisien dalam membuat elemen responsif seperti menu navigasi, kartu produk, atau galeri gambar, karena dapat menyesuaikan diri dengan ukuran layar perangkat.
- **Menyesuaikan Susunan Elemen:** Flexbox ideal untuk menyusun elemen secara fleksibel dalam satu dimensi, baik secara horizontal maupun vertikal, sehingga memberikan kontrol yang lebih baik terhadap tata letak elemen.

> **Contoh Penggunaan Flexbox:** Untuk membuat baris produk di halaman e-commerce yang secara otomatis menyesuaikan jumlah kolom sesuai ukuran layar.

2. **Grid Layout** adalah metode layout CSS yang bekerja dalam dua dimensi, memungkinkan untuk membuat tata letak yang lebih kompleks dengan mengatur elemen dalam baris (rows) dan kolom (columns). Grid layout memberikan kendali penuh terhadap ukuran, posisi, dan struktur setiap elemen di dalam sebuah container.
Kegunaan Grid Layout:
- **Membuat Layout Web yang Kompleks:** Grid Layout sangat cocok untuk membangun struktur halaman web yang kompleks dan responsif, seperti tata letak yang memiliki header, footer, sidebar, dan konten utama.
- **Menyesuaikan Elemen Secara Presisi:** Grid Layout memungkinkan penyusunan elemen secara presisi, baik secara horizontal maupun vertikal dalam dua dimensi, sehingga memberikan kontrol lebih besar terhadap tata letak.

> **Contoh Penggunaan Grid Layout:** Untuk membuat kerangka halaman lengkap dengan header, sidebar, dan konten utama yang terstruktur dengan rapi.

### Perbandingan Flexbox dan Grid Layout

| **Flexbox**                           | **Grid Layout**                               |
|---------------------------------------|----------------------------------------------|
| Tata letak satu dimensi (horizontal atau vertikal) | Tata letak dua dimensi (baris dan kolom)     |
| Cocok untuk mengatur elemen dalam satu baris atau kolom | Cocok untuk tata letak halaman yang lebih kompleks |
| Fleksibel untuk menyesuaikan konten yang beragam | Memberikan kontrol penuh terhadap struktur halaman |

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)!

### Implementasikan fungsi untuk menghapus dan mengedit product.
Pertama-tama, pada file `views.py`, saya membuat sebuah fungsi baru yang bernama `edit_product`. Selanjutnya, saya menambahkan import yang diperlukan pada file tersebut, yaitu:
```python
from django.shortcuts import .., reverse
from django.http import .., HttpResponseRedirect
```

Selanjutnya, pada subdirektori `main/templates`, saya membuat berkas HTML baru bernama `edit_product.html`. Kemudian, di file `urls.py` yang berada di folder `main`, saya mengimpor fungsi `edit_product`. Terakhir, saya menambahkan path berikut ke dalam variabel `urlpatterns` untuk mengakses fungsi yang sudah diimpor tadi:
```python
path('edit-mood/<uuid:id>', edit_mood, name='edit_mood'),
```
Kurang lebih sama untuk fitur hapus produk. Pertama, saya membuat fungsi baru bernama `delete_product`. Kemudian, di `urls.py`, saya mengimpor fungsi yang telah dibuat tadi:

```python
from main.views import delete_product
```

Lalu, saya menambahkan path URL berikut ke dalam variabel 'urlpatterns' untuk mengakses fungsi yang sudah diimpor sebelumnya:
```python
path('delete/<uuid:id>', delete_product, name='delete_product'),
```

### Kustomisasi desain pada template HTML yang telah dibuat pada tugas-tugas sebelumnya menggunakan CSS atau CSS framework (seperti Bootstrap, Tailwind, Bulma)

#### Kustomisasi halaman login, register, dan tambah product semenarik mungkin.
Saya menyesuaikan tampilan dengan menggunakan Tailwind.
1. Pada halaman **login**, saya menambahkan animasi gradasi warna menggunakan @keyframes gradientAnimation yang menciptakan efek perubahan warna secara halus dari pink ke putih. Saya juga menggunakan class flex items-center justify-center untuk menempatkan form login di tengah layar.` Tombol login diberi warna bg-pink-600 dan efek hover hover:bg-pink-700 untuk memberikan interaksi visual. Selain itu, saya menambahkan ikon pada input username dan password.
2. Pada halaman **register**, saya menambahkan efek animasi gradasi pada latar belakang menggunakan `bg-animated`, membuat transisi warna dari pink ke putih. Selain itu, saya mengatur elemen form agar berada di tengah menggunakan class `flex items-center justify-center`. Bagian form juga diberikan efek bayangan (`shadow-2xl`) dan transisi (`hover:shadow-xl`) untuk memberikan efek interaktif ketika pengguna mengarahkan kursor. 
3. Pada halaman **Create Product Entry**, saya menggunakan `bg-gradient` sebagai latar belakang yang menciptakan gradasi warna dari pink ke putih dan menempatkan form di tengah menggunakan class `flex items-center justify-center`. Tombol submit diberikan efek interaktif dengan `hover:bg-pink-600`, sementara elemen form diberi efek `shadow-md` dan `rounded-lg` untuk tampilan yang lebih menarik.


#### Kustomisasi halaman daftar product menjadi lebih menarik dan responsive.

Jika belum ada produk yang tersimpan, saya menampilkan gambar hanger bersama dengan pesan "Oops, belum ada data produk yang terdaftar." menggunakan elemen `if not product_entries`. Gambar ini ditempatkan di tengah halaman dengan bantuan class `flex` dan `justify-center` agar lebih menarik perhatian pengguna.

Jika sudah ada produk yang tersimpan, saya menampilkan setiap produk dalam bentuk kartu (card) menggunakan `grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3` agar tata letak produk dapat beradaptasi dengan berbagai ukuran layar. Saya juga menambahkan animasi `bounceIn` pada elemen Welcome Card agar terlihat lebih hidup dan interaktif, memberikan efek yang menarik saat pengguna pertama kali membuka halaman.

#### Untuk setiap card product, buatlah dua buah button untuk mengedit dan menghapus product pada card tersebut!
Pada setiap card product, saya menambahkan dua tombol: satu untuk mengedit (`edit_product`) dan satu untuk menghapus (`delete_product`). Tombol edit diberi warna kuning (`bg-yellow-500`) dan tombol hapus berwarna merah (`bg-red-500`). Keduanya saya berikan efek transisi hover. Saya menggunakan ikon SVG untuk merepresentasikan visual pada masing-masing tombol untuk memudahkan pengguna memahami fungsinya.

#### Buatlah navigation bar (navbar) untuk fitur-fitur pada aplikasi yang responsive terhadap perbedaan ukuran device, khususnya mobile dan desktop.

Pada tampilan desktop, elemen-elemen navbar seperti **"Home," "Add New Product," "Welcome, Username,"** dan **"Logout"** ditampilkan dalam satu baris. Untuk memastikan elemen-elemen ini hanya muncul pada tampilan desktop, saya menggunakan class `hidden md:flex`. Class `hidden` akan menyembunyikan elemen-elemen tersebut pada tampilan mobile, dan `md:flex` akan menampilkan elemen-elemen tersebut hanya ketika layar memiliki ukuran menengah (medium) atau lebih besar.
Untuk tampilan mobile, saya menambahkan sebuah tombol menu (`mobile-menu-button`) yang menampilkan navbar dengan class `mobile-menu hidden md:hidden`. Elemen ini hanya akan muncul ketika tombol ditekan, dengan menggunakan JavaScript untuk mengontrol visibilitasnya. Selain itu, navbar ini memiliki efek transisi animasi (`transform translateY`) yang membuat tampilan menu terasa lebih halus dan interaktif ketika diakses pada perangkat mobile.


## Referensi
- [Web Design Using HTML5 and CSS3](https://scele.cs.ui.ac.id/pluginfile.php/239159/mod_resource/content/1/06%20-%20Web%20Design%20Using%20HTML5%20and%20CSS3.pdf)
- [Tutorial 4 PBP Fasilkom UI](https://pbp-fasilkom-ui.github.io/ganjil-2025/docs/tutorial-4)
