-- 3D-İnCerTa web sitesi — iletişim formu tablosu
-- Supabase SQL Editor içinde çalıştırın.

create table if not exists public.contact_submissions (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  ad_soyad text not null,
  sirket text,
  sektor text,
  mesaj text not null
);

-- Row Level Security'yi etkinleştir
alter table public.contact_submissions enable row level security;

-- Anonim (public) kullanıcıların SADECE kayıt eklemesine (insert) izin ver.
-- Okuma/güncelleme/silme yetkisi yoktur — bu sayede formu herkes doldurabilir
-- ama gönderilen kayıtları yalnızca siz (Supabase panelinden) görebilirsiniz.
create policy "Herkes form gönderebilir"
  on public.contact_submissions
  for insert
  to anon
  with check (true);

-- Not: Kayıtları görüntülemek için Supabase Dashboard > Table Editor
-- veya kendi admin panelinizden "service_role" anahtarıyla erişebilirsiniz.
