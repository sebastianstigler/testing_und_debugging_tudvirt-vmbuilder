## Erzeugen der virtuellen Maschine

    ./vmbuilder.sh GIT_REPOSITORY_URL

## Umwandeln des qcow2 Images (Name anpassen!) in vmdk für Virtualbox

    kvm-img convert -O vmdk tmpLjz_ro.qcow2 Testing_und_Debugging.vmdk

## In Virtualbox das vmdk Image als Festplatte für ein neue VM verwenden.

- Betriebssystem Linux/Ubuntu
- 768 MB Arbeitsspeicher
- Audio entfernen
- CD Laufwerk entfernen
- Portumleitungen (Netwerk-> Erweitert)
```
 Name    Protokoll Host-IP   Host-Port Gast-IP Gast-Port
 -------+---------+---------+---------+-------+---------
 IPython TCP       127.0.0.1 8888      <leer>  8888
 apache  TCP       127.0.0.1 8001      <leer>  80
 ssh     TCP       127.0.0.1 22        <leer>  22
```

VM NICHT starten, sondern Datei->Appliance exportieren...
Nach dem exportieren die VM komplett löschen und die oav Datei mit
Datei->Appliance importieren... laden und testen.
