## RTT solutions

* TCP + TLS -> 3RTT to HTTP1.x/2 request
* TLS1.2 resumption / TLS1.3 (-1RTT) -> 2RTT to HTTP1.x/2 request
* TCP Fast Open (-1 RTT) + TLS1.3 -> 1RTT to HTTP1.x/2 request

![0RTT: https://cloudplatform.googleblog.com/2018/06/Introducing-QUIC-support-for-HTTPS-load-balancing.html](../illustrations/0rtt.gif "0RTT https://cloudplatform.googleblog.com/2018/06/Introducing-QUIC-support-for-HTTPS-load-balancing.html")

TCP does not allow 0RTT because TCP is session based.

<a href="./slide11.md"><img align="left" src="../illustrations/left.png" width="40" height="40" title="Previous slide" alt="Previous slide"></a>
<a href="./slide13.md"><img align="right" src="../illustrations/right.png" width="40" height="40" title="Next slide" alt="Next slide"></a>