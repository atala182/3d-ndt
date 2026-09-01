# 3D-İnCerTa — Kurumsal Web Sitesi

NDT (tahribatsız muayene) hizmetleri için tek sayfalık, animasyonlu tanıtım sitesi.
Statik HTML/CSS/JS — herhangi bir build adımı gerekmez.

## Klasör Yapısı

```
3d-incerta-site/
├── index.html          → Sitenin tamamı (tek dosya)
├── supabase/
│   └── schema.sql       → İletişim formu tablosu + güvenlik kuralları
└── README.md
```

---

## 1) Supabase Kurulumu

1. https://supabase.com üzerinden projenize girin (proje sizin için/sizinle birlikte oluşturulacak).
2. Sol menüden **SQL Editor**'ı açın, `supabase/schema.sql` içeriğini yapıştırıp **Run** deyin.
   - Bu, `contact_submissions` adında bir tablo oluşturur ve yalnızca "insert" (ekleme) iznini herkese açar. Kayıtları yalnızca siz Supabase panelinden görebilirsiniz.
3. Sol menüden **Project Settings > API** sayfasına gidin, şu iki değeri kopyalayın:
   - **Project URL**
   - **anon public** anahtarı
4. `index.html` dosyasını açın, dosyanın sonlarına doğru şu satırları bulun ve değerleri yapıştırın:
   ```js
   const SUPABASE_URL = "YOUR_SUPABASE_URL";
   const SUPABASE_ANON_KEY = "YOUR_SUPABASE_ANON_KEY";
   ```

Form gönderildiğinde kayıtlar **Supabase > Table Editor > contact_submissions** tablosunda görünecektir.

---

## 2) GitHub'a Yükleme

Terminalde proje klasörünün içindeyken:

```bash
git init
git add .
git commit -m "3D-İnCerTa web sitesi ilk sürüm"
git branch -M main
git remote add origin https://github.com/KULLANICI_ADINIZ/3d-incerta-website.git
git push -u origin main
```

(GitHub'da önce boş bir repo oluşturmanız gerekir: github.com → New repository → adı örn. `3d-incerta-website` → **Create repository**, ardından yukarıdaki `remote add` satırındaki URL'yi kendi reponuzla değiştirin.)

---

## 3) Vercel ile Yayına Alma

1. https://vercel.com adresine GitHub hesabınızla giriş yapın.
2. **Add New… > Project** deyin, az önce oluşturduğunuz `3d-incerta-website` reposunu seçin.
3. Framework olarak **"Other"** seçin (statik site, build komutu gerekmez).
   - Build Command: *boş bırakın*
   - Output Directory: `.` (kök dizin)
4. **Deploy** butonuna basın. Birkaç saniye içinde siteniz `https://3d-incerta-website.vercel.app` gibi bir adreste yayında olacak.
5. Kendi alan adınızı (örn. `3d-incerta.com`) bağlamak isterseniz Vercel projesinde **Settings > Domains** kısmından ekleyebilirsiniz.

---

## Notlar

- İletişim bilgileri (`E-posta`, `Telefon`) `index.html` içinde şu an yer tutucu — kendi gerçek bilgilerinizle değiştirin (arama: "info@3d-incerta.com", "+90 (___)").
- Logo şu an tipografik bir wordmark; gerçek bir logo dosyanız varsa `<a class="logo">` bloğunu bir `<img>` ile değiştirebilirsiniz.
- Form gönderiminden sonra size e-posta bildirimi gitmesini isterseniz, Supabase'de bir **Edge Function** + e-posta servisi (Resend, SendGrid vb.) entegrasyonu eklenebilir — istediğinizde bunu da kurabilirim.
