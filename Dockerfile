FROM ygersie/nginx-ldap-lua:1.13.9-2
#FROM weseek/nginx-auth-ldap:1.13.9-1-alpine

LABEL maintainer="NGINX Docker Maintainers <docker-maint@nginx.com>"

RUN apk update && apk add git && git clone -b 1.0.0 --single-branch https://github.com/ConnectHolland/nginx-dynamic-acl.git /usr/lib/nginx/extensions/nginx-dynamic-acl

EXPOSE 80

STOPSIGNAL SIGTERM

#CMD ["sh", "-c", "nginx-envsubst && exec nginx -g 'daemon off;'"]
CMD ["/usr/sbin/nginx","-g","daemon off;"]
