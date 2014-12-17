# Nginx
# VERSION 0.1

FROM smile/base

MAINTAINER Pavel Derendyaev <pderendyaev@smile-net.ru>

# Install Nginx
RUN \
	add-apt-repository -y ppa:nginx/stable && \
	apt-get update && \
	apt-get install -y nginx && \
	echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
	chown -R www-data:www-data /var/lib/nginx && \
	unlink /etc/nginx/sites-enabled/default && \
	apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Runit Nginx service
ADD nginx.sh /etc/service/nginx/run

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]
