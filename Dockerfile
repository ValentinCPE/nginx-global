FROM nginx:1.14.1-alpine

## Copy our default files config
COPY files/default.conf /etc/nginx/conf.d/

## Copy SSL keys
COPY files/ssl/certificate.crt /etc/nginx/conf.d/
COPY files/ssl/private.key /etc/nginx/conf.d/
COPY files/ssl/certificate-mbal.crt /etc/nginx/conf.d/
COPY files/ssl/private-mbal.key /etc/nginx/conf.d/

## Copy manjaro distribution
RUN apk update && apk add wget
RUN wget -P / https://osdn.net/dl/manjaro/manjaro-kde-18.0.4-stable-x86_64.iso
RUN mv /manjaro-kde-18.0.4-stable-x86_64.iso /usr/share/nginx/html/manjaro.iso

CMD ["nginx", "-g", "daemon off;"]