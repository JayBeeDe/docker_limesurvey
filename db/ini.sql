-- Only prefixed tables with: lime_
-- Date of Dump: 31-Oct-2019
--

-- --------------------------------------------------------

--
-- Table structure for table `lime_answers`
--

DROP TABLE IF EXISTS `lime_answers`;
CREATE TABLE `lime_answers` (
  `qid` int(11) NOT NULL,
  `code` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sortorder` int(11) NOT NULL,
  `assessment_value` int(11) NOT NULL DEFAULT '0',
  `language` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `scale_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`qid`,`code`,`language`,`scale_id`),
  KEY `lime_answers_idx2` (`sortorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_answers`
--


-- --------------------------------------------------------

--
-- Table structure for table `lime_assessments`
--

DROP TABLE IF EXISTS `lime_assessments`;
CREATE TABLE `lime_assessments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL DEFAULT '0',
  `scope` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gid` int(11) NOT NULL DEFAULT '0',
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `minimum` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `maximum` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  PRIMARY KEY (`id`,`language`),
  KEY `lime_assessments_idx2` (`sid`),
  KEY `lime_assessments_idx3` (`gid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_assessments`
--


-- --------------------------------------------------------

--
-- Table structure for table `lime_asset_version`
--

DROP TABLE IF EXISTS `lime_asset_version`;
CREATE TABLE `lime_asset_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_asset_version`
--


-- --------------------------------------------------------

--
-- Table structure for table `lime_boxes`
--

DROP TABLE IF EXISTS `lime_boxes`;
CREATE TABLE `lime_boxes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` int(11) DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ico` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `page` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `usergroup` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_boxes`
--

INSERT INTO `lime_boxes` (`id`,`position`,`url`,`title`,`ico`,`desc`,`page`,`usergroup`) VALUES
('1', '1', 'admin/survey/sa/newsurvey', 'Create survey', 'icon-add', 'Create a new survey', 'welcome', '-2'),
('2', '2', 'admin/survey/sa/listsurveys', 'List surveys', 'icon-list', 'List available surveys', 'welcome', '-1'),
('3', '3', 'admin/globalsettings', 'Global settings', 'icon-settings', 'Edit global settings', 'welcome', '-2');


-- --------------------------------------------------------

--
-- Table structure for table `lime_conditions`
--

DROP TABLE IF EXISTS `lime_conditions`;
CREATE TABLE `lime_conditions` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `qid` int(11) NOT NULL DEFAULT '0',
  `cqid` int(11) NOT NULL DEFAULT '0',
  `cfieldname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `method` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `scenario` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cid`),
  KEY `lime_conditions_idx` (`qid`),
  KEY `lime_conditions_idx3` (`cqid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_conditions`
--


-- --------------------------------------------------------

--
-- Table structure for table `lime_defaultvalues`
--

DROP TABLE IF EXISTS `lime_defaultvalues`;
CREATE TABLE `lime_defaultvalues` (
  `qid` int(11) NOT NULL DEFAULT '0',
  `scale_id` int(11) NOT NULL DEFAULT '0',
  `sqid` int(11) NOT NULL DEFAULT '0',
  `language` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `specialtype` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `defaultvalue` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`qid`,`specialtype`,`language`,`scale_id`,`sqid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_defaultvalues`
--


-- --------------------------------------------------------

--
-- Table structure for table `lime_expression_errors`
--

DROP TABLE IF EXISTS `lime_expression_errors`;
CREATE TABLE `lime_expression_errors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `errortime` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  `gid` int(11) DEFAULT NULL,
  `qid` int(11) DEFAULT NULL,
  `gseq` int(11) DEFAULT NULL,
  `qseq` int(11) DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `eqn` text COLLATE utf8mb4_unicode_ci,
  `prettyprint` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_expression_errors`
--


-- --------------------------------------------------------

--
-- Table structure for table `lime_failed_login_attempts`
--

DROP TABLE IF EXISTS `lime_failed_login_attempts`;
CREATE TABLE `lime_failed_login_attempts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_attempt` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_attempts` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_failed_login_attempts`
--


-- --------------------------------------------------------

--
-- Table structure for table `lime_groups`
--

DROP TABLE IF EXISTS `lime_groups`;
CREATE TABLE `lime_groups` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL DEFAULT '0',
  `group_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `group_order` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `language` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `randomization_group` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `grelevance` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`gid`,`language`),
  KEY `lime_idx1_groups` (`sid`),
  KEY `lime_idx2_groups` (`group_name`),
  KEY `lime_idx3_groups` (`language`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_groups`
--


-- --------------------------------------------------------

--
-- Table structure for table `lime_labels`
--

DROP TABLE IF EXISTS `lime_labels`;
CREATE TABLE `lime_labels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lid` int(11) NOT NULL DEFAULT '0',
  `code` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` text COLLATE utf8mb4_unicode_ci,
  `sortorder` int(11) NOT NULL,
  `language` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `assessment_value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `lime_idx1_labels` (`code`),
  KEY `lime_idx2_labels` (`sortorder`),
  KEY `lime_idx3_labels` (`language`),
  KEY `lime_idx4_labels` (`lid`,`sortorder`,`language`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_labels`
--


-- --------------------------------------------------------

--
-- Table structure for table `lime_labelsets`
--

DROP TABLE IF EXISTS `lime_labelsets`;
CREATE TABLE `lime_labelsets` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `label_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `languages` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT 'en',
  PRIMARY KEY (`lid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_labelsets`
--


-- --------------------------------------------------------

--
-- Table structure for table `lime_map_tutorial_users`
--

DROP TABLE IF EXISTS `lime_map_tutorial_users`;
CREATE TABLE `lime_map_tutorial_users` (
  `tid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `taken` int(11) DEFAULT '1',
  PRIMARY KEY (`uid`,`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_map_tutorial_users`
--


-- --------------------------------------------------------

--
-- Table structure for table `lime_notifications`
--

DROP TABLE IF EXISTS `lime_notifications`;
CREATE TABLE `lime_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `importance` int(11) NOT NULL DEFAULT '1',
  `display_class` varchar(31) COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `hash` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `first_read` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lime_notifications_pk` (`entity`,`entity_id`,`status`),
  KEY `lime_idx1_notifications` (`hash`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_notifications`
--

INSERT INTO `lime_notifications` (`id`,`entity`,`entity_id`,`title`,`message`,`status`,`importance`,`display_class`,`hash`,`created`,`first_read`) VALUES
('12', 'user', '1', 'SSL not enforced', '<span class=\"fa fa-exclamation-circle text-warning\"></span>&nbsp;Warning: Please enforce SSL encrpytion in Global settings/Security after SSL is properly configured for your webserver.', 'read', '3', 'default', '72d109bee95d1381831c7f2e8eade340a523f9702f5ec2c7cc2d25726bec3e9a', '2019-10-31 18:40:19', '2019-10-31 18:40:33');


-- --------------------------------------------------------

--
-- Table structure for table `lime_participant_attribute`
--

DROP TABLE IF EXISTS `lime_participant_attribute`;
CREATE TABLE `lime_participant_attribute` (
  `participant_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`participant_id`,`attribute_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_participant_attribute`
--


-- --------------------------------------------------------

--
-- Table structure for table `lime_participant_attribute_names`
--

DROP TABLE IF EXISTS `lime_participant_attribute_names`;
CREATE TABLE `lime_participant_attribute_names` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_type` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `defaultname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visible` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`attribute_id`,`attribute_type`),
  KEY `lime_idx_participant_attribute_names` (`attribute_id`,`attribute_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_participant_attribute_names`
--


-- --------------------------------------------------------

--
-- Table structure for table `lime_participant_attribute_names_lang`
--

DROP TABLE IF EXISTS `lime_participant_attribute_names_lang`;
CREATE TABLE `lime_participant_attribute_names_lang` (
  `attribute_id` int(11) NOT NULL,
  `attribute_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`attribute_id`,`lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_participant_attribute_names_lang`
--


-- --------------------------------------------------------

--
-- Table structure for table `lime_participant_attribute_values`
--

DROP TABLE IF EXISTS `lime_participant_attribute_values`;
CREATE TABLE `lime_participant_attribute_values` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_participant_attribute_values`
--


-- --------------------------------------------------------

--
-- Table structure for table `lime_participant_shares`
--

DROP TABLE IF EXISTS `lime_participant_shares`;
CREATE TABLE `lime_participant_shares` (
  `participant_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `share_uid` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `can_edit` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`participant_id`,`share_uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_participant_shares`
--


-- --------------------------------------------------------

--
-- Table structure for table `lime_participants`
--

DROP TABLE IF EXISTS `lime_participants`;
CREATE TABLE `lime_participants` (
  `participant_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` text COLLATE utf8mb4_unicode_ci,
  `language` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blacklisted` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_uid` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`participant_id`),
  KEY `lime_idx1_participants` (`firstname`),
  KEY `lime_idx2_participants` (`lastname`),
  KEY `lime_idx3_participants` (`language`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_participants`
--


-- --------------------------------------------------------

--
-- Table structure for table `lime_permissions`
--

DROP TABLE IF EXISTS `lime_permissions`;
CREATE TABLE `lime_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `permission` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_p` int(11) NOT NULL DEFAULT '0',
  `read_p` int(11) NOT NULL DEFAULT '0',
  `update_p` int(11) NOT NULL DEFAULT '0',
  `delete_p` int(11) NOT NULL DEFAULT '0',
  `import_p` int(11) NOT NULL DEFAULT '0',
  `export_p` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `lime_idx1_permissions` (`entity_id`,`entity`,`permission`,`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_permissions`
--

INSERT INTO `lime_permissions` (`id`,`entity`,`entity_id`,`uid`,`permission`,`create_p`,`read_p`,`update_p`,`delete_p`,`import_p`,`export_p`) VALUES
('1', 'global', '0', '1', 'superadmin', '0', '1', '0', '0', '0', '0');


-- --------------------------------------------------------

--
-- Table structure for table `lime_plugin_settings`
--

DROP TABLE IF EXISTS `lime_plugin_settings`;
CREATE TABLE `lime_plugin_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plugin_id` int(11) NOT NULL,
  `model` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_plugin_settings`
--


-- --------------------------------------------------------

--
-- Table structure for table `lime_plugins`
--

DROP TABLE IF EXISTS `lime_plugins`;
CREATE TABLE `lime_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` int(11) NOT NULL DEFAULT '0',
  `version` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_plugins`
--

INSERT INTO `lime_plugins` (`id`,`name`,`active`,`version`) VALUES
('1', 'Authdb', '1', NULL);


-- --------------------------------------------------------

--
-- Table structure for table `lime_question_attributes`
--

DROP TABLE IF EXISTS `lime_question_attributes`;
CREATE TABLE `lime_question_attributes` (
  `qaid` int(11) NOT NULL AUTO_INCREMENT,
  `qid` int(11) NOT NULL DEFAULT '0',
  `attribute` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `language` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`qaid`),
  KEY `lime_idx1_question_attributes` (`qid`),
  KEY `lime_idx2_question_attributes` (`attribute`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_question_attributes`
--


-- --------------------------------------------------------

--
-- Table structure for table `lime_questions`
--

DROP TABLE IF EXISTS `lime_questions`;
CREATE TABLE `lime_questions` (
  `qid` int(11) NOT NULL AUTO_INCREMENT,
  `parent_qid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `gid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'T',
  `title` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `preg` text COLLATE utf8mb4_unicode_ci,
  `help` text COLLATE utf8mb4_unicode_ci,
  `other` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `mandatory` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `question_order` int(11) NOT NULL,
  `language` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `scale_id` int(11) NOT NULL DEFAULT '0',
  `same_default` int(11) NOT NULL DEFAULT '0',
  `relevance` text COLLATE utf8mb4_unicode_ci,
  `modulename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`qid`,`language`),
  KEY `lime_idx1_questions` (`sid`),
  KEY `lime_idx2_questions` (`gid`),
  KEY `lime_idx3_questions` (`type`),
  KEY `lime_idx4_questions` (`title`),
  KEY `lime_idx5_questions` (`parent_qid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_questions`
--


-- --------------------------------------------------------

--
-- Table structure for table `lime_quota`
--

DROP TABLE IF EXISTS `lime_quota`;
CREATE TABLE `lime_quota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qlimit` int(11) DEFAULT NULL,
  `action` int(11) DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `autoload_url` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `lime_idx1_quota` (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_quota`
--


-- --------------------------------------------------------

--
-- Table structure for table `lime_quota_languagesettings`
--

DROP TABLE IF EXISTS `lime_quota_languagesettings`;
CREATE TABLE `lime_quota_languagesettings` (
  `quotals_id` int(11) NOT NULL AUTO_INCREMENT,
  `quotals_quota_id` int(11) NOT NULL DEFAULT '0',
  `quotals_language` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `quotals_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotals_message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `quotals_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotals_urldescrip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`quotals_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_quota_languagesettings`
--


-- --------------------------------------------------------

--
-- Table structure for table `lime_quota_members`
--

DROP TABLE IF EXISTS `lime_quota_members`;
CREATE TABLE `lime_quota_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) DEFAULT NULL,
  `qid` int(11) DEFAULT NULL,
  `quota_id` int(11) DEFAULT NULL,
  `code` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lime_idx1_quota_members` (`sid`,`qid`,`quota_id`,`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_quota_members`
--


-- --------------------------------------------------------

--
-- Table structure for table `lime_saved_control`
--

DROP TABLE IF EXISTS `lime_saved_control`;
CREATE TABLE `lime_saved_control` (
  `scid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL DEFAULT '0',
  `srid` int(11) NOT NULL DEFAULT '0',
  `identifier` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(192) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `saved_thisstep` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `saved_date` datetime NOT NULL,
  `refurl` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`scid`),
  KEY `lime_idx1_saved_control` (`sid`),
  KEY `lime_idx2_saved_control` (`srid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_saved_control`
--


-- --------------------------------------------------------

--
-- Table structure for table `lime_sessions`
--

DROP TABLE IF EXISTS `lime_sessions`;
CREATE TABLE `lime_sessions` (
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `data` longblob,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_sessions`
--


-- --------------------------------------------------------

--
-- Table structure for table `lime_settings_global`
--

DROP TABLE IF EXISTS `lime_settings_global`;
CREATE TABLE `lime_settings_global` (
  `stg_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `stg_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`stg_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_settings_global`
--

INSERT INTO `lime_settings_global` (`stg_name`,`stg_value`) VALUES
('DBVersion', '359'),
('SessionName', '`IW<RXE%}GesJ(f|H[!E[YKf\\[n5*#Ttp8K:M3u|blr6{CUJwX3z[MJUz:>{|J8u'),
('sitename', ''),
('siteadminname', 'Administrator'),
('siteadminemail', 'your-email@example.net'),
('siteadminbounce', 'your-email@example.net'),
('defaultlang', 'fr'),
('AssetsVersion', '30104'),
('show_logo', 'hide'),
('boxes_by_row', '3'),
('boxes_offset', '3'),
('restrictToLanguages', 'de en fr'),
('defaulthtmleditormode', 'inline'),
('defaultquestionselectormode', 'default'),
('defaultthemeteeditormode', 'default'),
('javascriptdebugbcknd', '0'),
('javascriptdebugfrntnd', '0'),
('defaulttheme', 'fruity'),
('x_frame_options', 'sameorigin'),
('force_ssl', 'neither'),
('admintheme', 'Free_Magenta'),
('emailmethod', 'mail'),
('emailsmtphost', ''),
('emailsmtppassword', ''),
('bounceaccounthost', ''),
('bounceaccounttype', 'off'),
('bounceencryption', 'off'),
('bounceaccountuser', ''),
('bounceaccountpass', ''),
('emailsmtpssl', ''),
('emailsmtpdebug', '0'),
('emailsmtpuser', ''),
('filterxsshtml', '1'),
('shownoanswer', '1'),
('showxquestions', 'choose'),
('showgroupinfo', 'choose'),
('showqnumcode', 'choose'),
('repeatheadings', '25'),
('maxemails', '50'),
('iSessionExpirationTime', '7200'),
('ipInfoDbAPIKey', ''),
('pdffontsize', '9'),
('pdfshowsurveytitle', 'Y'),
('pdfshowheader', 'N'),
('pdflogowidth', '50'),
('pdfheadertitle', ''),
('pdfheaderstring', ''),
('bPdfQuestionFill', '1'),
('bPdfQuestionBold', '0'),
('bPdfQuestionBorder', '1'),
('bPdfResponseBorder', '1'),
('googleMapsAPIKey', ''),
('googleanalyticsapikey', ''),
('googletranslateapikey', ''),
('surveyPreview_require_Auth', '1'),
('RPCInterface', 'off'),
('rpc_publish_api', ''),
('add_access_control_header', '1'),
('characterset', 'auto'),
('sideMenuBehaviour', 'adaptive'),
('timeadjust', '+0 minutes'),
('usercontrolSameGroupPolicy', '1');


-- --------------------------------------------------------

--
-- Table structure for table `lime_settings_user`
--

DROP TABLE IF EXISTS `lime_settings_user`;
CREATE TABLE `lime_settings_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `entity` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity_id` varchar(31) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stg_name` varchar(63) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stg_value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `lime_idx1_settings_user` (`uid`),
  KEY `lime_idx2_settings_user` (`entity`),
  KEY `lime_idx3_settings_user` (`entity_id`),
  KEY `lime_idx4_settings_user` (`stg_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_settings_user`
--


-- --------------------------------------------------------

--
-- Table structure for table `lime_survey_links`
--

DROP TABLE IF EXISTS `lime_survey_links`;
CREATE TABLE `lime_survey_links` (
  `participant_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token_id` int(11) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_invited` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  PRIMARY KEY (`participant_id`,`token_id`,`survey_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_survey_links`
--


-- --------------------------------------------------------

--
-- Table structure for table `lime_survey_url_parameters`
--

DROP TABLE IF EXISTS `lime_survey_url_parameters`;
CREATE TABLE `lime_survey_url_parameters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL,
  `parameter` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `targetqid` int(11) DEFAULT NULL,
  `targetsqid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_survey_url_parameters`
--


-- --------------------------------------------------------

--
-- Table structure for table `lime_surveymenu`
--

DROP TABLE IF EXISTS `lime_surveymenu`;
CREATE TABLE `lime_surveymenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `survey_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ordering` int(11) DEFAULT '0',
  `level` int(11) DEFAULT '0',
  `title` varchar(168) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `position` varchar(192) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'side',
  `description` text COLLATE utf8mb4_unicode_ci,
  `showincollapse` int(11) DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '0',
  `changed_at` datetime DEFAULT NULL,
  `changed_by` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `lime_surveymenu_name` (`name`),
  KEY `lime_idx2_surveymenu` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_surveymenu`
--

INSERT INTO `lime_surveymenu` (`id`,`parent_id`,`survey_id`,`user_id`,`name`,`ordering`,`level`,`title`,`position`,`description`,`showincollapse`,`active`,`changed_at`,`changed_by`,`created_at`,`created_by`) VALUES
('1', NULL, NULL, NULL, 'settings', '1', '0', 'Survey settings', 'side', 'Survey settings', '1', '1', '2019-10-30 22:01:21', '0', '2019-10-30 22:01:21', '0'),
('2', NULL, NULL, NULL, 'mainmenu', '2', '0', 'Survey menu', 'side', 'Main survey menu', '1', '1', '2019-10-30 22:01:21', '0', '2019-10-30 22:01:21', '0'),
('3', NULL, NULL, NULL, 'quickmenu', '3', '0', 'Quick menu', 'collapsed', 'Quick menu', '0', '1', '2019-10-30 22:01:21', '0', '2019-10-30 22:01:21', '0');


-- --------------------------------------------------------

--
-- Table structure for table `lime_surveymenu_entries`
--

DROP TABLE IF EXISTS `lime_surveymenu_entries`;
CREATE TABLE `lime_surveymenu_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ordering` int(11) DEFAULT '0',
  `name` varchar(168) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `title` varchar(168) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_title` varchar(168) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_description` text COLLATE utf8mb4_unicode_ci,
  `menu_icon` varchar(192) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_icon_type` varchar(192) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_class` varchar(192) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_link` varchar(192) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `action` varchar(192) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `template` varchar(192) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `partial` varchar(192) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `classes` varchar(192) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `permission` varchar(192) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `permission_grade` varchar(192) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8mb4_unicode_ci,
  `getdatamethod` varchar(192) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en-GB',
  `showincollapse` int(11) DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '0',
  `changed_at` datetime DEFAULT NULL,
  `changed_by` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `lime_surveymenu_entries_name` (`name`),
  KEY `lime_idx1_surveymenu_entries` (`menu_id`),
  KEY `lime_idx5_surveymenu_entries` (`menu_title`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_surveymenu_entries`
--

INSERT INTO `lime_surveymenu_entries` (`id`,`menu_id`,`user_id`,`ordering`,`name`,`title`,`menu_title`,`menu_description`,`menu_icon`,`menu_icon_type`,`menu_class`,`menu_link`,`action`,`template`,`partial`,`classes`,`permission`,`permission_grade`,`data`,`getdatamethod`,`language`,`showincollapse`,`active`,`changed_at`,`changed_by`,`created_at`,`created_by`) VALUES
('1', '1', NULL, '1', 'overview', 'Survey overview', 'Overview', 'Open the general survey overview', 'list', 'fontawesome', '', 'admin/survey/sa/view', '', '', '', '', '', '', '{\"render\": { \"link\": {\"data\": {\"surveyid\": [\"survey\",\"sid\"]}}}}', '', 'en-GB', '0', '1', '2019-10-30 22:01:21', '0', '2019-10-30 22:01:21', '0'),
('2', '1', NULL, '2', 'generalsettings', 'General survey settings', 'General settings', 'Open general survey settings', 'gears', 'fontawesome', '', '', 'updatesurveylocalesettings_generalsettings', 'editLocalSettings_main_view', '/admin/survey/subview/accordion/_generaloptions_panel', '', 'surveysettings', 'read', NULL, '_generalTabEditSurvey', 'en-GB', '1', '1', '2019-10-30 22:01:21', '0', '2019-10-30 22:01:21', '0'),
('3', '1', NULL, '3', 'surveytexts', 'Survey text elements', 'Text elements', 'Survey text elements', 'file-text-o', 'fontawesome', '', '', 'updatesurveylocalesettings', 'editLocalSettings_main_view', '/admin/survey/subview/tab_edit_view', '', 'surveylocale', 'read', NULL, '_getTextEditData', 'en-GB', '1', '1', '2019-10-30 22:01:21', '0', '2019-10-30 22:01:21', '0'),
('4', '1', NULL, '4', 'datasecurity', 'Data policy settings', 'Data policy settings', 'Edit data policy settings', 'shield', 'fontawesome', '', '', 'updatesurveylocalesettings', 'editLocalSettings_main_view', '/admin/survey/subview/tab_edit_view_datasecurity', '', 'surveylocale', 'read', NULL, '_getDataSecurityEditData', 'en-GB', '1', '1', '2019-10-30 22:01:21', '0', '2019-10-30 22:01:21', '0'),
('5', '1', NULL, '5', 'theme_options', 'Theme options', 'Theme options', 'Edit theme options for this survey', 'paint-brush', 'fontawesome', '', 'admin/themeoptions/sa/updatesurvey', '', '', '', '', 'surveysettings', 'update', '{\"render\": {\"link\": { \"pjaxed\": true, \"data\": {\"surveyid\": [\"survey\",\"sid\"], \"gsid\":[\"survey\",\"gsid\"]}}}}', '', 'en-GB', '0', '1', '2019-10-30 22:01:21', '0', '2019-10-30 22:01:21', '0'),
('6', '1', NULL, '6', 'presentation', 'Presentation & navigation settings', 'Presentation', 'Edit presentation and navigation settings', 'eye-slash', 'fontawesome', '', '', 'updatesurveylocalesettings', 'editLocalSettings_main_view', '/admin/survey/subview/accordion/_presentation_panel', '', 'surveylocale', 'read', NULL, '_tabPresentationNavigation', 'en-GB', '0', '1', '2019-10-30 22:01:21', '0', '2019-10-30 22:01:21', '0'),
('7', '1', NULL, '7', 'tokens', 'Survey participant settings', 'Participant settings', 'Set additional options for survey participants', 'users', 'fontawesome', '', '', 'updatesurveylocalesettings', 'editLocalSettings_main_view', '/admin/survey/subview/accordion/_tokens_panel', '', 'surveylocale', 'read', NULL, '_tabTokens', 'en-GB', '0', '1', '2019-10-30 22:01:21', '0', '2019-10-30 22:01:21', '0'),
('8', '1', NULL, '8', 'notification', 'Notification and data management settings', 'Notifications & data', 'Edit settings for notification and data management', 'feed', 'fontawesome', '', '', 'updatesurveylocalesettings', 'editLocalSettings_main_view', '/admin/survey/subview/accordion/_notification_panel', '', 'surveylocale', 'read', NULL, '_tabNotificationDataManagement', 'en-GB', '0', '1', '2019-10-30 22:01:21', '0', '2019-10-30 22:01:21', '0'),
('9', '1', NULL, '9', 'publication', 'Publication & access control settings', 'Publication & access', 'Edit settings for publication and access control', 'key', 'fontawesome', '', '', 'updatesurveylocalesettings', 'editLocalSettings_main_view', '/admin/survey/subview/accordion/_publication_panel', '', 'surveylocale', 'read', NULL, '_tabPublicationAccess', 'en-GB', '0', '1', '2019-10-30 22:01:21', '0', '2019-10-30 22:01:21', '0'),
('10', '2', NULL, '1', 'listQuestions', 'List questions', 'List questions', 'List questions', 'list', 'fontawesome', '', 'admin/survey/sa/listquestions', '', '', '', '', 'surveycontent', 'read', '{\"render\": { \"link\": {\"data\": {\"surveyid\": [\"survey\",\"sid\"]}}}}', '', 'en-GB', '1', '1', '2019-10-30 22:01:21', '0', '2019-10-30 22:01:21', '0'),
('11', '2', NULL, '2', 'listQuestionGroups', 'List question groups', 'List question groups', 'List question groups', 'th-list', 'fontawesome', '', 'admin/survey/sa/listquestiongroups', '', '', '', '', 'surveycontent', 'read', '{\"render\": { \"link\": {\"data\": {\"surveyid\": [\"survey\",\"sid\"]}}}}', '', 'en-GB', '1', '1', '2019-10-30 22:01:21', '0', '2019-10-30 22:01:21', '0'),
('12', '2', NULL, '3', 'reorder', 'Reorder questions/question groups', 'Reorder questions/question groups', 'Reorder questions/question groups', 'icon-organize', 'iconclass', '', 'admin/survey/sa/organize/', '', '', '', '', 'surveycontent', 'update', '{\"render\": {\"isActive\": false, \"link\": {\"data\": {\"surveyid\": [\"survey\",\"sid\"]}}}}', '', 'en-GB', '1', '1', '2019-10-30 22:01:21', '0', '2019-10-30 22:01:21', '0'),
('13', '2', NULL, '4', 'responses', 'Responses', 'Responses', 'Responses', 'icon-browse', 'iconclass', '', 'admin/responses/sa/browse/', '', '', '', '', 'responses', 'read', '{\"render\": {\"isActive\": true, \"link\": {\"data\": {\"surveyid\": [\"survey\", \"sid\"]}}}}', '', 'en-GB', '1', '1', '2019-10-30 22:01:21', '0', '2019-10-30 22:01:21', '0'),
('14', '2', NULL, '5', 'participants', 'Survey participants', 'Survey participants', 'Go to survey participant and token settings', 'user', 'fontawesome', '', 'admin/tokens/sa/index/', '', '', '', '', 'surveysettings', 'update', '{\"render\": { \"link\": {\"data\": {\"surveyid\": [\"survey\",\"sid\"]}}}}', '', 'en-GB', '1', '1', '2019-10-30 22:01:21', '0', '2019-10-30 22:01:21', '0'),
('15', '2', NULL, '6', 'statistics', 'Statistics', 'Statistics', 'Statistics', 'bar-chart', 'fontawesome', '', 'admin/statistics/sa/index/', '', '', '', '', 'statistics', 'read', '{\"render\": {\"isActive\": true, \"link\": {\"data\": {\"surveyid\": [\"survey\", \"sid\"]}}}}', '', 'en-GB', '1', '1', '2019-10-30 22:01:21', '0', '2019-10-30 22:01:21', '0'),
('16', '2', NULL, '7', 'quotas', 'Edit quotas', 'Quotas', 'Edit quotas for this survey.', 'tasks', 'fontawesome', '', 'admin/quotas/sa/index/', '', '', '', '', 'quotas', 'read', '{\"render\": { \"link\": {\"data\": {\"surveyid\": [\"survey\",\"sid\"]}}}}', '', 'en-GB', '0', '1', '2019-10-30 22:01:21', '0', '2019-10-30 22:01:21', '0'),
('17', '2', NULL, '8', 'assessments', 'Edit assessments', 'Assessments', 'Edit and look at the assessements for this survey.', 'comment-o', 'fontawesome', '', 'admin/assessments/sa/index/', '', '', '', '', 'assessments', 'read', '{\"render\": { \"link\": {\"data\": {\"surveyid\": [\"survey\",\"sid\"]}}}}', '', 'en-GB', '0', '1', '2019-10-30 22:01:21', '0', '2019-10-30 22:01:21', '0'),
('18', '2', NULL, '9', 'surveypermissions', 'Edit survey permissions', 'Survey permissions', 'Edit permissions for this survey', 'lock', 'fontawesome', '', 'admin/surveypermission/sa/view/', '', '', '', '', 'surveysecurity', 'read', '{\"render\": { \"link\": {\"data\": {\"surveyid\": [\"survey\",\"sid\"]}}}}', '', 'en-GB', '0', '1', '2019-10-30 22:01:21', '0', '2019-10-30 22:01:21', '0'),
('19', '2', NULL, '10', 'emailtemplates', 'Email templates', 'Email templates', 'Edit the templates for invitation, reminder and registration emails', 'envelope-square', 'fontawesome', '', 'admin/emailtemplates/sa/index/', '', '', '', '', 'surveylocale', 'read', '{\"render\": { \"link\": {\"data\": {\"surveyid\": [\"survey\",\"sid\"]}}}}', '', 'en-GB', '0', '1', '2019-10-30 22:01:21', '0', '2019-10-30 22:01:21', '0'),
('20', '2', NULL, '11', 'panelintegration', 'Edit survey panel integration', 'Panel integration', 'Define panel integrations for your survey', 'link', 'fontawesome', '', '', 'updatesurveylocalesettings', 'editLocalSettings_main_view', '/admin/survey/subview/accordion/_integration_panel', '', 'surveylocale', 'read', '{\"render\": {\"link\": { \"pjaxed\": false}}}', '_tabPanelIntegration', 'en-GB', '0', '1', '2019-10-30 22:01:21', '0', '2019-10-30 22:01:21', '0'),
('21', '2', NULL, '12', 'resources', 'Add/edit resources (files/images) for this survey', 'Resources', 'Add/edit resources (files/images) for this survey', 'file', 'fontawesome', '', '', 'updatesurveylocalesettings', 'editLocalSettings_main_view', '/admin/survey/subview/accordion/_resources_panel', '', 'surveylocale', 'read', NULL, '_tabResourceManagement', 'en-GB', '0', '1', '2019-10-30 22:01:21', '0', '2019-10-30 22:01:21', '0'),
('22', '2', NULL, '13', 'plugins', 'Simple plugin settings', 'Simple plugins', 'Edit simple plugin settings', 'plug', 'fontawesome', '', '', 'updatesurveylocalesettings', 'editLocalSettings_main_view', '/admin/survey/subview/accordion/_plugins_panel', '', 'surveysettings', 'read', '{\"render\": {\"link\": {\"data\": {\"surveyid\": [\"survey\",\"sid\"]}}}}', '_pluginTabSurvey', 'en-GB', '0', '1', '2019-10-30 22:01:21', '0', '2019-10-30 22:01:21', '0'),
('23', '3', NULL, '1', 'activateSurvey', 'Activate survey', 'Activate survey', 'Activate survey', 'play', 'fontawesome', '', 'admin/survey/sa/activate', '', '', '', '', 'surveyactivation', 'update', '{\"render\": {\"isActive\": false, \"link\": {\"data\": {\"surveyid\": [\"survey\",\"sid\"]}}}}', '', 'en-GB', '1', '1', '2019-10-30 22:01:21', '0', '2019-10-30 22:01:21', '0'),
('24', '3', NULL, '2', 'deactivateSurvey', 'Stop this survey', 'Stop this survey', 'Stop this survey', 'stop', 'fontawesome', '', 'admin/survey/sa/deactivate', '', '', '', '', 'surveyactivation', 'update', '{\"render\": {\"isActive\": true, \"link\": {\"data\": {\"surveyid\": [\"survey\",\"sid\"]}}}}', '', 'en-GB', '1', '1', '2019-10-30 22:01:21', '0', '2019-10-30 22:01:21', '0'),
('25', '3', NULL, '3', 'testSurvey', 'Go to survey', 'Go to survey', 'Go to survey', 'cog', 'fontawesome', '', 'survey/index/', '', '', '', '', '', '', '{\"render\": {\"link\": {\"external\": true, \"data\": {\"sid\": [\"survey\",\"sid\"], \"newtest\": \"Y\", \"lang\": [\"survey\",\"language\"]}}}}', '', 'en-GB', '1', '1', '2019-10-30 22:01:21', '0', '2019-10-30 22:01:21', '0'),
('26', '3', NULL, '4', 'surveyLogicFile', 'Survey logic file', 'Survey logic file', 'Survey logic file', 'sitemap', 'fontawesome', '', 'admin/expressions/sa/survey_logic_file/', '', '', '', '', 'surveycontent', 'read', '{\"render\": { \"link\": {\"data\": {\"sid\": [\"survey\",\"sid\"]}}}}', '', 'en-GB', '1', '1', '2019-10-30 22:01:21', '0', '2019-10-30 22:01:21', '0'),
('27', '3', NULL, '5', 'cpdb', 'Central participant database', 'Central participant database', 'Central participant database', 'users', 'fontawesome', '', 'admin/participants/sa/displayParticipants', '', '', '', '', 'tokens', 'read', '{\"render\": {\"link\": {}}}', '', 'en-GB', '1', '1', '2019-10-30 22:01:21', '0', '2019-10-30 22:01:21', '0');


-- --------------------------------------------------------

--
-- Table structure for table `lime_surveys`
--

DROP TABLE IF EXISTS `lime_surveys`;
CREATE TABLE `lime_surveys` (
  `sid` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `gsid` int(11) DEFAULT '1',
  `admin` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `expires` datetime DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `adminemail` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `anonymized` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `faxto` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `format` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `savetimings` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `template` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `language` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_languages` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datestamp` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `usecookie` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `allowregister` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `allowsave` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `autonumber_start` int(11) NOT NULL DEFAULT '0',
  `autoredirect` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `allowprev` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `printanswers` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `ipaddr` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `refurl` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `datecreated` datetime DEFAULT NULL,
  `showsurveypolicynotice` int(11) DEFAULT '0',
  `publicstatistics` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `publicgraphs` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `listpublic` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `htmlemail` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `sendconfirmation` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `tokenanswerspersistence` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `assessments` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `usecaptcha` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `usetokens` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `bounce_email` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributedescriptions` text COLLATE utf8mb4_unicode_ci,
  `emailresponseto` text COLLATE utf8mb4_unicode_ci,
  `emailnotificationto` text COLLATE utf8mb4_unicode_ci,
  `tokenlength` int(11) NOT NULL DEFAULT '15',
  `showxquestions` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT 'Y',
  `showgroupinfo` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT 'B',
  `shownoanswer` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT 'Y',
  `showqnumcode` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT 'X',
  `bouncetime` int(11) DEFAULT NULL,
  `bounceprocessing` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `bounceaccounttype` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bounceaccounthost` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bounceaccountpass` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bounceaccountencryption` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bounceaccountuser` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `showwelcome` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT 'Y',
  `showprogress` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT 'Y',
  `questionindex` int(11) NOT NULL DEFAULT '0',
  `navigationdelay` int(11) NOT NULL DEFAULT '0',
  `nokeyboard` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `alloweditaftercompletion` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `googleanalyticsstyle` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `googleanalyticsapikey` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `lime_idx1_surveys` (`owner_id`),
  KEY `lime_idx2_surveys` (`gsid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_surveys`
--


-- --------------------------------------------------------

--
-- Table structure for table `lime_surveys_groups`
--

DROP TABLE IF EXISTS `lime_surveys_groups`;
CREATE TABLE `lime_surveys_groups` (
  `gsid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `description` text COLLATE utf8mb4_unicode_ci,
  `sortorder` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`gsid`),
  KEY `lime_idx1_surveys_groups` (`name`),
  KEY `lime_idx2_surveys_groups` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_surveys_groups`
--

INSERT INTO `lime_surveys_groups` (`gsid`,`name`,`title`,`template`,`description`,`sortorder`,`owner_id`,`parent_id`,`created`,`modified`,`created_by`) VALUES
('1', 'default', 'Default', NULL, 'Default survey group', '0', '1', NULL, '2019-10-30 22:01:21', '2019-10-30 22:01:21', '1');


-- --------------------------------------------------------

--
-- Table structure for table `lime_surveys_languagesettings`
--

DROP TABLE IF EXISTS `lime_surveys_languagesettings`;
CREATE TABLE `lime_surveys_languagesettings` (
  `surveyls_survey_id` int(11) NOT NULL,
  `surveyls_language` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `surveyls_title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surveyls_description` text COLLATE utf8mb4_unicode_ci,
  `surveyls_welcometext` text COLLATE utf8mb4_unicode_ci,
  `surveyls_endtext` text COLLATE utf8mb4_unicode_ci,
  `surveyls_policy_notice` text COLLATE utf8mb4_unicode_ci,
  `surveyls_policy_error` text COLLATE utf8mb4_unicode_ci,
  `surveyls_policy_notice_label` varchar(192) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surveyls_url` text COLLATE utf8mb4_unicode_ci,
  `surveyls_urldescription` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surveyls_email_invite_subj` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surveyls_email_invite` text COLLATE utf8mb4_unicode_ci,
  `surveyls_email_remind_subj` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surveyls_email_remind` text COLLATE utf8mb4_unicode_ci,
  `surveyls_email_register_subj` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surveyls_email_register` text COLLATE utf8mb4_unicode_ci,
  `surveyls_email_confirm_subj` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surveyls_email_confirm` text COLLATE utf8mb4_unicode_ci,
  `surveyls_dateformat` int(11) NOT NULL DEFAULT '1',
  `surveyls_attributecaptions` text COLLATE utf8mb4_unicode_ci,
  `email_admin_notification_subj` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_admin_notification` text COLLATE utf8mb4_unicode_ci,
  `email_admin_responses_subj` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_admin_responses` text COLLATE utf8mb4_unicode_ci,
  `surveyls_numberformat` int(11) NOT NULL DEFAULT '0',
  `attachments` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`surveyls_survey_id`,`surveyls_language`),
  KEY `lime_idx1_surveys_languagesettings` (`surveyls_title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_surveys_languagesettings`
--


-- --------------------------------------------------------

--
-- Table structure for table `lime_template_configuration`
--

DROP TABLE IF EXISTS `lime_template_configuration`;
CREATE TABLE `lime_template_configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sid` int(11) DEFAULT NULL,
  `gsid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `files_css` text COLLATE utf8mb4_unicode_ci,
  `files_js` text COLLATE utf8mb4_unicode_ci,
  `files_print_css` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `cssframework_name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cssframework_css` text COLLATE utf8mb4_unicode_ci,
  `cssframework_js` text COLLATE utf8mb4_unicode_ci,
  `packages_to_load` text COLLATE utf8mb4_unicode_ci,
  `packages_ltr` text COLLATE utf8mb4_unicode_ci,
  `packages_rtl` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `lime_idx1_template_configuration` (`template_name`),
  KEY `lime_idx2_template_configuration` (`sid`),
  KEY `lime_idx3_template_configuration` (`gsid`),
  KEY `lime_idx4_template_configuration` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_template_configuration`
--

INSERT INTO `lime_template_configuration` (`id`,`template_name`,`sid`,`gsid`,`uid`,`files_css`,`files_js`,`files_print_css`,`options`,`cssframework_name`,`cssframework_css`,`cssframework_js`,`packages_to_load`,`packages_ltr`,`packages_rtl`) VALUES
('1', 'vanilla', NULL, NULL, NULL, '{\"add\":[\"css/ajaxify.css\",\"css/theme.css\",\"css/custom.css\"]}', '{\"add\":[\"scripts/theme.js\",\"scripts/ajaxify.js\",\"scripts/custom.js\"]}', '{\"add\":[\"css/print_theme.css\"]}', '{\"ajaxmode\":\"on\",\"brandlogo\":\"on\",\"container\":\"on\", \"hideprivacyinfo\": \"off\", \"brandlogofile\":\"./files/logo.png\",\"font\":\"noto\"}', 'bootstrap', '{}', '', '{\"add\":[\"pjax\",\"font-noto\",\"moment\"]}', NULL, NULL),
('2', 'fruity', NULL, NULL, NULL, '{\"add\":[\"css/ajaxify.css\",\"css/animate.css\",\"css/variations/sea_green.css\",\"css/theme.css\",\"css/custom.css\"]}', '{\"add\":[\"scripts/theme.js\",\"scripts/ajaxify.js\",\"scripts/custom.js\"]}', '{\"add\":[\"css/print_theme.css\"]}', '{\"ajaxmode\":\"on\",\"brandlogo\":\"on\",\"brandlogofile\":\"./files/logo.png\",\"container\":\"on\",\"backgroundimage\":\"off\",\"backgroundimagefile\":null,\"animatebody\":\"off\",\"bodyanimation\":\"fadeInRight\",\"bodyanimationduration\":\"500\",\"animatequestion\":\"off\",\"questionanimation\":\"flipInX\",\"questionanimationduration\":\"500\",\"animatealert\":\"off\",\"alertanimation\":\"shake\",\"alertanimationduration\":\"500\",\"font\":\"noto\",\"bodybackgroundcolor\":\"#ffffff\",\"fontcolor\":\"#444444\",\"questionbackgroundcolor\":\"#ffffff\",\"questionborder\":\"on\",\"questioncontainershadow\":\"on\",\"checkicon\":\"f00c\",\"animatecheckbox\":\"on\",\"checkboxanimation\":\"rubberBand\",\"checkboxanimationduration\":\"500\",\"animateradio\":\"on\",\"radioanimation\":\"zoomIn\",\"radioanimationduration\":\"500\",\"zebrastriping\":\"off\",\"stickymatrixheaders\":\"off\",\"greyoutselected\":\"off\",\"hideprivacyinfo\":\"off\",\"crosshover\":\"off\",\"showpopups\":\"1\"}', 'bootstrap', '{}', '', '{\"add\":[\"pjax\",\"font-noto\",\"moment\"]}', NULL, NULL),
('3', 'bootswatch', NULL, NULL, NULL, '{\"add\":[\"css/ajaxify.css\",\"css/theme.css\",\"css/custom.css\"]}', '{\"add\":[\"scripts/theme.js\",\"scripts/ajaxify.js\",\"scripts/custom.js\"]}', '{\"add\":[\"css/print_theme.css\"]}', '{\"ajaxmode\":\"on\",\"brandlogo\":\"on\",\"container\":\"on\",\"brandlogofile\":\"./files/logo.png\"}', 'bootstrap', '{\"replace\":[[\"css/bootstrap.css\",\"css/variations/flatly.min.css\"]]}', '', '{\"add\":[\"pjax\",\"font-noto\",\"moment\"]}', NULL, NULL);


-- --------------------------------------------------------

--
-- Table structure for table `lime_templates`
--

DROP TABLE IF EXISTS `lime_templates`;
CREATE TABLE `lime_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creation_date` datetime DEFAULT NULL,
  `author` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copyright` text COLLATE utf8mb4_unicode_ci,
  `license` text COLLATE utf8mb4_unicode_ci,
  `version` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_version` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `view_folder` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `files_folder` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `last_update` datetime DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `extends` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lime_idx1_templates` (`name`),
  KEY `lime_idx2_templates` (`title`),
  KEY `lime_idx3_templates` (`owner_id`),
  KEY `lime_idx4_templates` (`extends`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_templates`
--

INSERT INTO `lime_templates` (`id`,`name`,`folder`,`title`,`creation_date`,`author`,`author_email`,`author_url`,`copyright`,`license`,`version`,`api_version`,`view_folder`,`files_folder`,`description`,`last_update`,`owner_id`,`extends`) VALUES
('1', 'vanilla', 'vanilla', 'Vanilla Theme', '2019-10-30 22:01:22', 'Louis Gac', 'louis.gac@limesurvey.org', 'https://www.limesurvey.org/', 'Copyright (C) 2007-2017 The LimeSurvey Project Team\\r\\nAll rights reserved.', 'License: GNU/GPL License v2 or later, see LICENSE.php\\r\\n\\r\\nLimeSurvey is free software. This version may have been modified pursuant to the GNU General Public License, and as distributed it includes or is derivative of works licensed under the GNU General Public License or other free or open source software licenses. See COPYRIGHT.php for copyright notices and details.', '3.0', '3.0', 'views', 'files', '<strong>LimeSurvey Bootstrap Vanilla Survey Theme</strong><br>A clean and simple base that can be used by developers to create their own Bootstrap based theme.', NULL, '1', ''),
('2', 'fruity', 'fruity', 'Fruity Theme', '2019-10-30 22:01:22', 'Louis Gac', 'louis.gac@limesurvey.org', 'https://www.limesurvey.org/', 'Copyright (C) 2007-2017 The LimeSurvey Project Team\\r\\nAll rights reserved.', 'License: GNU/GPL License v2 or later, see LICENSE.php\\r\\n\\r\\nLimeSurvey is free software. This version may have been modified pursuant to the GNU General Public License, and as distributed it includes or is derivative of works licensed under the GNU General Public License or other free or open source software licenses. See COPYRIGHT.php for copyright notices and details.', '3.0', '3.0', 'views', 'files', '<strong>LimeSurvey Fruity Theme</strong><br>A fruity theme for a flexible use. This theme offers monochromes variations and many options for easy customizations.', NULL, '1', 'vanilla'),
('3', 'bootswatch', 'bootswatch', 'Bootswatch Theme', '2019-10-30 22:01:22', 'Louis Gac', 'louis.gac@limesurvey.org', 'https://www.limesurvey.org/', 'Copyright (C) 2007-2017 The LimeSurvey Project Team\\r\\nAll rights reserved.', 'License: GNU/GPL License v2 or later, see LICENSE.php\\r\\n\\r\\nLimeSurvey is free software. This version may have been modified pursuant to the GNU General Public License, and as distributed it includes or is derivative of works licensed under the GNU General Public License or other free or open source software licenses. See COPYRIGHT.php for copyright notices and details.', '3.0', '3.0', 'views', 'files', '<strong>LimeSurvey Bootwatch Theme</strong><br>Based on BootsWatch Themes: <a href=\"https://bootswatch.com/3/\"\">Visit BootsWatch page</a> ', NULL, '1', 'vanilla');


-- --------------------------------------------------------

--
-- Table structure for table `lime_tutorial_entries`
--

DROP TABLE IF EXISTS `lime_tutorial_entries`;
CREATE TABLE `lime_tutorial_entries` (
  `teid` int(11) NOT NULL AUTO_INCREMENT,
  `ordering` int(11) DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  `settings` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`teid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_tutorial_entries`
--


-- --------------------------------------------------------

--
-- Table structure for table `lime_tutorial_entry_relation`
--

DROP TABLE IF EXISTS `lime_tutorial_entry_relation`;
CREATE TABLE `lime_tutorial_entry_relation` (
  `teid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  PRIMARY KEY (`teid`,`tid`),
  KEY `lime_idx1_tutorial_entry_relation` (`uid`),
  KEY `lime_idx2_tutorial_entry_relation` (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_tutorial_entry_relation`
--


-- --------------------------------------------------------

--
-- Table structure for table `lime_tutorials`
--

DROP TABLE IF EXISTS `lime_tutorials`;
CREATE TABLE `lime_tutorials` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(192) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `active` int(11) DEFAULT '0',
  `settings` text COLLATE utf8mb4_unicode_ci,
  `permission` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission_grade` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`tid`),
  UNIQUE KEY `lime_idx1_tutorials` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_tutorials`
--


-- --------------------------------------------------------

--
-- Table structure for table `lime_user_groups`
--

DROP TABLE IF EXISTS `lime_user_groups`;
CREATE TABLE `lime_user_groups` (
  `ugid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`ugid`),
  UNIQUE KEY `lime_idx1_user_groups` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_user_groups`
--


-- --------------------------------------------------------

--
-- Table structure for table `lime_user_in_groups`
--

DROP TABLE IF EXISTS `lime_user_in_groups`;
CREATE TABLE `lime_user_in_groups` (
  `ugid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`ugid`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_user_in_groups`
--


-- --------------------------------------------------------

--
-- Table structure for table `lime_users`
--

DROP TABLE IF EXISTS `lime_users`;
CREATE TABLE `lime_users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `users_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `lang` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(192) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `htmleditormode` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `templateeditormode` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `questionselectormode` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `one_time_pw` text COLLATE utf8mb4_unicode_ci,
  `dateformat` int(11) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `lime_idx1_users` (`users_name`),
  KEY `lime_idx2_users` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lime_users`
--
