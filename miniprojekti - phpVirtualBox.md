## SaltStack - phpVirtualBox

Tavoitteenani oli tehdä SaltStack -projekti, joka asentaa VirtualBoxin Linuxille (Ubuntu) ja että sitä voi käyttää selaimessa (phpVirtualBox).

Käytin projektin demoamisessa VirtualBox VM ympäristöä. Asensin VirtualBoxiin Linux Xubuntu 18.04 Desktop AMD64 sekä Linux Ubuntu Server 16.04.5 LTS 64-bit Virtuaalikoneet. Käytin Linux Xubuntua herrana ja Linux Ubuntu Serveriä orjana.

### Manuaalinen asennus

Asensin SaltStackin virtuaalikoneille. Päivitin molemmat koneet:

$ sudo apt-get update

$ sudo apt-get upgrade

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

#### VirtualBox

Tarkoituksena oli asentaa VirtualBox ensin manuaalisesti, jotta sitä olisi helpompi automatisoida Saltilla.
