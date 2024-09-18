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
<!-- Kode konten halaman -->
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