## HTTP/0.9
#### Example

* Initial version of HTTP — a simple client-server, request-response, telenet-friendly protocol
* Request nature: single-line (method + path for requested document)
* Methods supported: ```GET``` only
* Response type: hypertext only
* Connection nature: terminated immediately after the response
* No HTTP headers (cannot transfer other content type files), No status/error codes, No URLs, No versioning

```
$> telnet ashenlive.com 80

(Connection 1 Establishment - TCP Three-Way Handshake)
Connected to xxx.xxx.xxx.xxx(Request)

GET /my-page.html

(Response in hypertext)
<HTML
A very simple HTML page
</HTML>

(Connection 1 Closed - TCP Teardown)
```

<a href="./slide5.md"><img align="left" src="../illustrations/left.png" width="40" height="40" title="Previous slide" alt="Previous slide"></a>
<a href="./slide7.md"><img align="right" src="../illustrations/right.png" width="40" height="40" title="Next slide" alt="Next slide"></a>