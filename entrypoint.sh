#!/bin/sh
: "${dbName:=limesurvey_db_name}"
: "${dbHost:=limesurvey_db_host}"
: "${dbPort:=3306}"
: "${dbUser:=limesurvey_db_user}"
: "${dbPass:=limesurvey_db_pwd}"
: "${backOfficeUser:=limesurvey_backoffice_user}"
: "${backOfficePassword:=limesurvey_backoffice_password}"
: "${backOfficeLanguage:=en}"
: "${urlPrefix:=/}"

apk add openssl
apk add mysql-client

echo "INSERT INTO \`lime_users\` (\`uid\`,\`users_name\`,\`password\`,\`full_name\`,\`parent_id\`,\`lang\`,\`email\`,\`htmleditormode\`,\`templateeditormode\`,\`questionselectormode\`,\`one_time_pw\`,\`dateformat\`,\`created\`,\`modified\`) VALUES" >> /ini.sql
hashedPass="$(echo -n "${backOfficePassword}" | openssl dgst -sha256 | awk '{print $2}')"
if [ $? == 0 ]; then
	apk del openssl
fi
echo "('1', '${backOfficeUser}', '${hashedPass}', 'Administrator', '0', '${backOfficeLanguage}', 'your-email@example.net', 'default', 'default', 'default', NULL, '7', '2019-10-30 22:02:45', '2019-10-31 18:32:51');" >> /ini.sql

rm -fr /var/www/html/limesurvey/application/config/config.php
cat > /var/www/html/limesurvey/application/config/config.php <<EOF
<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
return array(
	'components' => array(
		'db' => array(
			'connectionString' => 'mysql:host=${dbHost};port=${dbPort};dbname=${dbName};',
			'emulatePrepare' => true,
			'username' => '${dbUser}',
			'password' => '${dbPass}',
			'charset' => 'utf8mb4',
			'tablePrefix' => 'lime_',
		),		
		'urlManager' => array(
			'urlFormat' => 'get',
			'rules' => array(
				// You can add your own rules here
			),
			'showScriptName' => true,
		),
	
	),
	'config'=>array(
		'debug'=>0,
		'debugsql'=>0,
		'publicurl' => '${urlPrefix}',
	),
);
/* End of file config.php */
/* Location: ./application/config/config.php */
EOF
chown www:www /var/www/html/limesurvey/application/config/config.php
chmod 777 /var/www/html/limesurvey/application/config/config.php

sed -i "s|return \$this->_scriptUrl;|return \"\\${urlPrefix}\".\$this->_scriptUrl;|g" /var/www/html/limesurvey/framework/web/CHttpRequest.php

sleep 50

mysql -s -h "${dbHost}" -u "${dbUser}" -p"${dbPass}" "${dbName}" < /ini.sql
if [ $? == 0 ]; then
	apk del mysql-client
fi

exec "$@"
