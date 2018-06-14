# HTTPS NGINX Proxy Cache

In this setup we have configured an https nginx proxy cache and an https website.
The nginx https proxy cache will cache incomming requests for the https website.


## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 
On a live system, this might require some changes (ports, domains, etc)

### Prerequisites

Linux OS (used Centos 7 for this demo)

### Installing and debugging NGINX

All details provided in the install_nginx.sh

### Configuring the https NGINX proxy cache

All details provided in the nginx_proxy_cache.conf

### Configuring the https website

All details provided in the nginx_https_website.conf

### Diagram
```
User --(https)--> NGINX proxy Cache --https--> Website
```
The client does a request to the Website through the Proxy Cache.
The Website responses and the Proxy Cache forwards this response to the client but it also saves it locally.
Next time the user does the same request the Proxy Cache checks if it already has this information.
If that’s the case, it responds immediately to the user, by serving this cached content, without involving the Website at all.


