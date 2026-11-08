{ ... }:
{
  networking.firewall = {
    allowedTCPPorts = [
    	53
    ];
    allowedUDPPorts = [
    	53
    ];
  };
  # Disable systemd dns resolver
  services.resolved = {
    enable = false;
    settings = {
      Resolve = {
        Domains = [ "~." ];
        FallbackDNS = [ ]; # Empty to prevent bypass
        DNSOverTLS = "true";

        # github.com/systemd/systemd/issues/10579
        # dnssec = "allow-downgrade";
        DNSSEC = "false";
      };
    };
  };

  services.unbound = {
    enable = true;
    settings = {
      server = {
        access-control = [
          "127.0.0.1 allow"
          "192.168.0.0/24 allow"
        ];

        num-threads = 2;
        prefetch = true;

        serve-expired = true;
        serve-expired-ttl = 86400;
        serve-expired-client-timeout = 1800;
        serve-expired-reply-ttl = 30;

        edns-buffer-size = 1232;
        hide-identity = true;
        hide-version = true;
        qname-minimisation = true;
      };

      forward-zone = [{
        name = ".";

        forward-tls-upstream = true;

        forward-addr = [
          "9.9.9.9@853#dns.quad9.net"
          "149.112.112.112@853#dns.quad9.net"
          "1.1.1.1@853#cloudflare-dns.com"
          "1.0.0.1@853#cloudflare-dns.com"
        ];
      }];
    };
  };
}



### Debug
# cat /etc/resolv.conf
# ss -tpn | grep 853
# dig google.com @9.9.9.9
# dig 8.8.8.8 @9.9.9.9

# Functional test:
# dig google.com @127.0.0.1 -p 5335
# If this is slow or hangs → problem is Unbound or upstream (Quad9/DoT/IPv6).
# If this is fast → problem is AdGuard or system resolver.
