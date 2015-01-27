## Erzeugen der virtuellen Maschine

    ./vmbuilder.sh GIT_REPOSITORY_URL

Dabei steht `GIT_REPOSITORY_URL` für ein Git Repository in dem ein, für
`ansible-pull` vorbereitetes Playbook liegt, mit dem die Basis VM provisioniert
wird.

Für die Testing und Debugging Vorlesung ist das Repository 
[git://github.com/sebastianstigler/testing_und_debugging_tudvirt_ansible_playbook.git](git://github.com/sebastianstigler/testing_und_debugging_tudvirt_ansible_playbook.git)
vorgesehen.

## Umwandeln des qcow2 Images (Name anpassen!) in vmdk für Virtualbox

    cd ubuntu-kvm
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
