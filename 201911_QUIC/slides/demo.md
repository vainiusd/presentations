## Demo

* cURL built form source
```
$ curl -vV
curl 7.67.1-DEV (x86_64-pc-linux-gnu) libcurl/7.67.1-DEV OpenSSL/3.0.0 ngtcp2/0.1.0-DEV nghttp3/0.1.0-DEV
Release-Date: [unreleased]
Protocols: dict file ftp ftps gopher http https imap imaps pop3 pop3s rtsp smb smbs smtp smtps telnet tftp
Features: AsynchDNS HTTP3 HTTPS-proxy IPv6 Largefile NTLM NTLM_WB SSL TLS-SRP UnixSockets

$ SSLKEYLOGFILE=keylog.log curl --http3 https://quic.rocks:4433/ -v
```
* Decrypted packet capture with wireshark
<div>
  <img src="../illustrations/wireshark.png" title="Wireshark logo alt="Whireshark"></a>  
</div>
<a href="./slide16.md"><img align="left" src="../illustrations/left.png" width="40" height="40" title="Previous slide" alt="Previous slide"></a>
<a href="./links.md"><img align="right" src="../illustrations/right.png" width="40" height="40" title="Next slide" alt="Next slide"></a>

