# Daemon configuration

## Docker Configuration

Default docker configuration file : `/etc/default/docker`

Usefull link : <https://docs.docker.com/engine/admin/systemd/>

### Add http_proxy to docker

Create a file called /etc/systemd/system/docker.service.d/http-proxy.conf that adds the HTTP_PROXY environment variable:

    [Service]
    Environment="HTTP_PROXY=http://proxy.example.com:80/"

Flush changes, check and restart:

    $ sudo systemctl daemon-reload
    $ systemctl show --property=Environment docker
    Environment=HTTP_PROXY=http://proxy.example.com:80/
    $ sudo systemctl restart docker

## OpenVPN Configuration

Default OpenVPN configuration file : `/etc/default/openvpn`

Uncomment

### Run VPN at startup

Uncomment in your default OpenVPN configuration file the line

    #AUTOSTART="all"

Add your vpn files in `/etc/openvpn`. Your conf should have the extension `.conf`.

## Network Configuration

For **Debian** like OS, see files in `/etc/network/` and for **CentOS**, see files in `/etc/sysconfig/network-scripts/`.
Be carefull, for **CentOS**, the interface name should be in the name of the file.

### Auto up of interfaces (with DHCP)

You will need to change `{interface}` with your real interface name (eg eth0, wlan0...).

To up your interface `{interface}` on a **Debian** like OS, add theses lines in `/etc/network/interfaces`

    allow-hotplug {interface}
    auto {interface}
    iface {interface} inet dhcp

To up your interface `{interface}` on a **CentOS** like OS, add theses lines in`/etc/sysconfig/network-scripts/ifcfg-{interface}`.

    DEVICE={interface}
    IPV6INIT=yes
    BOOTPROTO=dhcp
    ONBOOT=yes
    DEFROUTE=yes
    PEERDNS=yes
    PEERROUTES=yes
    IPV4_FAILURE_FATAL=no
    IPV6_AUTOCONF=yes
    IPV6_DEFROUTE=yes
    IPV6_PEERDNS=yes
    IPV6_PEERROUTES=yes
    IPV6_FAILURE_FATAL=no
    NAME="System {interface}"
    NOZEROCONF=1

### Auto up route for an interfaces

Here we assume that the gateway for your network is 10.0.0.1 and the subnet of the other network is 192.168.1.0/24.

To up your interface `{interface}` on a **Debian** like OS, add theses lines in `/etc/network/interfaces`

    allow-hotplug {interface}
    auto {interface}
    iface {interface} inet dhcp
      post-up route add -net 192.168.1.0/24 gw 10.0.0.1 dev eth1

To up your interface `{interface}` on a **CentOS** like OS, add theses lines in`/etc/sysconfig/network-scripts/route-{interface}`.

    192.168.1.0/24 via 10.0.0.1 dev {interface}
    default via 10.0.0.1 dev {interface}
