# Menggunakan image resmi PHP dengan Apache
FROM php:8.1-apache

# Salin semua file dari proyek ke dalam container
COPY . /var/www/html

# Pastikan folder memiliki izin yang benar
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Install ekstensi PHP yang dibutuhkan (sesuaikan dengan proyek Anda)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Aktifkan modul Apache (opsional, jika proyek Anda membutuhkan)
RUN a2enmod rewrite

# Expose port 80 untuk mengakses aplikasi
EXPOSE 80

# Jalankan Apache saat container dimulai
CMD ["apache2-foreground"]
