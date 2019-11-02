FROM alpine:3.7
MAINTAINER jaybee jbdelon@linagora.com

ARG limesurveyVersion="latest"

COPY entrypoint.sh /entrypoint.sh
COPY supervisord.conf /etc/supervisord.conf
COPY db/ini.sql /ini.sql

RUN apk --no-cache add nginx curl php7-pdo_mysql php7 php7-json php7-common php7-gd php7-mbstring php7-ctype php7-simplexml php7-ldap php7-fpm php7-pdo php7-zip php7-imap php7-mysqli php7-mysqlnd php7-pdo_dblib php7-openssl php7-session nano supervisor zlib jq

RUN mkdir -p /var/www/html/limesurvey && lst=$(curl -s -u jdelon: 5f0a4303def0b0bd2224ed2fb1ecb19b5b78ed59 -H "application/vnd.github.baptiste-preview+json" "https://api.github.com/repos/LimeSurvey/LimeSurvey/tags" | jq 'map(select(.name == "remove" or .name == "list" or (.name | contains ("beta")) or (.name | contains ("alpha")) | not)) | .[].tarball_url' --raw-output) && if [ "$limesurveyVersion" == "stable" ]; then	limesurveyVersionURL="https://www.limesurvey.org/stable-release?download=2689"; elif [ "$limesurveyVersion" == "latest" ] || ( [ "$limesurveyVersion" != "latest" ] && [ "$(echo "$lst" | grep "$limesurveyVersion")" == "" ] ); then	limesurveyVersionURL="$(echo "$lst" | head -n 1)"; else	limesurveyVersionURL="$(echo "$lst" | grep "$limesurveyVersion" | tail -n 1)"; fi && echo "Downloading Limesurvey version ${limesurveyVersion} from ${limesurveyVersionURL}..." && wget -O /var/www/html/limesurvey/limesurvey.tar.gz "$limesurveyVersionURL" -q && echo "Extracting..." && tar -xzf /var/www/html/limesurvey/limesurvey.tar.gz -C /var/www/html/limesurvey && rm -f /var/www/html/limesurvey/limesurvey.tar.gz && mv /var/www/html/limesurvey/*/.* /var/www/html/limesurvey/ 2>/dev/null || true && mv /var/www/html/limesurvey/*/* /var/www/html/limesurvey/ && rm -fr /var/www/html/limesurvey/LimeSurvey-* && rm -fr /var/www/html/limesurvey/.git* && echo "Creating www user..." && chmod 755 /entrypoint.sh && adduser -D -g 'www' www && echo "Configuring permissions..." && chown -R www:www /var/www/html && chmod -R 755 /var/www/html && chmod -R 777 /var/www/html/limesurvey/tmp && chmod -R 777 /var/www/html/limesurvey/application/config && chmod -R 777 /var/www/html/limesurvey/upload && echo "Post-Processing..." && mkdir -p /run/nginx && rm -fr /etc/nginx/conf.d/*

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/supervisord"]