# 🧅 ft_onion

## 📰 Intro
The goal of this project is to create a web page and make it accessible from the Tor
network by creating a hidden service. The hidden service is a web service that
hides on the Tor network.

### 🐕‍🦺 Services

- ❌ **Nginx**: runs a static web page: a single index.html file. The page will
be accessible through a url of the type *xxxxxxxxx.onion*
- 🔐 **SSH** Enabled on port 4242. It can be accesed by *sshuser* passing our public key to the container.

## 📖 Usage
1. Copy your ssh public key here ``cp $HOME/.ssh/id_rsa.pub .``
2. ``docker build -t ft_onion .``
3. `` docker run -dp 4242:4242 -p 8080:80 --name "onion_server" ft_onion ``

### 🧅🕸️ Tor
4. `` docker exec [CONTAINER_ID] cat /var/lib/tor/ft_onion/hostname ``
5. Paste the output in Tor browser

### 🔐 SSH
4. `` shh sshuser@localhost -p 4242 ``

## 🔖 Docs
- [Create Tor Hidden Onion Service Using Nginx](https://arcdetri.github.io/tor-hidden-onion-nginx.html)

- [How to install nginx Debian 10](https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-debian-10)

- [SSH access inside Docker container](https://goteleport.com/blog/shell-access-docker-container-with-ssh-and-docker-exec/)
