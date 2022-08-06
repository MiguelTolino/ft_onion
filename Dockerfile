FROM debian:buster
WORKDIR /config
ENV PUBLIC_KEY=id_rsa.pub

COPY . .
#Installing dependencies
RUN apt update && apt upgrade -y && \
	apt install -y nginx ssh tor 

# SSH Configuration
# Create a user “sshuser” and group “sshgroup”
RUN groupadd sshgroup && useradd -ms /bin/bash -g sshgroup sshuser
# Create sshuser directory in home
RUN mkdir -p /home/sshuser/.ssh
# Copy the ssh public key in the authorized_keys file. The idkey.pub below is a public key file you get from ssh-keygen. They are under ~/.ssh directory by default.
RUN	mv ${PUBLIC_KEY} /home/sshuser/.ssh/authorized_keys
# change ownership of the key file. 
RUN chown sshuser:sshgroup /home/sshuser/.ssh/authorized_keys && chmod 600 /home/sshuser/.ssh/authorized_keys
# Substitution of port 22 to 4242
RUN mv sshd_config /etc/ssh/

#Nginx Configuration
# Move files to their respective folders
RUN mv nginx.conf /etc/nginx/ && cp -r /config/index.html /var/www/html

# Configure TOR
RUN bash config_tor.sh
# Expose docker port 4242 80
EXPOSE 4242
EXPOSE 80
# Exec commands inside Container
CMD	service ssh start && \
	service nginx start && \
	service tor start && \
	sleep infinity & wait
