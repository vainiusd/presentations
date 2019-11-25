## HTTP/1.0


* Browser-friendly protocol
* Provided header fields including rich metadata about both request and response (HTTP version number, status code, content type)
* Response: not limited to hypertext (Content-Type header provided ability to transmit files other than plain HTML files — e.g. scripts, stylesheets, media)
* Methods supported: GET , HEAD , POST
* Connection nature: terminated immediately after the response

```
(Connection 1 Establishment - TCP Three-Way Handshake)
Connected to xxx.xxx.xxx.xxx

(Request)
GET /my-page.html HTTP/1.0 
User-Agent: NCSA_Mosaic/2.0 (Windows 3.1)

(Response)
HTTP/1.0 200 OK 
Content-Type: text/html 
Content-Length: 137582
Expires: Thu, 01 Dec 1997 16:00:00 GMT
Last-Modified: Wed, 1 May 1996 12:45:26 GMT
Server: Apache 0.84

<HTML> 
A page with an image
  <IMG SRC="/myimage.gif">
</HTML>

(Connection 1 Closed - TCP Teardown)

------------------------------------------

(Connection 2 Establishment - TCP Three-Way Handshake)
Connected to xxx.xxx.xxx.xxx

(Request)
GET /myimage.gif HTTP/1.0
User-Agent: NCSA_Mosaic/2.0 (Windows 3.1)

(Response)
HTTP/1.0 200 OK 
Content-Type: text/gif 
Content-Length: 137582
Expires: Thu, 01 Dec 1997 16:00:00 GMT
Last-Modified: Wed, 1 May 1996 12:45:26 GMT
Server: Apache 0.84

[image content]

(Connection 2 Closed - TCP Teardown)

```
<a href="./slide6.md"><img align="left" src="../illustrations/left.png" width="40" height="40" title="Previous slide" alt="Previous slide"></a>
<a href="./slide8.md"><img align="right" src="../illustrations/right.png" width="40" height="40" title="Next slide" alt="Next slide"></a>