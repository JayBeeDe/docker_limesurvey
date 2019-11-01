<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
return array(
	'components' => array(
		'db' => array(
			'connectionString' => 'mysql:host=172.17.0.13;port=3306;dbname=limesurvey_db;',
			'emulatePrepare' => true,
			'username' => 'limesurvey_user',
			'password' => 'z7xpeq2lime4survey',
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
		'publicurl' => '/limesurvey/',
	),
);
/* End of file config.php */
/* Location: ./application/config/config.php */
