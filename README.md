# ft_onion

## Intro
The goal of this project is to create a web page and make it accessible from the Tor
network by creating a hidden service. The hidden service is a web service that
hides on the Tor network.

## What is ft_onion?

- **Nginx**: runs a static web page: a single index.html file. The page will
be accessible through a url of the type xxxxxxxxx.onion.
-  **SSH** Enabled on port 4242. It can be accesed by *sshuser* passing our public key to the container.

## Usage

1. `` docker run -dp 4242:4242 -p 8080:80 --name "onion_server" -e [PUBLIC_KEY=your_public_key_path] tolino20/ft_onion ``

### Tor
2. `` docker exec [CONTAINER_ID] cat /var/lib/tor/ft_onion/hostname ``
3. Paste the output in Tor browser

### SSH
2. `` shh sshuser@localhost -p 4242 ``

## Docs
[Create Tor Hidden Onion Service Using Nginx](https://arcdetri.github.io/tor-hidden-onion-nginx.html)

[How to install nginx Debian 10](https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-debian-10)

[SSH access inside Docker container](https://goteleport.com/blog/shell-access-docker-container-with-ssh-and-docker-exec/)
