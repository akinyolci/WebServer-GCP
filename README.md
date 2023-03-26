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

<h3 id="vm-kurma" align="justify"> GCP'de Sanal Makine Kurulumu <h3/>
<p align="center">
  <img src="./img/example.png" alt="Size Limit CLI" width="738">
</p>  
  
  
  
  
  
  
  
  
  
  
  
  
 

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

 ```sh
    $ npm run size

      Package size: 30.08 kB with all dependencies, minified and gzipped
 ```


