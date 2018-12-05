## SaltStack - phpVirtualBox

Tavoitteenani oli tehdä SaltStack -projekti, joka asentaa VirtualBoxin Linuxille (Ubuntu) ja että sitä voi käyttää selaimessa (phpVirtualBox).

Käytin projektin demoamisessa VirtualBox VM ympäristöä. Asensin VirtualBoxiin Linux Xubuntu 18.04 Desktop AMD64 sekä Linux Ubuntu Server 16.04.5 LTS 64-bit Virtuaalikoneet. Käytin Linux Xubuntua herrana ja Linux Ubuntu Serveriä orjana.

### Manuaalinen asennus

Asensin SaltStackin virtuaalikoneille. Päivitin molemmat koneet:
```
  $ sudo apt-get update
```
```
  $ sudo apt-get upgrade
```
Xubuntulle asensin salt-masterin:

  $ sudo apt-get -y install salt-master

Ubuntu Serverille asensin salt-minionin:

  $ sudo apt-get -y install salt-minion

Lisäsin herran IP-osoitteen /etc/salt/minion -tiedostoon.

  $ echo 'master: (IP-osoite)'|sudo tee /etc/salt/minion

Käynnistin salt-minionin uudelleen:

  $ sudo systemctl restart salt-minion

Testasin yhteyden toimivuuden:

  $ sudo salt '*' test.ping

Yhteys toimi!

#### VirtualBox 5.2 (uusin versio)

Tarkoituksena oli asentaa VirtualBox ensin manuaalisesti orjalle (Linux Ubuntu Server 16.04.5 LTS AMD64), jotta sitä olisi helpompi automatisoida Saltilla. Otin ohjeita [täältä](https://websiteforstudents.com/virtualbox-5-2-on-ubuntu-16-04-lts-server-headless/).

Päivitettyäni Ubuntu Serverin aloin asentamaan Ubuntu Linux header:eita, jotta saisin uusimman VirtualBox version (tällä hetkellä 5.,2) käyttööni.

  $ sudo apt-get -y install gcc make linux-headers-$(uname -r) dkms

![ubuntu-linux-headers](https://github.com/Eetu95/Palvelinten-hallinta-ict4tn022-3004/blob/master/miniprojektin%20kuvakaappaukset/1.PNG?raw=true)

Headerit asennettu! Sitten asensin VirtualBox repository avaimet ja lisäsin repositoryn Ubuntu Serveriin:

Avainten lisäys:

  $ sudo wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
  $ sudo wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

Repositoryn lisäys:

  $ sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" >> /etc/apt/sources.list'

![keys-and-repository](https://github.com/Eetu95/Palvelinten-hallinta-ict4tn022-3004/blob/master/miniprojektin%20kuvakaappaukset/2.PNG?raw=true)

Kaikki asentui! Sitten asensin itse VirtualBoxin (5.2) paketinhallinnasta. Päivitin ensin paketinhallinnan:

  $ sudo apt-get update

Sitten asensin VirtualBox 5.2 -paketit:

  $ sudo apt-get install virtualbox-5.2
  
Tarkistin, että versio on oikea:
 
  $ VBoxManage -v
  
 ![virtualbox-installation](https://github.com/Eetu95/Palvelinten-hallinta-ict4tn022-3004/blob/master/miniprojektin%20kuvakaappaukset/3.PNG?raw=true)

VirtualBox 5.2 asentui!


