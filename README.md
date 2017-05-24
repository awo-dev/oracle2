# Oracle Deploy
This is a script coded for at custom server setup.

The script is intended for the server at Oracle VM Manager called "SBSv12l6MASTER" (in cluster pool 3).

Oracle Forms and Reports 12c has been pre-installed and pre-configured. There is a small Oracle Enterprise database server installed, but its only use is for LDAP. This instance is supposed to use an external database server. The server OS is Oracle6 (would technically work on RHEL6, however this template is Oracle6).

All software needed is pre-installed, this script is only for the final configuration of IP-addresses, hostname, database server etc.

The script will also configure ORDS, automatically deploy it to a tomcat server, retrieve SSL certificates from Lets Encrypt, and configure apache to use these certificates and serve the ORDS app through a reverse proxy to the tomcat server.

## Usage:
Important things to note here:

Firstly, it is important to note that weberp12 has to be down (it should be by default though, otherwise, execute `service weberp12 stop` and `service webnm stop`).
It is important that external DNS has been set before generating SSL certificates.

Make sure that the server can ping the database server.

Make sure that the firewall allows port 443/tcp to the server. It can be checked with nmap:

`nmap -p 443 <ip-address>`

When everything is set up correctly, execute the following command:

`./run.sh`

At the moment, it is not recommended to choose the `full` configuration just yet. A bit more testing has to be done first. If an error occurs, please don't hesitate to create an issue on this repo.

If everything had success, now reboot the server, and everything should start up automatically.
