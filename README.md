<h1 align="center">WebServer With Google Cloud Platform</h1>
<h3 align="center">Google Cloud Platform üzerinde Linux tabanlı Web Server kurmak. | Case | Invio </h3> 


<!-- TABLE OF CONTENTS -->
<h2 id="table-of-contents"> :book: İçindekiler</h2>

<details open="open">
  <summary>İçindekiler</summary>
  <ol>
    <li><a href="#case-hakkinda"> ➤ Case Hakkında </a></li>
    <li><a href="#gerekenler"> ➤ Gerekenler </a></li>
    <li>
      <a href="#yol-haritasi"> ➤ Yol Haritası</a>
      <ul>
        <li><a href="#vm-kurma">GCP'de Sanal Makine Kurulumu</a></li>
        <li><a href="#apache">Web Sunucusu Kurulumu</a></li>
        <li><a href="#domain">Domain Bağlama</a></li>
        <li><a href="#ssl-tls">SSL/TLS Şifreleme Kurulumu</a></li>
        <li><a href="#guvenlik">Güvenlik Duvarı Kuralları</a></li>
        <li><a href="#kimlik-dogrulama">Kimlik Doğrulama</a></li>
        <li><a href="#backup">Yedekleme ve Geri Yükleme Mekanizması</a></li>
        <li><a href="#performans-izleme">Performans ve Sağlık İzleme</a></li>
        <li><a href="#docker">Projeyi Dockerize Etme</a></li>
      </ul>
    
  </ol>
</details>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- CASE HAKKINDA -->
<h2 id="case-hakkinda"> :pencil: Case Hakkında</h2>

<h4> Linux tabanlı bir Web Sunucusu kurun</h4>
<p align="justify"> 
Bir web sitesini barındırmak için Linux tabanlı bir web sunucusu kurmakla görevlendirildiniz. Sunucu, web sayfalarına hizmet verecek şekilde
yapılandırılmalı ve ayrıca sunucuyu ve web sitesini korumak için güvenlik önlemleri uygulamalısınız. İşte meydan okuma için gereksinimler:
</p>
<p>
Bir Linux-ba sed sistemine bir web sunucusu kurun ve yapılandırın (tercih ettiğiniz herhangi bir dağıtımı kullanabilirsiniz).
Web sunucusunu temel bir web sayfası sunacak şekilde yapılandırın.
</p>
<p>
SSL/TLS şifreleme, güvenlik duvarı kuralları ve kimlik doğrulama gibi güvenlik önlemlerini uygulayın.
Veri bütünlüğünü sağlamak için bir yedekleme ve geri yükleme mekanizması kurun.
</p>
<h4>
Sunucunun performansını ve sağlığını izlemek için günlük kaydı ve izleme uygulayın.
Bonus puanlar şunlar için verilecektir:
</h4>
<p>
Ansible, Puppet veya Chef gibi bir yapılandırma yönetim aracı kullanarak web sunucusunun dağıtımını ve yapılandırmasını otomatikleştirme.
</p>
<p>
Docker kullanarak web sunucusunu kapsayıcı hale getirmek.
</p>
<p>
Trafiği birden fazla web sunucusu örneğine dağıtmak için bir yük dengeleyici uygulamak.
</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)


<!-- Gerekenler -->
<h2 id="gerekenler"> :fork_and_knife: Gerekenler</h2>


Projede kullanılan dağıtımlar, eklentiler vb.:
* Ubuntu 20.04 LTS
* Apache2
* Certbot-apache
* UFW
* rsync
* Docker

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- Yol Haritası -->
<h2 id="yol-haritasi"> :dart: Yol Haritası</h2>

<h3 id="vm-kurma"> GCP'de Sanal Makine Kurulumu :<h3/>
<br>
<p>Google Cloud ortamında Linux işletim sistemli bir VM kurup Case'i buradan yürütme kararı aldım. Bu şekilde daha hızlı monitor edebilir veya her yerden Google hesabımla erişebilirim. </p>
<p align="center">
  <img src="./img/gcp1.png"  width="738">
</p>  
<p>
Region ve Zone seçtikten sonra işletim sistemi olarak Linux'un Ubuntu dağıtımını seçiyorum. Firewall ayarından http ve https isteklerini aktif ediyorum.
Ve Sanal makineyi kuruyorum. Makineyi kurduktan sonra direkt olarak GCP üzerinden SSH bağlantısı kuruyorum. Sonrasında bu makineye web server kuracağım.
</p>
<p align="center">
  <img src="./img/gcp2.png"  width="738">
</p> 
  
![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)
  
  
<h3 id="apache"> Web Sunucusu Kurulumu :<h3/>  
  
  <p> Web sunucusu olarak Apache tercih etmemin sebebi daha önce de php tabanlı sitelere baktığım için aşina olmam. Nginx ile de kurulabilirdi. Ben bu case için Apache2 Web sunucusunu tercih ettim. Apache kurmak için: </p>
  
 ```sh
    sudo apt-get install apache2
  
 ```
  
  <p>Kurulumdan sonra çalıştıralım</p>
  
 ```sh
    sudo systemctl start apache2
  
 ```
  <p>Apache'nin otomatik olarak başlatılmasını sağlayalım</p>
  
 ```sh
    sudo systemctl enable apache2
  
 ```
  
  <p>Apache'nin durumunu kontrol edelim.</p>
  
 ```sh
    sudo systemctl status apache2
  
 ```
  
<p align="center">
  <img src="./img/apache1.png"  width="738">
</p> 
  
  
![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<h3 id="domain"> Domain bağlama :<h3/> 
  
  <p>statik web sitesini görmemiz ve SSL/TLS ayarları için bir domain bağlamak istedim. Google Domains'te hazırda bulunan bir alanadının DNS ayarlarında bir A kaydı açarak sunucunun ip adresini ekledim.</p>

<p align="center">
  <img src="./img/domain1.png"  width="738">
</p> 

<p>Domaini bağladıktan bir süre sonra arama çubuğuna domain adresinimizi yazdığımızda suncumuzun çalıştığını görüyoruz.</p>

<p align="center">
  <img src="./img/domain2.png"  width="738">
</p> 
  
  
![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

  
<h3 id="ssl-tls"> SSL/TLS Şifreleme Kurulumu :<h3/> 
  
  <p>Şimdi sırada Lets' Encrypt ile SSL/TSL ayarlarını yapmak var. Bu konu için certbot kullanabiliriz. Apache için eklentisini de indiriyoruz.</p>
  
  
  
