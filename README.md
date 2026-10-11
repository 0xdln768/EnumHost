# enum2host.sh

**enum2host.sh** es un script desarrollado en Bash para identificar hosts que responden a solicitudes ICMP dentro de un rango de direcciones IP privadas. Su objetivo es simplificar las tareas iniciales de reconocimiento de una red y guardar los resultados en un archivo para facilitar su consulta posterior.

## Características

- **Lenguaje:** Bash.
    
- **Líneas de código:** 69.
    
- **Dependencias identificadas:** `ping` y `date`.
    
- **Funcionalidad principal:** detección de hosts mediante ICMP.
    
- **Resultados:** almacenamiento de los hosts detectados en un archivo.
    
- **Uso previsto:** reconocimiento inicial de redes locales en entornos autorizados.
    

## ¿Qué es y cómo funciona?

`enum2host.sh` recorre un rango de direcciones IP y envía solicitudes ICMP Echo Request mediante `ping` para comprobar cuáles responden.

Por ejemplo, en una red que utiliza el rango `192.168.0.0/24`, puede comprobar las direcciones de host comprendidas entre `192.168.0.1` y `192.168.0.254`, según la configuración del script.

Los hosts que responden se registran en un archivo, lo que permite consultar los resultados y utilizarlos como punto de partida para otras tareas de enumeración.

**Importante:** la falta de respuesta a una solicitud ICMP no implica necesariamente que un host esté inactivo. Los firewalls, los filtros de red y las configuraciones de los dispositivos pueden impedir las respuestas.

## Demostración

En esta sección se puede incluir una captura de la terminal mostrando la ejecución del script y los resultados obtenidos.

<div align="center">
  <img src="Hosts.gif" alt="Proyecto">
</div>

## Ventajas y limitaciones

### Ventajas

- Automatiza la comprobación de un rango de direcciones IP.
    
- Guarda los resultados en un archivo para facilitar su consulta.
    
- Puede utilizarse como punto de partida para otras tareas de reconocimiento.
    
- Permite complementar la enumeración con herramientas como NetExec (`nxc`), cuando corresponda.
    

### Limitaciones

- Depende de las respuestas ICMP para identificar los hosts.
    
- Puede omitir equipos activos que bloqueen o filtren las solicitudes ICMP.
    
- No identifica por sí solo los servicios, puertos abiertos ni el sistema operativo de los hosts detectados.
    
- Los resultados dependen del rango configurado y de las condiciones de la red.
    

## Uso responsable

Utilizá esta herramienta únicamente en redes propias o en entornos donde tengas autorización para realizar tareas de reconocimiento.

## 0xdln768
