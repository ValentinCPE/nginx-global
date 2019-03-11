FROM nginx:1.14.1-alpine

## Copy our default files config
COPY files/default.conf /etc/nginx/conf.d/

## Copy SSL keys
COPY files/ssl/certificate.crt /etc/nginx/conf.d/
COPY files/ssl/private.key /etc/nginx/conf.d/
COPY files/ssl/certificate-mbal.crt /etc/nginx/conf.d/
COPY files/ssl/private-mbal.key /etc/nginx/conf.d/

CMD ["nginx", "-g", "daemon off;"]


