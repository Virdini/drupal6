-- phpMyAdmin SQL Dump
-- version 4.0.10.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 12, 2015 at 12:38 PM
-- Server version: 5.1.73
-- PHP Version: 5.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tsybenko_virdini`
--

-- --------------------------------------------------------

--
-- Table structure for table `access`
--

CREATE TABLE IF NOT EXISTS `access` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `mask` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

CREATE TABLE IF NOT EXISTS `actions` (
  `aid` varchar(255) NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT '',
  `callback` varchar(255) NOT NULL DEFAULT '',
  `parameters` longtext NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `actions`
--

INSERT INTO `actions` (`aid`, `type`, `callback`, `parameters`, `description`) VALUES
('comment_publish_action', 'comment', 'comment_publish_action', '', 'Publish comment'),
('comment_unpublish_action', 'comment', 'comment_unpublish_action', '', 'Unpublish comment'),
('node_publish_action', 'node', 'node_publish_action', '', 'Publish post'),
('node_unpublish_action', 'node', 'node_unpublish_action', '', 'Unpublish post'),
('node_make_sticky_action', 'node', 'node_make_sticky_action', '', 'Make post sticky'),
('node_make_unsticky_action', 'node', 'node_make_unsticky_action', '', 'Make post unsticky'),
('node_promote_action', 'node', 'node_promote_action', '', 'Promote post to front page'),
('node_unpromote_action', 'node', 'node_unpromote_action', '', 'Remove post from front page'),
('node_save_action', 'node', 'node_save_action', '', 'Save post'),
('user_block_user_action', 'user', 'user_block_user_action', '', 'Block current user'),
('user_block_ip_action', 'user', 'user_block_ip_action', '', 'Ban IP address of current user'),
('imagecache_flush_action', 'node', 'imagecache_flush_action', '', 'ImageCache: Flush ALL presets for this node''s filefield images'),
('imagecache_generate_all_action', 'node', 'imagecache_generate_all_action', '', 'ImageCache: Generate ALL presets for this node''s filefield images');

-- --------------------------------------------------------

--
-- Table structure for table `actions_aid`
--

CREATE TABLE IF NOT EXISTS `actions_aid` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `authmap`
--

CREATE TABLE IF NOT EXISTS `authmap` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `authname` varchar(128) NOT NULL DEFAULT '',
  `module` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`aid`),
  UNIQUE KEY `authname` (`authname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE IF NOT EXISTS `batch` (
  `bid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(64) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `batch` longtext,
  PRIMARY KEY (`bid`),
  KEY `token` (`token`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- Table structure for table `blocks`
--

CREATE TABLE IF NOT EXISTS `blocks` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(64) NOT NULL DEFAULT '',
  `delta` varchar(32) NOT NULL DEFAULT '0',
  `theme` varchar(64) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  `region` varchar(64) NOT NULL DEFAULT '',
  `custom` tinyint(4) NOT NULL DEFAULT '0',
  `throttle` tinyint(4) NOT NULL DEFAULT '0',
  `visibility` tinyint(4) NOT NULL DEFAULT '0',
  `pages` text NOT NULL,
  `title` varchar(64) NOT NULL DEFAULT '',
  `cache` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`bid`),
  UNIQUE KEY `tmd` (`theme`,`module`,`delta`),
  KEY `list` (`theme`,`status`,`region`,`weight`,`module`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `blocks`
--

INSERT INTO `blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES
(1, 'user', '0', 'garland', 1, 0, 'left', 0, 0, 0, '', '', -1),
(2, 'user', '1', 'garland', 1, 0, 'left', 0, 0, 0, '', '', -1),
(3, 'system', '0', 'garland', 1, 10, 'footer', 0, 0, 0, '', '', -1),
(4, 'system', '0', 'rubik', 1, 10, 'footer', 0, 0, 0, '', '', -1),
(5, 'user', '0', 'rubik', 1, 0, 'left', 0, 0, 0, '', '', -1),
(6, 'user', '1', 'rubik', 1, 0, 'left', 0, 0, 0, '', '', -1),
(7, 'locale', '0', 'garland', 0, 0, '', 0, 0, 0, '', '', -1),
(8, 'menu', 'admin', 'garland', 0, 0, '', 0, 0, 0, '', '', -1),
(9, 'menu', 'primary-links', 'garland', 0, 0, '', 0, 0, 0, '', '', -1),
(10, 'menu', 'secondary-links', 'garland', 0, 0, '', 0, 0, 0, '', '', -1),
(11, 'node', '0', 'garland', 0, 0, '', 0, 0, 0, '', '', -1),
(12, 'user', '2', 'garland', 0, 0, '', 0, 0, 0, '', '', 1),
(13, 'user', '3', 'garland', 0, 0, '', 0, 0, 0, '', '', -1),
(14, 'admin', 'create', 'garland', 0, 0, '', 0, 0, 0, '', '', -1),
(15, 'admin', 'theme', 'garland', 0, 0, '', 0, 0, 0, '', '', 1),
(16, 'admin', 'account', 'garland', 0, 0, '', 0, 0, 0, '', '', -1),
(17, 'admin', 'menu', 'garland', 0, 0, '', 0, 0, 0, '', '', 1),
(18, 'admin', 'account', 'virdini', 0, -1, '', 0, 0, 0, '', '', -1),
(19, 'admin', 'create', 'virdini', 0, -3, '', 0, 0, 0, '', '', -1),
(20, 'admin', 'menu', 'virdini', 0, -4, '', 0, 0, 0, '', '', 1),
(21, 'admin', 'theme', 'virdini', 0, 3, '', 0, 0, 0, '', '', 1),
(22, 'locale', '0', 'virdini', 0, -2, '', 0, 0, 0, '', '', -1),
(23, 'menu', 'admin', 'virdini', 0, -5, '', 0, 0, 0, '', '', -1),
(24, 'menu', 'primary-links', 'virdini', 0, 0, '', 0, 0, 0, '', '', -1),
(25, 'menu', 'secondary-links', 'virdini', 0, 1, '', 0, 0, 0, '', '', -1),
(26, 'node', '0', 'virdini', 0, 2, '', 0, 0, 0, '', '', -1),
(27, 'system', '0', 'virdini', 0, -7, '', 0, 0, 0, '', '', -1),
(28, 'user', '0', 'virdini', 0, -7, '', 0, 0, 0, '', '', -1),
(29, 'user', '1', 'virdini', 0, -6, '', 0, 0, 0, '', '', -1),
(30, 'user', '2', 'virdini', 0, 4, '', 0, 0, 0, '', '', 1),
(31, 'user', '3', 'virdini', 0, 5, '', 0, 0, 0, '', '', -1),
(32, 'menu', 'menu-fastadmin', 'virdini', 0, 0, '', 0, 0, 0, '', '', -1);

-- --------------------------------------------------------

--
-- Table structure for table `blocks_roles`
--

CREATE TABLE IF NOT EXISTS `blocks_roles` (
  `module` varchar(64) NOT NULL,
  `delta` varchar(32) NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`module`,`delta`,`rid`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `boxes`
--

CREATE TABLE IF NOT EXISTS `boxes` (
  `bid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `body` longtext,
  `info` varchar(128) NOT NULL DEFAULT '',
  `format` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bid`),
  UNIQUE KEY `info` (`info`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE IF NOT EXISTS `cache` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cache_block`
--

CREATE TABLE IF NOT EXISTS `cache_block` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cache_content`
--

CREATE TABLE IF NOT EXISTS `cache_content` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cache_filter`
--

CREATE TABLE IF NOT EXISTS `cache_filter` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cache_form`
--

CREATE TABLE IF NOT EXISTS `cache_form` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cache_l10n_update`
--

CREATE TABLE IF NOT EXISTS `cache_l10n_update` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cache_menu`
--

CREATE TABLE IF NOT EXISTS `cache_menu` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cache_page`
--

CREATE TABLE IF NOT EXISTS `cache_page` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cache_views`
--

CREATE TABLE IF NOT EXISTS `cache_views` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cache_views_data`
--

CREATE TABLE IF NOT EXISTS `cache_views_data` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `nid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `subject` varchar(64) NOT NULL DEFAULT '',
  `comment` longtext NOT NULL,
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `format` smallint(6) NOT NULL DEFAULT '0',
  `thread` varchar(255) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `mail` varchar(64) DEFAULT NULL,
  `homepage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `pid` (`pid`),
  KEY `nid` (`nid`),
  KEY `comment_uid` (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `content_node_field`
--

CREATE TABLE IF NOT EXISTS `content_node_field` (
  `field_name` varchar(32) NOT NULL DEFAULT '',
  `type` varchar(127) NOT NULL DEFAULT '',
  `global_settings` mediumtext NOT NULL,
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `multiple` tinyint(4) NOT NULL DEFAULT '0',
  `db_storage` tinyint(4) NOT NULL DEFAULT '1',
  `module` varchar(127) NOT NULL DEFAULT '',
  `db_columns` mediumtext NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`field_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `content_node_field_instance`
--

CREATE TABLE IF NOT EXISTS `content_node_field_instance` (
  `field_name` varchar(32) NOT NULL DEFAULT '',
  `type_name` varchar(32) NOT NULL DEFAULT '',
  `weight` int(11) NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL DEFAULT '',
  `widget_type` varchar(32) NOT NULL DEFAULT '',
  `widget_settings` mediumtext NOT NULL,
  `display_settings` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `widget_module` varchar(127) NOT NULL DEFAULT '',
  `widget_active` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`field_name`,`type_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE IF NOT EXISTS `files` (
  `fid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `filemime` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`),
  KEY `uid` (`uid`),
  KEY `status` (`status`),
  KEY `timestamp` (`timestamp`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Table structure for table `filters`
--

CREATE TABLE IF NOT EXISTS `filters` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `format` int(11) NOT NULL DEFAULT '0',
  `module` varchar(64) NOT NULL DEFAULT '',
  `delta` tinyint(4) NOT NULL DEFAULT '0',
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`),
  UNIQUE KEY `fmd` (`format`,`module`,`delta`),
  KEY `list` (`format`,`weight`,`module`,`delta`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `filters`
--

INSERT INTO `filters` (`fid`, `format`, `module`, `delta`, `weight`) VALUES
(9, 1, 'filter', 0, 1),
(10, 1, 'filter', 1, 2),
(8, 1, 'filter', 3, 10),
(5, 2, 'filter', 2, 0),
(6, 2, 'filter', 1, 1),
(7, 2, 'filter', 3, 10),
(11, 1, 'filter', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `filter_formats`
--

CREATE TABLE IF NOT EXISTS `filter_formats` (
  `format` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `roles` varchar(255) NOT NULL DEFAULT '',
  `cache` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`format`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `filter_formats`
--

INSERT INTO `filter_formats` (`format`, `name`, `roles`, `cache`) VALUES
(1, 'Filtered HTML', ',1,2,3,', 1),
(2, 'Full HTML', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `flood`
--

CREATE TABLE IF NOT EXISTS `flood` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `event` varchar(64) NOT NULL DEFAULT '',
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`),
  KEY `allow` (`event`,`hostname`,`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE IF NOT EXISTS `history` (
  `uid` int(11) NOT NULL DEFAULT '0',
  `nid` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`nid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `imagecache_action`
--

CREATE TABLE IF NOT EXISTS `imagecache_action` (
  `actionid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `presetid` int(10) unsigned NOT NULL DEFAULT '0',
  `weight` int(11) NOT NULL DEFAULT '0',
  `module` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`actionid`),
  KEY `presetid` (`presetid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `imagecache_preset`
--

CREATE TABLE IF NOT EXISTS `imagecache_preset` (
  `presetid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `presetname` varchar(255) NOT NULL,
  PRIMARY KEY (`presetid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `imce_files`
--

CREATE TABLE IF NOT EXISTS `imce_files` (
  `fid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `l10n_update_file`
--

CREATE TABLE IF NOT EXISTS `l10n_update_file` (
  `project` varchar(50) NOT NULL,
  `language` varchar(12) NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT '',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `fileurl` varchar(255) NOT NULL DEFAULT '',
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `timestamp` int(11) DEFAULT '0',
  `version` varchar(128) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '1',
  `last_checked` int(11) DEFAULT '0',
  PRIMARY KEY (`project`,`language`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `l10n_update_project`
--

CREATE TABLE IF NOT EXISTS `l10n_update_project` (
  `name` varchar(50) NOT NULL,
  `project_type` varchar(50) NOT NULL,
  `core` varchar(128) NOT NULL DEFAULT '',
  `version` varchar(128) NOT NULL DEFAULT '',
  `l10n_server` varchar(255) NOT NULL DEFAULT '',
  `l10n_path` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `l10n_update_project`
--

INSERT INTO `l10n_update_project` (`name`, `project_type`, `core`, `version`, `l10n_server`, `l10n_path`, `status`) VALUES
('admin', 'module', '6.x', '6.x-2.0', '', 'http://ftp.drupal.org/files/translations/6.x/admin/admin-6.x-2.0.%language.po', 1),
('advagg', 'module', '6.x', '6.x-1.9', '', 'http://ftp.drupal.org/files/translations/6.x/advagg/advagg-6.x-1.9.%language.po', 1),
('drupal', 'core', '6.x', '6.35', '', 'http://ftp.drupal.org/files/translations/6.x/drupal/drupal-6.35.%language.po', 1),
('cck', 'module', '6.x', '6.x-2.9', '', 'http://ftp.drupal.org/files/translations/6.x/cck/cck-6.x-2.9.%language.po', 1),
('ctm', 'module', '6.x', '6.x-1.1', '', 'http://ftp.drupal.org/files/translations/6.x/ctm/ctm-6.x-1.1.%language.po', 1),
('fast_404', 'module', '6.x', '6.x-1.x-dev', '', 'http://ftp.drupal.org/files/translations/6.x/fast_404/fast_404-6.x-1.x-dev.%language.po', 1),
('filefield', 'module', '6.x', '6.x-3.13', '', 'http://ftp.drupal.org/files/translations/6.x/filefield/filefield-6.x-3.13.%language.po', 1),
('globalredirect', 'module', '6.x', '6.x-1.5', '', 'http://ftp.drupal.org/files/translations/6.x/globalredirect/globalredirect-6.x-1.5.%language.po', 1),
('imageapi', 'module', '6.x', '6.x-1.10', '', 'http://ftp.drupal.org/files/translations/6.x/imageapi/imageapi-6.x-1.10.%language.po', 1),
('imagecache', 'module', '6.x', '6.x-2.0-rc1', '', 'http://ftp.drupal.org/files/translations/6.x/imagecache/imagecache-6.x-2.0-rc1.%language.po', 1),
('imagefield', 'module', '6.x', '6.x-3.11', '', 'http://ftp.drupal.org/files/translations/6.x/imagefield/imagefield-6.x-3.11.%language.po', 1),
('imce', 'module', '6.x', '6.x-2.7', '', 'http://ftp.drupal.org/files/translations/6.x/imce/imce-6.x-2.7.%language.po', 1),
('imce_wysiwyg', 'module', '6.x', '6.x-1.1', '', 'http://ftp.drupal.org/files/translations/6.x/imce_wysiwyg/imce_wysiwyg-6.x-1.1.%language.po', 1),
('l10n_update', 'module', '6.x', '6.x-1.0-beta3', '', 'http://ftp.drupal.org/files/translations/6.x/l10n_update/l10n_update-6.x-1.0-beta3.%language.po', 1),
('nodewords', 'module', '6.x', '6.x-1.14', '', 'http://ftp.drupal.org/files/translations/6.x/nodewords/nodewords-6.x-1.14.%language.po', 1),
('pathauto', 'module', '6.x', '6.x-1.6', '', 'http://ftp.drupal.org/files/translations/6.x/pathauto/pathauto-6.x-1.6.%language.po', 1),
('smtp', 'module', '6.x', '6.x-1.1', '', 'http://ftp.drupal.org/files/translations/6.x/smtp/smtp-6.x-1.1.%language.po', 1),
('token', 'module', '6.x', '6.x-1.19', '', 'http://ftp.drupal.org/files/translations/6.x/token/token-6.x-1.19.%language.po', 1),
('transliteration', 'module', '6.x', '6.x-3.1', '', 'http://ftp.drupal.org/files/translations/6.x/transliteration/transliteration-6.x-3.1.%language.po', 1),
('views', 'module', '6.x', '6.x-2.18', '', 'http://ftp.drupal.org/files/translations/6.x/views/views-6.x-2.18.%language.po', 1),
('virdini', 'module', '6.x', '', '', 'http://ftp.drupal.org/files/translations/6.x/virdini/virdini-.%language.po', 1),
('wysiwyg', 'module', '6.x', '6.x-2.4', '', 'http://ftp.drupal.org/files/translations/6.x/wysiwyg/wysiwyg-6.x-2.4.%language.po', 1),
('colorbox', 'module', '6.x', '6.x-1.4', '', 'http://ftp.drupal.org/files/translations/6.x/colorbox/colorbox-6.x-1.4.%language.po', 1),
('google_analytics', 'module', '6.x', '6.x-4.1', '', 'http://ftp.drupal.org/files/translations/6.x/google_analytics/google_analytics-6.x-4.1.%language.po', 1),
('jquery_ui', 'module', '6.x', '6.x-1.5', '', 'http://ftp.drupal.org/files/translations/6.x/jquery_ui/jquery_ui-6.x-1.5.%language.po', 1),
('page_title', 'module', '6.x', '6.x-2.7', '', 'http://ftp.drupal.org/files/translations/6.x/page_title/page_title-6.x-2.7.%language.po', 1),
('poormanscron', 'module', '6.x', '6.x-2.2', '', 'http://ftp.drupal.org/files/translations/6.x/poormanscron/poormanscron-6.x-2.2.%language.po', 1),
('rubik', 'theme', '6.x', '6.x-3.0-beta3', '', 'http://ftp.drupal.org/files/translations/6.x/rubik/rubik-6.x-3.0-beta3.%language.po', 1),
('tao', 'theme', '6.x', '6.x-3.3', '', 'http://ftp.drupal.org/files/translations/6.x/tao/tao-6.x-3.3.%language.po', 1),
('imagefield_zip', 'module', '6.x', '6.x-1.2', '', 'http://ftp.drupal.org/files/translations/6.x/imagefield_zip/imagefield_zip-6.x-1.2.%language.po', 1),
('nodeformcols', 'module', '6.x', '6.x-1.7', '', 'http://ftp.drupal.org/files/translations/6.x/nodeformcols/nodeformcols-6.x-1.7.%language.po', 1),
('pathauto_persist', 'module', '6.x', '6.x-1.2', '', 'http://ftp.drupal.org/files/translations/6.x/pathauto_persist/pathauto_persist-6.x-1.2.%language.po', 1);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE IF NOT EXISTS `languages` (
  `language` varchar(12) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '',
  `native` varchar(64) NOT NULL DEFAULT '',
  `direction` int(11) NOT NULL DEFAULT '0',
  `enabled` int(11) NOT NULL DEFAULT '0',
  `plurals` int(11) NOT NULL DEFAULT '0',
  `formula` varchar(128) NOT NULL DEFAULT '',
  `domain` varchar(128) NOT NULL DEFAULT '',
  `prefix` varchar(128) NOT NULL DEFAULT '',
  `weight` int(11) NOT NULL DEFAULT '0',
  `javascript` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`language`),
  KEY `list` (`weight`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`language`, `name`, `native`, `direction`, `enabled`, `plurals`, `formula`, `domain`, `prefix`, `weight`, `javascript`) VALUES
('en', 'English', 'English', 0, 1, 0, '', '', '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `locales_source`
--

CREATE TABLE IF NOT EXISTS `locales_source` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(255) NOT NULL DEFAULT '',
  `textgroup` varchar(255) NOT NULL DEFAULT 'default',
  `source` blob NOT NULL,
  `version` varchar(20) NOT NULL DEFAULT 'none',
  PRIMARY KEY (`lid`),
  KEY `source` (`source`(30))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- Dumping data for table `locales_source`
--

INSERT INTO `locales_source` (`lid`, `location`, `textgroup`, `source`, `version`) VALUES
(1, 'misc/drupal.js', 'default', 0x556e737065636966696564206572726f72, 'none'),
(2, 'misc/drupal.js', 'default', 0x416e206572726f72206f636375727265642e205c6e407572695c6e4074657874, 'none'),
(3, 'misc/drupal.js', 'default', 0x416e206572726f72206f636375727265642e205c6e407572695c6e286e6f20696e666f726d6174696f6e20617661696c61626c65292e, 'none'),
(4, 'misc/drupal.js', 'default', 0x416e2048545450206572726f722040737461747573206f636375727265642e205c6e40757269, 'none'),
(5, 'sites/all/modules/advagg/advagg.admin.js', 'default', 0x4164764167672042797061737320436f6f6b69652052656d6f766564, 'none'),
(6, 'sites/all/modules/advagg/advagg.admin.js', 'default', 0x4164764167672042797061737320436f6f6b696520536574, 'none'),
(7, 'modules/system/system.js', 'default', 0x54657374696e6720636c65616e2055524c732e2e2e, 'none'),
(8, 'modules/system/system.js', 'default', 0x596f75722073657276657220686173206265656e207375636365737366756c6c792074657374656420746f20737570706f7274207468697320666561747572652e, 'none'),
(9, 'modules/system/system.js', 'default', 0x596f75722073797374656d20636f6e66696775726174696f6e20646f6573206e6f742063757272656e746c7920737570706f7274207468697320666561747572652e20546865203c6120687265663d22687474703a2f2f64727570616c2e6f72672f6e6f64652f3135333635223e68616e64626f6f6b2070616765206f6e20436c65616e2055524c733c2f613e20686173206164646974696f6e616c2074726f75626c6573686f6f74696e6720696e666f726d6174696f6e2e, 'none'),
(10, 'misc/tabledrag.js', 'default', 0x4472616720746f2072652d6f72646572, 'none'),
(11, 'misc/tabledrag.js', 'default', 0x4368616e676573206d61646520696e2074686973207461626c652077696c6c206e6f7420626520736176656420756e74696c2074686520666f726d206973207375626d69747465642e, 'none'),
(12, 'modules/block/block.js', 'default', 0x546865206368616e67657320746f20746865736520626c6f636b732077696c6c206e6f7420626520736176656420756e74696c20746865203c656d3e5361766520626c6f636b733c2f656d3e20627574746f6e20697320636c69636b65642e, 'none'),
(13, 'sites/all/modules/token/token.js', 'default', 0x496e73657274207468697320746f6b656e20696e746f20796f757220666f726d, 'none'),
(14, 'sites/all/modules/token/token.js', 'default', 0x466972737420636c69636b20612074657874206669656c6420746f20696e7365727420796f757220746f6b656e7320696e746f2e, 'none'),
(15, 'sites/all/modules/imce/js/imce.js', 'default', 0x46696c652062726f7773696e672069732064697361626c656420696e206469726563746f727920256469722e, 'none'),
(16, 'sites/all/modules/imce/js/imce.js', 'default', 0x55706c6f6164, 'none'),
(17, 'sites/all/modules/imce/js/imce.js', 'default', 0x596f752063616e206e6f7420706572666f726d2074686973206f7065726174696f6e2e, 'none'),
(18, 'sites/all/modules/imce/js/imce.js', 'default', 0x446f20796f752077616e7420746f2072656672657368207468652063757272656e74206469726563746f72793f, 'none'),
(19, 'sites/all/modules/imce/js/imce.js', 'default', 0x4f6e6c792066696c657320776974682074686520666f6c6c6f77696e6720657874656e73696f6e732061726520616c6c6f7765643a202566696c65732d616c6c6f7765642e, 'none'),
(20, 'sites/all/modules/imce/js/imce.js', 'default', 0x44656c6574652073656c65637465642066696c65733f, 'none'),
(21, 'sites/all/modules/imce/js/imce.js', 'default', 0x506c656173652073656c6563742061207468756d626e61696c2e, 'none'),
(22, 'sites/all/modules/imce/js/imce.js', 'default', 0x506c6561736520737065636966792064696d656e73696f6e732077697468696e2074686520616c6c6f7765642072616e676520746861742069732066726f6d2031783120746f204064696d656e73696f6e732e, 'none'),
(23, 'sites/all/modules/imce/js/imce.js', 'default', 0x756e6c696d69746564, 'none'),
(24, 'sites/all/modules/imce/js/imce.js', 'default', 0x506c656173652073656c65637420612066696c652e, 'none'),
(25, 'sites/all/modules/imce/js/imce.js', 'default', 0x4c6f67206d65737361676573, 'none'),
(26, 'sites/all/modules/imce/js/imce.js', 'default', 0x2566696c656e616d65206973206e6f7420616e20696d6167652e, 'none'),
(27, 'sites/all/modules/imce/js/imce.js', 'default', 0x596f75206d7573742073656c656374206174206c6561737420256e756d2066696c65732e, 'none'),
(28, 'sites/all/modules/imce/js/imce.js', 'default', 0x596f7520617265206e6f7420616c6c6f77656420746f206f706572617465206f6e206d6f7265207468616e20256e756d2066696c65732e, 'none'),
(29, 'sites/all/modules/imce/js/imce.js', 'default', 0x436c6f7365, 'none'),
(30, 'sites/all/modules/imce/js/imce_set_app.js', 'default', 0x496e736572742066696c65, 'none'),
(31, 'misc/tableselect.js', 'default', 0x53656c65637420616c6c20726f777320696e2074686973207461626c65, 'none'),
(32, 'misc/tableselect.js', 'default', 0x446573656c65637420616c6c20726f777320696e2074686973207461626c65, 'none'),
(33, 'sites/all/modules/pathauto/pathauto.js', 'default', 0x4175746f6d6174696320616c696173, 'none'),
(34, 'sites/all/modules/pathauto/pathauto.js', 'default', 0x416c6961733a2040616c696173, 'none'),
(35, 'sites/all/modules/pathauto/pathauto.js', 'default', 0x4e6f20616c696173, 'none'),
(36, 'sites/all/modules/cck/modules/filefield/filefield.js', 'default', 0x5468652073656c65637465642066696c65202566696c656e616d652063616e6e6f742062652075706c6f616465642e204f6e6c792066696c657320776974682074686520666f6c6c6f77696e6720657874656e73696f6e732061726520616c6c6f7765643a2025657874656e73696f6e732e, 'none'),
(37, 'sites/all/modules/nodeformcols/js/nodeformcols.js', 'default', 0x546865206368616e67657320746f207468657365206669656c64732077696c6c206e6f7420626520736176656420756e74696c20746865203c656d3e53617665206669656c64733c2f656d3e20627574746f6e20697320636c69636b65642e, 'none');

-- --------------------------------------------------------

--
-- Table structure for table `locales_target`
--

CREATE TABLE IF NOT EXISTS `locales_target` (
  `lid` int(11) NOT NULL DEFAULT '0',
  `translation` blob NOT NULL,
  `language` varchar(12) NOT NULL DEFAULT '',
  `plid` int(11) NOT NULL DEFAULT '0',
  `plural` int(11) NOT NULL DEFAULT '0',
  `l10n_status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`language`,`lid`,`plural`),
  KEY `lid` (`lid`),
  KEY `plid` (`plid`),
  KEY `plural` (`plural`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `menu_custom`
--

CREATE TABLE IF NOT EXISTS `menu_custom` (
  `menu_name` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  PRIMARY KEY (`menu_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu_custom`
--

INSERT INTO `menu_custom` (`menu_name`, `title`, `description`) VALUES
('navigation', 'Navigation', 'The navigation menu is provided by Drupal and is the main interactive menu for any site. It is usually the only menu that contains personalized links for authenticated users, and is often not even visible to anonymous users.'),
('primary-links', 'Primary links', 'Primary links are often used at the theme layer to show the major sections of a site. A typical representation for primary links would be tabs along the top.'),
('secondary-links', 'Secondary links', 'Secondary links are often used for pages like legal notices, contact details, and other secondary navigation items that play a lesser role than primary links'),
('admin', 'Admin', 'Administrative links.'),
('menu-fastadmin', 'Quick links', 'Quick links ');

-- --------------------------------------------------------

--
-- Table structure for table `menu_links`
--

CREATE TABLE IF NOT EXISTS `menu_links` (
  `menu_name` varchar(32) NOT NULL DEFAULT '',
  `mlid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plid` int(10) unsigned NOT NULL DEFAULT '0',
  `link_path` varchar(255) NOT NULL DEFAULT '',
  `router_path` varchar(255) NOT NULL DEFAULT '',
  `link_title` varchar(255) NOT NULL DEFAULT '',
  `options` text,
  `module` varchar(255) NOT NULL DEFAULT 'system',
  `hidden` smallint(6) NOT NULL DEFAULT '0',
  `external` smallint(6) NOT NULL DEFAULT '0',
  `has_children` smallint(6) NOT NULL DEFAULT '0',
  `expanded` smallint(6) NOT NULL DEFAULT '0',
  `weight` int(11) NOT NULL DEFAULT '0',
  `depth` smallint(6) NOT NULL DEFAULT '0',
  `customized` smallint(6) NOT NULL DEFAULT '0',
  `p1` int(10) unsigned NOT NULL DEFAULT '0',
  `p2` int(10) unsigned NOT NULL DEFAULT '0',
  `p3` int(10) unsigned NOT NULL DEFAULT '0',
  `p4` int(10) unsigned NOT NULL DEFAULT '0',
  `p5` int(10) unsigned NOT NULL DEFAULT '0',
  `p6` int(10) unsigned NOT NULL DEFAULT '0',
  `p7` int(10) unsigned NOT NULL DEFAULT '0',
  `p8` int(10) unsigned NOT NULL DEFAULT '0',
  `p9` int(10) unsigned NOT NULL DEFAULT '0',
  `updated` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mlid`),
  KEY `path_menu` (`link_path`(128),`menu_name`),
  KEY `menu_plid_expand_child` (`menu_name`,`plid`,`expanded`,`has_children`),
  KEY `menu_parents` (`menu_name`,`p1`,`p2`,`p3`,`p4`,`p5`,`p6`,`p7`,`p8`,`p9`),
  KEY `router_path` (`router_path`(128))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=282 ;

--
-- Dumping data for table `menu_links`
--

INSERT INTO `menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES
('navigation', 1, 0, 'batch', 'batch', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin', 185, 134, 'admin/build/block/delete', 'admin/build/block/delete', 'Delete block', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 124, 134, 185, 0, 0, 0, 0, 0, 0),
('navigation', 3, 0, 'node', 'node', 'Content', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 4, 0, 'logout', 'logout', 'Log out', 'a:0:{}', 'system', 0, 0, 0, 0, 10, 1, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 5, 0, 'rss.xml', 'rss.xml', 'RSS feed', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 6, 0, 'user', 'user', 'User account', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 7, 0, 'node/%', 'node/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 9, 0, 'filter/tips', 'filter/tips', 'Compose tips', 'a:0:{}', 'system', 1, 0, 0, 0, 0, 1, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin', 183, 124, 'admin/build/views1/delete', 'admin/build/views1/delete', 'Delete view', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 114, 124, 183, 0, 0, 0, 0, 0, 0, 0),
('admin', 184, 166, 'admin/build/path/delete', 'admin/build/path/delete', 'Delete alias', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 124, 166, 184, 0, 0, 0, 0, 0, 0),
('navigation', 11, 0, 'node/add', 'node/add', 'Create content', 'a:0:{}', 'system', 0, 0, 1, 0, 1, 1, 0, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 14, 0, 'system/files', 'system/files', 'File download', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin', 182, 138, 'admin/settings/date-time/lookup', 'admin/settings/date-time/lookup', 'Date and time lookup', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 125, 138, 182, 0, 0, 0, 0, 0, 0),
('admin', 181, 148, 'admin/settings/logging/dblog', 'admin/settings/logging/dblog', 'Database logging', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:169:"Settings for logging to the Drupal database logs. This is the most common method for small to medium sites on shared hosting. The logs are viewable from the admin pages.";}}', 'system', 0, 0, 0, 0, 0, 4, 0, 114, 125, 148, 181, 0, 0, 0, 0, 0, 0),
('navigation', 19, 0, 'user/autocomplete', 'user/autocomplete', 'User autocomplete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin', 179, 124, 'admin/build/views1/convert', 'admin/build/views1/convert', 'Convert view', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 114, 124, 179, 0, 0, 0, 0, 0, 0, 0),
('admin', 180, 124, 'admin/build/menu-customize/%', 'admin/build/menu-customize/%', 'Customize menu', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 114, 124, 180, 0, 0, 0, 0, 0, 0, 0),
('navigation', 21, 0, 'user/%', 'user/%', 'My account', 'a:0:{}', 'system', 0, 0, 0, 0, 0, 1, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin', 178, 142, 'admin/settings/imce/profile', 'admin/settings/imce/profile', 'Add new profile', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 125, 142, 178, 0, 0, 0, 0, 0, 0),
('admin', 176, 134, 'admin/build/block/configure', 'admin/build/block/configure', 'Configure block', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 124, 134, 176, 0, 0, 0, 0, 0, 0),
('navigation', 177, 0, 'sites/default/files/imagecache', 'sites/default/files/imagecache', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 177, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin', 175, 131, 'admin/settings/actions/configure', 'admin/settings/actions/configure', 'Configure an advanced action', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 125, 131, 175, 0, 0, 0, 0, 0, 0),
('admin', 173, 145, 'admin/build/imagecache/%', 'admin/build/imagecache/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 124, 145, 173, 0, 0, 0, 0, 0, 0),
('admin', 174, 135, 'admin/settings/clean-urls/check', 'admin/settings/clean-urls/check', 'Clean URL check', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 125, 135, 174, 0, 0, 0, 0, 0, 0),
('admin', 172, 146, 'admin/settings/filters/%', 'admin/settings/filters/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 125, 146, 172, 0, 0, 0, 0, 0, 0),
('admin', 171, 124, 'admin/build/translate', 'admin/build/translate', 'Translate interface', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:59:"Translate the built in interface and optionally other text.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 124, 171, 0, 0, 0, 0, 0, 0, 0),
('admin', 170, 124, 'admin/build/views', 'admin/build/views', 'Views', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:144:"Views are customized lists of content on your system; they are highly configurable and give you control over how lists of content are presented.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 124, 170, 0, 0, 0, 0, 0, 0, 0),
('admin', 168, 126, 'admin/user/user', 'admin/user/user', 'Users', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:26:"List, add, and edit users.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 126, 168, 0, 0, 0, 0, 0, 0, 0),
('admin', 169, 125, 'admin/settings/wysiwyg', 'admin/settings/wysiwyg', 'Wysiwyg profiles', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:30:"Configure client-side editors.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 125, 169, 0, 0, 0, 0, 0, 0, 0),
('navigation', 31, 0, 'node/%/delete', 'node/%/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 1, 1, 0, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 32, 21, 'user/%/delete', 'user/%/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 2, 0, 21, 32, 0, 0, 0, 0, 0, 0, 0, 0),
('admin', 166, 124, 'admin/build/path', 'admin/build/path', 'URL aliases', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:46:"Change your site''s URL paths by aliasing them.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 124, 166, 0, 0, 0, 0, 0, 0, 0),
('admin', 167, 126, 'admin/user/settings', 'admin/user/settings', 'User settings', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:101:"Configure default behavior of users, including registration requirements, e-mails, and user pictures.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 126, 167, 0, 0, 0, 0, 0, 0, 0),
('admin', 165, 123, 'admin/reports/page-not-found', 'admin/reports/page-not-found', 'Top ''page not found'' errors', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:36:"View ''page not found'' errors (404s).";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 123, 165, 0, 0, 0, 0, 0, 0, 0),
('admin', 164, 123, 'admin/reports/access-denied', 'admin/reports/access-denied', 'Top ''access denied'' errors', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:35:"View ''access denied'' errors (403s).";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 123, 164, 0, 0, 0, 0, 0, 0, 0),
('admin', 163, 124, 'admin/build/themes', 'admin/build/themes', 'Themes', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:57:"Change which theme your site uses or allows users to set.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 124, 163, 0, 0, 0, 0, 0, 0, 0),
('admin', 162, 121, 'admin/content/taxonomy', 'admin/content/taxonomy', 'Taxonomy', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:67:"Manage tagging, categorization, and classification of your content.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 121, 162, 0, 0, 0, 0, 0, 0, 0),
('admin', 161, 123, 'admin/reports/status', 'admin/reports/status', 'Status report', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:74:"Get a status report about your site''s operation and any detected problems.";}}', 'system', 0, 0, 0, 0, 10, 3, 0, 114, 123, 161, 0, 0, 0, 0, 0, 0, 0),
('admin', 160, 125, 'admin/settings/site-maintenance', 'admin/settings/site-maintenance', 'Site maintenance', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:63:"Take the site off-line for maintenance or bring it back online.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 125, 160, 0, 0, 0, 0, 0, 0, 0),
('admin', 159, 125, 'admin/settings/site-information', 'admin/settings/site-information', 'Site information', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:107:"Change basic site information, such as the site name, slogan, e-mail address, mission, front page and more.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 125, 159, 0, 0, 0, 0, 0, 0, 0),
('admin', 157, 126, 'admin/user/roles', 'admin/user/roles', 'Roles', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:30:"List, edit, or add user roles.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 126, 157, 0, 0, 0, 0, 0, 0, 0),
('admin', 156, 123, 'admin/reports/dblog', 'admin/reports/dblog', 'Recent log entries', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:43:"View events that have recently been logged.";}}', 'system', 0, 0, 0, 0, -1, 3, 0, 114, 123, 156, 0, 0, 0, 0, 0, 0, 0),
('admin', 155, 121, 'admin/content/rss-publishing', 'admin/content/rss-publishing', 'RSS publishing', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:92:"Configure the number of items per feed and whether feeds should be titles/teasers/full-text.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 121, 155, 0, 0, 0, 0, 0, 0, 0),
('admin', 154, 121, 'admin/content/node-settings', 'admin/content/node-settings', 'Post settings', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:126:"Control posting behavior, such as teaser length, requiring previews before posting, and the number of posts on the front page.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 121, 154, 0, 0, 0, 0, 0, 0, 0),
('admin', 153, 126, 'admin/user/permissions', 'admin/user/permissions', 'Permissions', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:64:"Determine access to features by selecting permissions for roles.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 126, 153, 0, 0, 0, 0, 0, 0, 0),
('admin', 152, 125, 'admin/settings/performance', 'admin/settings/performance', 'Performance', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:101:"Enable or disable page caching for anonymous users and set CSS and JS bandwidth optimization options.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 125, 152, 0, 0, 0, 0, 0, 0, 0),
('admin', 151, 124, 'admin/build/modules', 'admin/build/modules', 'Modules', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:47:"Enable or disable add-on modules for your site.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 124, 151, 0, 0, 0, 0, 0, 0, 0),
('admin', 150, 121, 'admin/content/nodewords', 'admin/content/nodewords', 'Meta tags', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:45:"Configure HTML meta tags for all the content.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 121, 150, 0, 0, 0, 0, 0, 0, 0),
('admin', 149, 124, 'admin/build/menu', 'admin/build/menu', 'Menus', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:116:"Control your site''s navigation menu, primary links and secondary links, as well as rename and reorganize menu items.";}}', 'system', 0, 0, 1, 0, 0, 3, 0, 114, 124, 149, 0, 0, 0, 0, 0, 0, 0),
('admin', 148, 125, 'admin/settings/logging', 'admin/settings/logging', 'Logging and alerts', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:156:"Settings for logging and alerts modules. Various modules can route Drupal''s system events to different destination, such as syslog, database, email, ...etc.";}}', 'system', 0, 0, 1, 0, 0, 3, 0, 114, 125, 148, 0, 0, 0, 0, 0, 0, 0),
('admin', 147, 125, 'admin/settings/language', 'admin/settings/language', 'Languages', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:55:"Configure languages for content and the user interface.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 125, 147, 0, 0, 0, 0, 0, 0, 0),
('admin', 146, 125, 'admin/settings/filters', 'admin/settings/filters', 'Input formats', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:127:"Configure how content input by users is filtered, including allowed HTML tags. Also allows enabling of module-provided filters.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 125, 146, 0, 0, 0, 0, 0, 0, 0),
('admin', 145, 124, 'admin/build/imagecache', 'admin/build/imagecache', 'ImageCache', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:42:"Administer imagecache presets and actions.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 124, 145, 0, 0, 0, 0, 0, 0, 0),
('admin', 144, 125, 'admin/settings/imageapi', 'admin/settings/imageapi', 'ImageAPI', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:19:"Configure ImageAPI.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 125, 144, 0, 0, 0, 0, 0, 0, 0),
('admin', 143, 125, 'admin/settings/image-toolkit', 'admin/settings/image-toolkit', 'Image toolkit', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:74:"Choose which image toolkit to use if you have installed optional toolkits.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 125, 143, 0, 0, 0, 0, 0, 0, 0),
('admin', 142, 125, 'admin/settings/imce', 'admin/settings/imce', 'IMCE', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:42:"Control how your image/file browser works.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 125, 142, 0, 0, 0, 0, 0, 0, 0),
('admin', 141, 125, 'admin/settings/globalredirect', 'admin/settings/globalredirect', 'Global Redirect', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:63:"Chose which features you would like enabled for Global Redirect";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 125, 141, 0, 0, 0, 0, 0, 0, 0),
('admin', 140, 125, 'admin/settings/file-system', 'admin/settings/file-system', 'File system', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:68:"Tell Drupal where to store uploaded files and how they are accessed.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 125, 140, 0, 0, 0, 0, 0, 0, 0),
('admin', 139, 125, 'admin/settings/error-reporting', 'admin/settings/error-reporting', 'Error reporting', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:93:"Control how Drupal deals with errors including 403/404 errors as well as PHP error reporting.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 125, 139, 0, 0, 0, 0, 0, 0, 0),
('admin', 138, 125, 'admin/settings/date-time', 'admin/settings/date-time', 'Date and time', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:89:"Settings for how Drupal displays date and time, as well as the system''s default timezone.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 125, 138, 0, 0, 0, 0, 0, 0, 0),
('navigation', 81, 0, 'user/reset/%/%/%', 'user/reset/%/%/%', 'Reset password', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin', 137, 121, 'admin/content/types', 'admin/content/types', 'Content types', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:82:"Manage posts by content type, including default status, front page promotion, etc.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 121, 137, 0, 0, 0, 0, 0, 0, 0),
('navigation', 83, 0, 'node/%/revisions/%/delete', 'node/%/revisions/%/delete', 'Delete earlier revision', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 83, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 84, 0, 'node/%/revisions/%/revert', 'node/%/revisions/%/revert', 'Revert to earlier revision', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 84, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 85, 0, 'node/%/revisions/%/view', 'node/%/revisions/%/view', 'Revisions', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 85, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin', 136, 121, 'admin/content/node', 'admin/content/node', 'Content', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:43:"View, edit, and delete your site''s content.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 121, 136, 0, 0, 0, 0, 0, 0, 0),
('admin', 135, 125, 'admin/settings/clean-urls', 'admin/settings/clean-urls', 'Clean URLs', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:43:"Enable or disable clean URLs for your site.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 125, 135, 0, 0, 0, 0, 0, 0, 0),
('admin', 134, 124, 'admin/build/block', 'admin/build/block', 'Blocks', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:79:"Configure what block content appears in your site''s sidebars and other regions.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 124, 134, 0, 0, 0, 0, 0, 0, 0),
('navigation', 92, 0, 'taxonomy/autocomplete', 'taxonomy/autocomplete', 'Autocomplete taxonomy', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 92, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin', 132, 125, 'admin/settings/admin', 'admin/settings/admin', 'Administration tools', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:39:"Settings for site administration tools.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 125, 132, 0, 0, 0, 0, 0, 0, 0),
('admin', 131, 125, 'admin/settings/actions', 'admin/settings/actions', 'Actions', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:41:"Manage the actions defined for your site.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 125, 131, 0, 0, 0, 0, 0, 0, 0),
('navigation', 95, 0, 'taxonomy/term/%', 'taxonomy/term/%', 'Taxonomy term', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 95, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 129, 0, 'system/files/imagecache', 'system/files/imagecache', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 129, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin', 130, 126, 'admin/user/rules', 'admin/user/rules', 'Access rules', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:80:"List and create rules to disallow usernames, e-mail addresses, and IP addresses.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 126, 130, 0, 0, 0, 0, 0, 0, 0),
('admin', 126, 114, 'admin/user', 'admin/user', 'User management', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:61:"Manage your site''s users, groups and access to site features.";}}', 'system', 0, 0, 1, 0, 0, 2, 0, 114, 126, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 127, 0, 'views/ajax', 'views/ajax', 'Views', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:31:"Ajax callback for view loading.";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 127, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin', 125, 114, 'admin/settings', 'admin/settings', 'Site configuration', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:40:"Adjust basic site configuration options.";}}', 'system', 0, 0, 1, 0, -5, 2, 0, 114, 125, 0, 0, 0, 0, 0, 0, 0, 0),
('admin', 124, 114, 'admin/build', 'admin/build', 'Site building', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:38:"Control how your site looks and feels.";}}', 'system', 0, 0, 1, 0, -10, 2, 0, 114, 124, 0, 0, 0, 0, 0, 0, 0, 0),
('admin', 123, 114, 'admin/reports', 'admin/reports', 'Reports', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:59:"View reports from system logs and other status information.";}}', 'system', 0, 0, 1, 0, 5, 2, 0, 114, 123, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 122, 0, 'wysiwyg/%', 'wysiwyg/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 122, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 106, 11, 'node/add/page', 'node/add/page', 'Page', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:296:"A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an "About us" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site''s initial home page.";}}', 'system', 0, 0, 0, 0, 0, 2, 0, 11, 106, 0, 0, 0, 0, 0, 0, 0, 0),
('admin', 248, 125, 'admin/settings/page-title', 'admin/settings/page-title', 'Page title', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:76:"Configure the page titles for your site (the title in the &lt;head&gt; tag).";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 125, 248, 0, 0, 0, 0, 0, 0, 0),
('admin', 249, 123, 'admin/reports/page-title', 'admin/reports/page-title', 'Page Title List', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:37:"List all nodes with their Page Titles";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 123, 249, 0, 0, 0, 0, 0, 0, 0),
('admin', 121, 114, 'admin/content', 'admin/content', 'Content management', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:27:"Manage your site''s content.";}}', 'system', 0, 0, 1, 0, -10, 2, 0, 114, 121, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 119, 0, 'l10n_client/save', 'l10n_client/save', '', 'a:0:{}', 'system', 0, 0, 0, 0, 0, 1, 0, 119, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin', 120, 114, 'admin/compact', 'admin/compact', 'Compact mode', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 2, 0, 114, 120, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 118, 0, 'filefield/progress', 'filefield/progress', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 118, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 117, 0, 'content/js_add_more', 'content/js_add_more', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 117, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin', 114, 0, 'admin', 'admin', 'Administer', 'a:0:{}', 'system', 0, 0, 1, 0, 9, 1, 0, 114, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 115, 0, 'imce', 'imce', 'File browser', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 115, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin', 186, 146, 'admin/settings/filters/delete', 'admin/settings/filters/delete', 'Delete input format', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 125, 146, 186, 0, 0, 0, 0, 0, 0),
('admin', 187, 130, 'admin/user/rules/delete', 'admin/user/rules/delete', 'Delete rule', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 126, 130, 187, 0, 0, 0, 0, 0, 0),
('admin', 188, 123, 'admin/reports/event/%', 'admin/reports/event/%', 'Details', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 114, 123, 188, 0, 0, 0, 0, 0, 0, 0),
('admin', 189, 166, 'admin/build/path/edit', 'admin/build/path/edit', 'Edit alias', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 124, 166, 189, 0, 0, 0, 0, 0, 0),
('admin', 190, 157, 'admin/user/roles/edit', 'admin/user/roles/edit', 'Edit role', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 126, 157, 190, 0, 0, 0, 0, 0, 0),
('admin', 191, 130, 'admin/user/rules/edit', 'admin/user/rules/edit', 'Edit rule', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 126, 130, 191, 0, 0, 0, 0, 0, 0),
('admin', 192, 162, 'admin/content/taxonomy/%', 'admin/content/taxonomy/%', 'List terms', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 121, 162, 192, 0, 0, 0, 0, 0, 0),
('admin', 193, 161, 'admin/reports/status/php', 'admin/reports/status/php', 'PHP', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 123, 161, 193, 0, 0, 0, 0, 0, 0),
('admin', 194, 121, 'admin/content/node-type/page', 'admin/content/node-type/page', 'Page', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 114, 121, 194, 0, 0, 0, 0, 0, 0, 0),
('admin', 195, 154, 'admin/content/node-settings/rebuild', 'admin/content/node-settings/rebuild', 'Rebuild permissions', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 121, 154, 195, 0, 0, 0, 0, 0, 0),
('admin', 196, 131, 'admin/settings/actions/orphan', 'admin/settings/actions/orphan', 'Remove orphans', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 125, 131, 196, 0, 0, 0, 0, 0, 0),
('admin', 197, 161, 'admin/reports/status/run-cron', 'admin/reports/status/run-cron', 'Run cron', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 123, 161, 197, 0, 0, 0, 0, 0, 0),
('admin', 198, 161, 'admin/reports/status/sql', 'admin/reports/status/sql', 'SQL', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 123, 161, 198, 0, 0, 0, 0, 0, 0),
('admin', 200, 0, 'admin/build/imagecache/%/delete', 'admin/build/imagecache/%/delete', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 200, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin', 201, 0, 'admin/build/imagecache/%/export', 'admin/build/imagecache/%/export', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 201, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin', 202, 0, 'admin/build/imagecache/%/flush', 'admin/build/imagecache/%/flush', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 202, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin', 203, 0, 'admin/build/imagecache/%/override', 'admin/build/imagecache/%/override', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 203, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin', 204, 0, 'admin/build/imagecache/%/%', 'admin/build/imagecache/%/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 204, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin', 205, 114, 'admin/views/ajax/autocomplete/tag', 'admin/views/ajax/autocomplete/tag', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 2, 0, 114, 205, 0, 0, 0, 0, 0, 0, 0, 0),
('admin', 206, 170, 'admin/build/views/break-lock/%', 'admin/build/views/break-lock/%', 'Delete view', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 124, 170, 206, 0, 0, 0, 0, 0, 0),
('admin', 207, 170, 'admin/build/views/export/%', 'admin/build/views/export/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 124, 170, 207, 0, 0, 0, 0, 0, 0),
('admin', 208, 170, 'admin/build/views/clone/%', 'admin/build/views/clone/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 124, 170, 208, 0, 0, 0, 0, 0, 0),
('admin', 209, 170, 'admin/build/views/delete/%', 'admin/build/views/delete/%', 'Delete view', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 124, 170, 209, 0, 0, 0, 0, 0, 0),
('admin', 210, 170, 'admin/build/views/disable/%', 'admin/build/views/disable/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 124, 170, 210, 0, 0, 0, 0, 0, 0),
('admin', 211, 170, 'admin/build/views/enable/%', 'admin/build/views/enable/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 124, 170, 211, 0, 0, 0, 0, 0, 0),
('navigation', 214, 0, 'filefield/ahah/%/%/%', 'filefield/ahah/%/%/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 214, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin', 215, 147, 'admin/settings/language/delete/%', 'admin/settings/language/delete/%', 'Confirm', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 125, 147, 215, 0, 0, 0, 0, 0, 0),
('admin', 216, 114, 'admin/views/ajax/autocomplete/user', 'admin/views/ajax/autocomplete/user', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 2, 0, 114, 216, 0, 0, 0, 0, 0, 0, 0, 0),
('admin', 217, 0, 'admin/content/node-type/page/delete', 'admin/content/node-type/page/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 217, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin', 247, 125, 'admin/settings/googleanalytics', 'admin/settings/googleanalytics', 'Google Analytics', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:98:"Configure tracking behavior to get insights into your website traffic and marketing effectiveness.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 125, 247, 0, 0, 0, 0, 0, 0, 0),
('admin', 219, 131, 'admin/settings/actions/delete/%', 'admin/settings/actions/delete/%', 'Delete action', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:17:"Delete an action.";}}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 125, 131, 219, 0, 0, 0, 0, 0, 0),
('admin', 220, 0, 'admin/build/menu-customize/%/delete', 'admin/build/menu-customize/%/delete', 'Delete menu', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 220, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin', 221, 171, 'admin/build/translate/delete/%', 'admin/build/translate/delete/%', 'Delete string', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 124, 171, 221, 0, 0, 0, 0, 0, 0),
('admin', 222, 147, 'admin/settings/language/edit/%', 'admin/settings/language/edit/%', 'Edit language', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 125, 147, 222, 0, 0, 0, 0, 0, 0),
('admin', 223, 171, 'admin/build/translate/edit/%', 'admin/build/translate/edit/%', 'Edit string', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 124, 171, 223, 0, 0, 0, 0, 0, 0),
('admin', 224, 162, 'admin/content/taxonomy/edit/term', 'admin/content/taxonomy/edit/term', 'Edit term', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 121, 162, 224, 0, 0, 0, 0, 0, 0),
('admin', 225, 134, 'admin/build/block/list/js', 'admin/build/block/list/js', 'JavaScript List Form', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 124, 134, 225, 0, 0, 0, 0, 0, 0),
('admin', 226, 151, 'admin/build/modules/list/confirm', 'admin/build/modules/list/confirm', 'List', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 124, 151, 226, 0, 0, 0, 0, 0, 0),
('admin', 227, 151, 'admin/build/modules/uninstall/confirm', 'admin/build/modules/uninstall/confirm', 'Uninstall', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 124, 151, 227, 0, 0, 0, 0, 0, 0),
('admin', 228, 0, 'admin/build/imagecache/%/add/%', 'admin/build/imagecache/%/add/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 228, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin', 229, 0, 'admin/build/imagecache/%/%/delete', 'admin/build/imagecache/%/%/delete', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 229, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin', 230, 170, 'admin/build/views/%/add-display/%', 'admin/build/views/%/add-display/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 124, 170, 230, 0, 0, 0, 0, 0, 0),
('admin', 231, 170, 'admin/build/views/%/analyze/%', 'admin/build/views/%/analyze/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 124, 170, 231, 0, 0, 0, 0, 0, 0),
('admin', 232, 170, 'admin/build/views/%/details/%', 'admin/build/views/%/details/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 124, 170, 232, 0, 0, 0, 0, 0, 0),
('admin', 233, 150, 'admin/content/nodewords/meta-tags/custom/add', 'admin/content/nodewords/meta-tags/custom/add', 'Add custom pages meta tags', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 121, 150, 233, 0, 0, 0, 0, 0, 0),
('admin', 234, 170, 'admin/build/views/%/%/%', 'admin/build/views/%/%/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 124, 170, 234, 0, 0, 0, 0, 0, 0),
('admin', 235, 149, 'admin/build/menu/item/%/delete', 'admin/build/menu/item/%/delete', 'Delete menu item', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 124, 149, 235, 0, 0, 0, 0, 0, 0),
('admin', 236, 170, 'admin/build/views/%/clone-display/%', 'admin/build/views/%/clone-display/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 124, 170, 236, 0, 0, 0, 0, 0, 0),
('admin', 237, 149, 'admin/build/menu/item/%/edit', 'admin/build/menu/item/%/edit', 'Edit menu item', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 124, 149, 237, 0, 0, 0, 0, 0, 0),
('admin', 238, 170, 'admin/build/views/%/preview/%', 'admin/build/views/%/preview/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 124, 170, 238, 0, 0, 0, 0, 0, 0),
('admin', 239, 162, 'admin/content/taxonomy/edit/vocabulary/%', 'admin/content/taxonomy/edit/vocabulary/%', 'Edit vocabulary', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 121, 162, 239, 0, 0, 0, 0, 0, 0),
('admin', 240, 149, 'admin/build/menu/item/%/reset', 'admin/build/menu/item/%/reset', 'Reset menu item', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 124, 149, 240, 0, 0, 0, 0, 0, 0),
('admin', 241, 150, 'admin/content/nodewords/meta-tags/custom/%/delete', 'admin/content/nodewords/meta-tags/custom/%/delete', 'Delete custom pages meta tags', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 121, 150, 241, 0, 0, 0, 0, 0, 0),
('admin', 242, 150, 'admin/content/nodewords/meta-tags/custom/%/edit', 'admin/content/nodewords/meta-tags/custom/%/edit', 'Edit custom pages meta tags', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 121, 150, 242, 0, 0, 0, 0, 0, 0),
('navigation', 250, 0, 'poormanscron/run-cron-check', 'poormanscron/run-cron-check', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 250, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin', 270, 125, 'admin/settings/sitesetings', 'admin/settings/sitesetings', 'Site settings', 'a:0:{}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 125, 270, 0, 0, 0, 0, 0, 0, 0),
('admin', 253, 149, 'admin/build/menu-customize/menu-fastadmin', 'admin/build/menu-customize/%', 'Quick links', 'a:0:{}', 'menu', 0, 0, 0, 0, 0, 4, 0, 114, 124, 149, 253, 0, 0, 0, 0, 0, 0),
('menu-fastadmin', 254, 0, 'admin/build/menu-customize/primary-links', 'admin/build/menu-customize/%', 'Main menu', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:0:"";}}', 'menu', 0, 0, 0, 0, -50, 1, 1, 254, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('menu-fastadmin', 255, 0, 'admin/build/menu-customize/secondary-links', 'admin/build/menu-customize/%', 'Secondary menu', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:0:"";}}', 'menu', 0, 0, 0, 0, -49, 1, 1, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('menu-fastadmin', 256, 0, 'admin/content/node', 'admin/content/node', 'Site content', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:0:"";}}', 'menu', 0, 0, 0, 0, -48, 1, 1, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('menu-fastadmin', 257, 0, 'admin/settings/googleanalytics', 'admin/settings/googleanalytics', 'Google Analytics ', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:0:"";}}', 'menu', 0, 0, 0, 0, -46, 1, 1, 257, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('menu-fastadmin', 258, 0, 'admin/settings/smtp', 'admin/settings', 'Mail config', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:0:"";}}', 'menu', 0, 0, 0, 0, -45, 1, 1, 258, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('menu-fastadmin', 259, 0, 'admin/content/taxonomy/1', 'admin/content/taxonomy/%', 'Category', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:0:"";}}', 'menu', 0, 0, 0, 0, -47, 1, 1, 259, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin', 260, 125, 'admin/settings/imagefield-zip', 'admin/settings/imagefield-zip', 'Imagefield Zip Upload', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:45:"Configuration page for Imagefield Zip Upload.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 125, 260, 0, 0, 0, 0, 0, 0, 0),
('navigation', 261, 0, 'imagefield_zip/ahah-multigroup/%/%', 'imagefield_zip/ahah-multigroup/%/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 261, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 262, 0, 'imagefield_zip/ahah/%/%', 'imagefield_zip/ahah/%/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 262, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('menu-fastadmin', 271, 0, 'admin/settings/sitesetings', 'admin/settings/sitesetings', 'Site settings', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:0:"";}}', 'menu', 0, 0, 0, 0, 0, 1, 1, 271, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin', 273, 125, 'admin/settings/virdini_jquery_update', 'admin/settings/virdini_jquery_update', 'Virdini jQuery Update', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:52:"Configure settings for Virdini jQuery Update module.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 125, 273, 0, 0, 0, 0, 0, 0, 0),
('navigation', 278, 0, '403.html', '403.html', 'Access denied', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 278, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 279, 0, '404.html', '404.html', 'Page not found', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 279, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `menu_router`
--

CREATE TABLE IF NOT EXISTS `menu_router` (
  `path` varchar(255) NOT NULL DEFAULT '',
  `load_functions` text NOT NULL,
  `to_arg_functions` text NOT NULL,
  `access_callback` varchar(255) NOT NULL DEFAULT '',
  `access_arguments` text,
  `page_callback` varchar(255) NOT NULL DEFAULT '',
  `page_arguments` text,
  `fit` int(11) NOT NULL DEFAULT '0',
  `number_parts` smallint(6) NOT NULL DEFAULT '0',
  `tab_parent` varchar(255) NOT NULL DEFAULT '',
  `tab_root` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `title_callback` varchar(255) NOT NULL DEFAULT '',
  `title_arguments` varchar(255) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0',
  `block_callback` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `position` varchar(255) NOT NULL DEFAULT '',
  `weight` int(11) NOT NULL DEFAULT '0',
  `file` mediumtext,
  PRIMARY KEY (`path`),
  KEY `fit` (`fit`),
  KEY `tab_parent` (`tab_parent`),
  KEY `tab_root_weight_title` (`tab_root`(64),`weight`,`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu_router`
--

INSERT INTO `menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES
('node', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'node_page_default', 'a:0:{}', 1, 1, '', 'node', 'Content', 't', '', 4, '', '', '', 0, ''),
('rss.xml', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'node_feed', 'a:0:{}', 1, 1, '', 'rss.xml', 'RSS feed', 't', '', 4, '', '', '', 0, ''),
('batch', '', '', '1', 'a:0:{}', 'system_batch_page', 'a:0:{}', 1, 1, '', 'batch', '', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('403.html', '', '', '1', 'a:0:{}', 'virdini_fix_error_page', 'a:1:{i:0;s:3:"403";}', 1, 1, '', '403.html', 'Access denied', 't', '', 4, '', '', '', 0, ''),
('imce', '', '', 'imce_access', 'a:0:{}', 'imce', 'a:0:{}', 1, 1, '', 'imce', 'File browser', 't', '', 4, '', '', '', 0, 'sites/all/modules/imce/inc/imce.page.inc'),
('logout', '', '', 'user_is_logged_in', 'a:0:{}', 'user_logout', 'a:0:{}', 1, 1, '', 'logout', 'Log out', 't', '', 6, '', '', '', 10, 'modules/user/user.pages.inc'),
('404.html', '', '', '1', 'a:0:{}', 'virdini_fix_error_page', 'a:1:{i:0;s:3:"404";}', 1, 1, '', '404.html', 'Page not found', 't', '', 4, '', '', '', 0, ''),
('user', '', '', '1', 'a:0:{}', 'user_page', 'a:0:{}', 1, 1, '', 'user', 'User account', 't', '', 4, '', '', '', 0, 'modules/user/user.pages.inc'),
('admin', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_main_admin_page', 'a:0:{}', 1, 1, '', 'admin', 'Administer', 't', '', 6, '', '', '', 9, 'modules/system/system.admin.inc'),
('l10n_client/save', '', '', '0', 'a:0:{}', 'l10n_update_client_save_string', 'a:0:{}', 3, 2, '', 'l10n_client/save', '', 't', '', 6, '', '', '', 0, ''),
('user/login', '', '', 'user_is_anonymous', 'a:0:{}', 'user_page', 'a:0:{}', 3, 2, 'user', 'user', 'Log in', 't', '', 136, '', '', '', 0, 'modules/user/user.pages.inc'),
('filefield/progress', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'filefield_progress', 'a:0:{}', 3, 2, '', 'filefield/progress', '', 't', '', 4, '', '', '', 0, ''),
('system/files', '', '', '1', 'a:0:{}', 'file_download', 'a:0:{}', 3, 2, '', 'system/files', 'File download', 't', '', 4, '', '', '', 0, ''),
('poormanscron/run-cron-check', '', '', 'poormanscron_run_cron_check_access', 'a:0:{}', 'poormanscron_run_cron_check', 'a:0:{}', 3, 2, '', 'poormanscron/run-cron-check', '', 't', '', 4, '', '', '', 0, ''),
('content/js_add_more', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'content_add_more_js', 'a:0:{}', 3, 2, '', 'content/js_add_more', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/cck/includes/content.node_form.inc'),
('taxonomy/autocomplete', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'taxonomy_autocomplete', 'a:0:{}', 3, 2, '', 'taxonomy/autocomplete', 'Autocomplete taxonomy', 't', '', 4, '', '', '', 0, 'modules/taxonomy/taxonomy.pages.inc'),
('admin/by-module', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_by_module', 'a:0:{}', 3, 2, 'admin', 'admin', 'By module', 't', '', 128, '', '', '', 2, 'modules/system/system.admin.inc'),
('admin/by-task', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_main_admin_page', 'a:0:{}', 3, 2, 'admin', 'admin', 'By task', 't', '', 136, '', '', '', 0, 'modules/system/system.admin.inc'),
('filter/tips', '', '', '1', 'a:0:{}', 'filter_tips_long', 'a:0:{}', 3, 2, '', 'filter/tips', 'Compose tips', 't', '', 20, '', '', '', 0, 'modules/filter/filter.pages.inc'),
('node/add', '', '', '_node_add_access', 'a:0:{}', 'node_add_page', 'a:0:{}', 3, 2, '', 'node/add', 'Create content', 't', '', 6, '', '', '', 1, 'modules/node/node.pages.inc'),
('wysiwyg/%', 'a:1:{i:1;N;}', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'wysiwyg_dialog', 'a:1:{i:0;i:1;}', 2, 2, '', 'wysiwyg/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/wysiwyg/wysiwyg.dialog.inc'),
('admin/compact', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_compact_page', 'a:0:{}', 3, 2, '', 'admin/compact', 'Compact mode', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('user/register', '', '', 'user_register_access', 'a:0:{}', 'drupal_get_form', 'a:1:{i:0;s:13:"user_register";}', 3, 2, 'user', 'user', 'Create new account', 't', '', 128, '', '', '', 0, 'modules/user/user.pages.inc'),
('user/password', '', '', 'user_is_anonymous', 'a:0:{}', 'drupal_get_form', 'a:1:{i:0;s:9:"user_pass";}', 3, 2, 'user', 'user', 'Request new password', 't', '', 128, '', '', '', 0, 'modules/user/user.pages.inc'),
('user/autocomplete', '', '', 'user_access', 'a:1:{i:0;s:20:"access user profiles";}', 'user_autocomplete', 'a:0:{}', 3, 2, '', 'user/autocomplete', 'User autocomplete', 't', '', 4, '', '', '', 0, 'modules/user/user.pages.inc'),
('views/ajax', '', '', '1', 'a:0:{}', 'views_ajax', 'a:0:{}', 3, 2, '', 'views/ajax', 'Views', 't', '', 4, '', 'Ajax callback for view loading.', '', 0, 'sites/all/modules/views/includes/ajax.inc'),
('node/%', 'a:1:{i:1;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:4:"view";i:1;i:1;}', 'node_page_view', 'a:1:{i:0;i:1;}', 2, 2, '', 'node/%', '', 'node_page_title', 'a:1:{i:0;i:1;}', 4, '', '', '', 0, ''),
('admin/reports', '', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'system_admin_menu_block_page', 'a:0:{}', 3, 2, '', 'admin/reports', 'Reports', 't', '', 6, '', 'View reports from system logs and other status information.', 'left', 5, 'modules/system/system.admin.inc'),
('admin/content', '', '', 'admin_landing_page_access', 'a:1:{i:0;s:13:"admin/content";}', 'system_admin_menu_block_page', 'a:0:{}', 3, 2, '', 'admin/content', 'Content management', 't', '', 6, '', 'Manage your site''s content.', 'left', -10, 'modules/system/system.admin.inc'),
('admin/build', '', '', 'admin_landing_page_access', 'a:1:{i:0;s:11:"admin/build";}', 'system_admin_menu_block_page', 'a:0:{}', 3, 2, '', 'admin/build', 'Site building', 't', '', 6, '', 'Control how your site looks and feels.', 'right', -10, 'modules/system/system.admin.inc'),
('admin/settings', '', '', 'admin_landing_page_access', 'a:1:{i:0;s:14:"admin/settings";}', 'system_settings_overview', 'a:0:{}', 3, 2, '', 'admin/settings', 'Site configuration', 't', '', 6, '', 'Adjust basic site configuration options.', 'right', -5, 'modules/system/system.admin.inc'),
('user/%', 'a:1:{i:1;s:22:"user_uid_optional_load";}', 'a:1:{i:1;s:24:"user_uid_optional_to_arg";}', 'user_view_access', 'a:1:{i:0;i:1;}', 'user_view', 'a:1:{i:0;i:1;}', 2, 2, '', 'user/%', 'My account', 'user_page_title', 'a:1:{i:0;i:1;}', 6, '', '', '', 0, 'modules/user/user.pages.inc'),
('admin/user', '', '', 'admin_landing_page_access', 'a:1:{i:0;s:10:"admin/user";}', 'system_admin_menu_block_page', 'a:0:{}', 3, 2, '', 'admin/user', 'User management', 't', '', 6, '', 'Manage your site''s users, groups and access to site features.', 'left', 0, 'modules/system/system.admin.inc'),
('node/%/view', 'a:1:{i:1;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:4:"view";i:1;i:1;}', 'node_page_view', 'a:1:{i:0;i:1;}', 5, 3, 'node/%', 'node/%', 'View', 't', '', 136, '', '', '', -10, ''),
('user/%/view', 'a:1:{i:1;s:9:"user_load";}', '', 'user_view_access', 'a:1:{i:0;i:1;}', 'user_view', 'a:1:{i:0;i:1;}', 5, 3, 'user/%', 'user/%', 'View', 't', '', 136, '', '', '', -10, 'modules/user/user.pages.inc'),
('system/files/imagecache', '', '', '1', 'a:0:{}', 'imagecache_cache_private', 'a:0:{}', 7, 3, '', 'system/files/imagecache', '', 't', '', 4, '', '', '', 0, ''),
('admin/settings/actions', '', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'system_actions_manage', 'a:0:{}', 7, 3, '', 'admin/settings/actions', 'Actions', 't', '', 6, '', 'Manage the actions defined for your site.', '', 0, ''),
('taxonomy/term/%', 'a:1:{i:2;N;}', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'taxonomy_term_page', 'a:1:{i:0;i:2;}', 6, 3, '', 'taxonomy/term/%', 'Taxonomy term', 't', '', 4, '', '', '', 0, 'modules/taxonomy/taxonomy.pages.inc'),
('admin/user/rules', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access', 'a:0:{}', 7, 3, '', 'admin/user/rules', 'Access rules', 't', '', 6, '', 'List and create rules to disallow usernames, e-mail addresses, and IP addresses.', '', 0, 'modules/user/user.admin.inc'),
('admin/build/block', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'block_admin_display', 'a:0:{}', 7, 3, '', 'admin/build/block', 'Blocks', 't', '', 6, '', 'Configure what block content appears in your site''s sidebars and other regions.', '', 0, 'modules/block/block.admin.inc'),
('node/%/delete', 'a:1:{i:1;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:6:"delete";i:1;i:1;}', 'drupal_get_form', 'a:2:{i:0;s:19:"node_delete_confirm";i:1;i:1;}', 5, 3, '', 'node/%/delete', 'Delete', 't', '', 4, '', '', '', 1, 'modules/node/node.pages.inc'),
('user/%/delete', 'a:1:{i:1;s:9:"user_load";}', '', 'user_delete_access', 'a:1:{i:0;i:1;}', 'drupal_get_form', 'a:2:{i:0;s:19:"user_confirm_delete";i:1;i:1;}', 5, 3, '', 'user/%/delete', 'Delete', 't', '', 4, '', '', '', 0, 'modules/user/user.pages.inc'),
('node/%/edit', 'a:1:{i:1;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:6:"update";i:1;i:1;}', 'node_page_edit', 'a:1:{i:0;i:1;}', 5, 3, 'node/%', 'node/%', 'Edit', 't', '', 128, '', '', '', 1, 'modules/node/node.pages.inc'),
('user/%/imce', 'a:1:{i:1;s:9:"user_load";}', '', 'imce_user_page_access', 'a:1:{i:0;i:1;}', 'imce_user_page', 'a:1:{i:0;i:1;}', 5, 3, 'user/%', 'user/%', 'File browser', 't', '', 128, '', '', '', 10, 'sites/all/modules/imce/inc/imce.page.inc'),
('admin/settings/imce', '', '', 'user_access', 'a:1:{i:0;s:28:"administer imce(execute PHP)";}', 'imce_admin', 'a:0:{}', 7, 3, '', 'admin/settings/imce', 'IMCE', 't', '', 6, '', 'Control how your image/file browser works.', '', 0, 'sites/all/modules/imce/inc/imce.admin.inc'),
('admin/settings/imageapi', '', '', 'user_access', 'a:1:{i:0;s:19:"administer imageapi";}', 'drupal_get_form', 'a:1:{i:0;s:17:"imageapi_settings";}', 7, 3, '', 'admin/settings/imageapi', 'ImageAPI', 't', '', 6, '', 'Configure ImageAPI.', '', 0, ''),
('admin/build/imagecache', '', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'imagecache_ui_preset_overview', 'a:0:{}', 7, 3, '', 'admin/build/imagecache', 'ImageCache', 't', '', 6, '', 'Administer imagecache presets and actions.', '', 0, 'sites/all/modules/imagecache/imagecache_ui.pages.inc'),
('admin/settings/imagefield-zip', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'imagefield_zip_admin_page', 'a:0:{}', 7, 3, '', 'admin/settings/imagefield-zip', 'Imagefield Zip Upload', 't', '', 6, '', 'Configuration page for Imagefield Zip Upload.', '', 0, 'sites/all/modules/cck/modules/imagefield_zip/imagefield_zip.admin.inc'),
('admin/settings/language', '', '', 'user_access', 'a:1:{i:0;s:20:"administer languages";}', 'locale_inc_callback', 'a:2:{i:0;s:15:"drupal_get_form";i:1;s:30:"locale_languages_overview_form";}', 7, 3, '', 'admin/settings/language', 'Languages', 't', '', 6, '', 'Configure languages for content and the user interface.', '', 0, ''),
('admin/settings/logging', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_logging_overview', 'a:0:{}', 7, 3, '', 'admin/settings/logging', 'Logging and alerts', 't', '', 6, '', 'Settings for logging and alerts modules. Various modules can route Drupal''s system events to different destination, such as syslog, database, email, ...etc.', '', 0, 'modules/system/system.admin.inc'),
('admin/reports/dblog', '', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'dblog_overview', 'a:0:{}', 7, 3, '', 'admin/reports/dblog', 'Recent log entries', 't', '', 6, '', 'View events that have recently been logged.', '', -1, 'modules/dblog/dblog.admin.inc'),
('node/%/revisions', 'a:1:{i:1;s:9:"node_load";}', '', '_node_revision_access', 'a:1:{i:0;i:1;}', 'node_revision_overview', 'a:1:{i:0;i:1;}', 5, 3, 'node/%', 'node/%', 'Revisions', 't', '', 128, '', '', '', 2, 'modules/node/node.pages.inc'),
('admin/settings/sitesetings', '', '', 'user_access', 'a:1:{i:0;s:15:"site administer";}', 'drupal_get_form', 'a:1:{i:0;s:36:"virdini_settings_admin_settings_form";}', 7, 3, '', 'admin/settings/sitesetings', 'Site settings', 't', '', 6, '', '', '', 0, 'sites/all/modules/virdini/virdini_settings/virdini_settings.admin.php'),
('admin/reports/status', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_status', 'a:0:{}', 7, 3, '', 'admin/reports/status', 'Status report', 't', '', 6, '', 'Get a status report about your site''s operation and any detected problems.', '', 10, 'modules/system/system.admin.inc'),
('admin/build/translate', '', '', 'user_access', 'a:1:{i:0;s:19:"translate interface";}', 'locale_inc_callback', 'a:1:{i:0;s:32:"locale_translate_overview_screen";}', 7, 3, '', 'admin/build/translate', 'Translate interface', 't', '', 6, '', 'Translate the built in interface and optionally other text.', '', 0, ''),
('admin/build/path', '', '', 'user_access', 'a:1:{i:0;s:22:"administer url aliases";}', 'path_admin_overview', 'a:0:{}', 7, 3, '', 'admin/build/path', 'URL aliases', 't', '', 6, '', 'Change your site''s URL paths by aliasing them.', '', 0, 'modules/path/path.admin.inc'),
('admin/settings/virdini_jquery_update', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:23:"virdini_jquery_settings";}', 7, 3, '', 'admin/settings/virdini_jquery_update', 'Virdini jQuery Update', 't', '', 6, '', 'Configure settings for Virdini jQuery Update module.', '', 0, ''),
('admin/settings/clean-urls', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:25:"system_clean_url_settings";}', 7, 3, '', 'admin/settings/clean-urls', 'Clean URLs', 't', '', 6, '', 'Enable or disable clean URLs for your site.', '', 0, 'modules/system/system.admin.inc'),
('admin/content/node', '', '', 'user_access', 'a:1:{i:0;s:16:"administer nodes";}', 'drupal_get_form', 'a:1:{i:0;s:18:"node_admin_content";}', 7, 3, '', 'admin/content/node', 'Content', 't', '', 6, '', 'View, edit, and delete your site''s content.', '', 0, 'modules/node/node.admin.inc'),
('admin/content/types', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'content_types_overview', 'a:0:{}', 7, 3, '', 'admin/content/types', 'Content types', 't', '', 6, '', 'Manage posts by content type, including default status, front page promotion, etc.', '', 0, 'sites/all/modules/cck/includes/content.admin.inc'),
('admin/settings/date-time', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:25:"system_date_time_settings";}', 7, 3, '', 'admin/settings/date-time', 'Date and time', 't', '', 6, '', 'Settings for how Drupal displays date and time, as well as the system''s default timezone.', '', 0, 'modules/system/system.admin.inc'),
('user/%/edit', 'a:1:{i:1;a:1:{s:18:"user_category_load";a:2:{i:0;s:4:"%map";i:1;s:6:"%index";}}}', '', 'user_edit_access', 'a:1:{i:0;i:1;}', 'user_edit', 'a:1:{i:0;i:1;}', 5, 3, 'user/%', 'user/%', 'Edit', 't', '', 128, '', '', '', 0, 'modules/user/user.pages.inc'),
('admin/settings/error-reporting', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:31:"system_error_reporting_settings";}', 7, 3, '', 'admin/settings/error-reporting', 'Error reporting', 't', '', 6, '', 'Control how Drupal deals with errors including 403/404 errors as well as PHP error reporting.', '', 0, 'modules/system/system.admin.inc'),
('admin/settings/file-system', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:27:"system_file_system_settings";}', 7, 3, '', 'admin/settings/file-system', 'File system', 't', '', 6, '', 'Tell Drupal where to store uploaded files and how they are accessed.', '', 0, 'modules/system/system.admin.inc'),
('admin/settings/globalredirect', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:23:"globalredirect_settings";}', 7, 3, '', 'admin/settings/globalredirect', 'Global Redirect', 't', '', 6, '', 'Chose which features you would like enabled for Global Redirect', '', 0, 'sites/all/modules/globalredirect/globalredirect.admin.inc'),
('admin/settings/googleanalytics', '', '', 'user_access', 'a:1:{i:0;s:27:"administer google analytics";}', 'drupal_get_form', 'a:1:{i:0;s:35:"googleanalytics_admin_settings_form";}', 7, 3, '', 'admin/settings/googleanalytics', 'Google Analytics', 't', '', 6, '', 'Configure tracking behavior to get insights into your website traffic and marketing effectiveness.', '', 0, 'sites/all/modules/google_analytics/googleanalytics.admin.inc'),
('admin/settings/image-toolkit', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:29:"system_image_toolkit_settings";}', 7, 3, '', 'admin/settings/image-toolkit', 'Image toolkit', 't', '', 6, '', 'Choose which image toolkit to use if you have installed optional toolkits.', '', 0, 'modules/system/system.admin.inc'),
('admin/settings/filters', '', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'drupal_get_form', 'a:1:{i:0;s:21:"filter_admin_overview";}', 7, 3, '', 'admin/settings/filters', 'Input formats', 't', '', 6, '', 'Configure how content input by users is filtered, including allowed HTML tags. Also allows enabling of module-provided filters.', '', 0, 'modules/filter/filter.admin.inc'),
('admin/build/menu', '', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'menu_overview_page', 'a:0:{}', 7, 3, '', 'admin/build/menu', 'Menus', 't', '', 6, '', 'Control your site''s navigation menu, primary links and secondary links, as well as rename and reorganize menu items.', '', 0, 'modules/menu/menu.admin.inc'),
('admin/content/nodewords', '', '', 'user_access', 'a:1:{i:0;s:20:"administer meta tags";}', 'drupal_get_form', 'a:1:{i:0;s:23:"nodewords_settings_form";}', 7, 3, '', 'admin/content/nodewords', 'Meta tags', 't', '', 6, '', 'Configure HTML meta tags for all the content.', '', 0, 'sites/all/modules/nodewords/nodewords.admin.inc'),
('admin/build/modules', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:14:"system_modules";}', 7, 3, '', 'admin/build/modules', 'Modules', 't', '', 6, '', 'Enable or disable add-on modules for your site.', '', 0, 'modules/system/system.admin.inc'),
('admin/settings/performance', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:27:"system_performance_settings";}', 7, 3, '', 'admin/settings/performance', 'Performance', 't', '', 6, '', 'Enable or disable page caching for anonymous users and set CSS and JS bandwidth optimization options.', '', 0, 'modules/system/system.admin.inc'),
('admin/reports/page-title', '', '', 'views_access', 'a:1:{i:0;a:2:{i:0;s:16:"views_check_perm";i:1;a:1:{i:0;s:22:"administer page titles";}}}', 'views_page', 'a:2:{i:0;s:16:"list_page_titles";i:1;s:6:"page_1";}', 7, 3, '', 'admin/reports/page-title', 'Page Title List', 't', '', 6, '', 'List all nodes with their Page Titles', '', 0, ''),
('admin/user/permissions', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'drupal_get_form', 'a:1:{i:0;s:15:"user_admin_perm";}', 7, 3, '', 'admin/user/permissions', 'Permissions', 't', '', 6, '', 'Determine access to features by selecting permissions for roles.', '', 0, 'modules/user/user.admin.inc'),
('admin/content/node-settings', '', '', 'user_access', 'a:1:{i:0;s:16:"administer nodes";}', 'drupal_get_form', 'a:1:{i:0;s:14:"node_configure";}', 7, 3, '', 'admin/content/node-settings', 'Post settings', 't', '', 6, '', 'Control posting behavior, such as teaser length, requiring previews before posting, and the number of posts on the front page.', '', 0, 'modules/node/node.admin.inc'),
('admin/content/rss-publishing', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:25:"system_rss_feeds_settings";}', 7, 3, '', 'admin/content/rss-publishing', 'RSS publishing', 't', '', 6, '', 'Configure the number of items per feed and whether feeds should be titles/teasers/full-text.', '', 0, 'modules/system/system.admin.inc'),
('admin/user/roles', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'drupal_get_form', 'a:1:{i:0;s:19:"user_admin_new_role";}', 7, 3, '', 'admin/user/roles', 'Roles', 't', '', 6, '', 'List, edit, or add user roles.', '', 0, 'modules/user/user.admin.inc'),
('admin/settings/site-information', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:32:"system_site_information_settings";}', 7, 3, '', 'admin/settings/site-information', 'Site information', 't', '', 6, '', 'Change basic site information, such as the site name, slogan, e-mail address, mission, front page and more.', '', 0, 'modules/system/system.admin.inc'),
('admin/settings/site-maintenance', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:32:"system_site_maintenance_settings";}', 7, 3, '', 'admin/settings/site-maintenance', 'Site maintenance', 't', '', 6, '', 'Take the site off-line for maintenance or bring it back online.', '', 0, 'modules/system/system.admin.inc'),
('admin/content/taxonomy', '', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:1:{i:0;s:30:"taxonomy_overview_vocabularies";}', 7, 3, '', 'admin/content/taxonomy', 'Taxonomy', 't', '', 6, '', 'Manage tagging, categorization, and classification of your content.', '', 0, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/build/themes', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:2:{i:0;s:18:"system_themes_form";i:1;N;}', 7, 3, '', 'admin/build/themes', 'Themes', 't', '', 6, '', 'Change which theme your site uses or allows users to set.', '', 0, 'modules/system/system.admin.inc'),
('admin/reports/access-denied', '', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'dblog_top', 'a:1:{i:0;s:13:"access denied";}', 7, 3, '', 'admin/reports/access-denied', 'Top ''access denied'' errors', 't', '', 6, '', 'View ''access denied'' errors (403s).', '', 0, 'modules/dblog/dblog.admin.inc'),
('admin/reports/page-not-found', '', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'dblog_top', 'a:1:{i:0;s:14:"page not found";}', 7, 3, '', 'admin/reports/page-not-found', 'Top ''page not found'' errors', 't', '', 6, '', 'View ''page not found'' errors (404s).', '', 0, 'modules/dblog/dblog.admin.inc'),
('admin/user/settings', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'drupal_get_form', 'a:1:{i:0;s:19:"user_admin_settings";}', 7, 3, '', 'admin/user/settings', 'User settings', 't', '', 6, '', 'Configure default behavior of users, including registration requirements, e-mails, and user pictures.', '', 0, 'modules/user/user.admin.inc'),
('admin/user/user', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'user_admin', 'a:1:{i:0;s:4:"list";}', 7, 3, '', 'admin/user/user', 'Users', 't', '', 6, '', 'List, add, and edit users.', '', 0, 'modules/user/user.admin.inc'),
('admin/settings/wysiwyg', '', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'drupal_get_form', 'a:1:{i:0;s:24:"wysiwyg_profile_overview";}', 7, 3, '', 'admin/settings/wysiwyg', 'Wysiwyg profiles', 't', '', 6, '', 'Configure client-side editors.', '', 0, 'sites/all/modules/wysiwyg/wysiwyg.admin.inc'),
('admin/build/views', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_list_views', 'a:0:{}', 7, 3, '', 'admin/build/views', 'Views', 't', '', 6, '', 'Views are customized lists of content on your system; they are highly configurable and give you control over how lists of content are presented.', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/settings/admin', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:19:"admin_settings_form";}', 7, 3, '', 'admin/settings/admin', 'Administration tools', 't', '', 6, '', 'Settings for site administration tools.', '', 0, 'sites/all/modules/admin/admin.admin.inc'),
('node/add/page', '', '', 'node_access', 'a:2:{i:0;s:6:"create";i:1;s:4:"page";}', 'node_add', 'a:1:{i:0;i:2;}', 7, 3, '', 'node/add/page', 'Page', 'check_plain', '', 6, '', 'A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an "About us" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site''s initial home page.', '', 0, 'modules/node/node.pages.inc'),
('admin/settings/page-title', '', '', 'user_access', 'a:1:{i:0;s:22:"administer page titles";}', 'drupal_get_form', 'a:1:{i:0;s:25:"page_title_admin_settings";}', 7, 3, '', 'admin/settings/page-title', 'Page title', 't', '', 6, '', 'Configure the page titles for your site (the title in the &lt;head&gt; tag).', '', 0, 'sites/all/modules/page_title/page_title.admin.inc'),
('admin/build/block/list', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'block_admin_display', 'a:0:{}', 15, 4, 'admin/build/block', 'admin/build/block', 'List', 't', '', 136, '', '', '', -10, 'modules/block/block.admin.inc'),
('admin/build/imagecache/list', '', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'imagecache_ui_preset_overview', 'a:0:{}', 15, 4, 'admin/build/imagecache', 'admin/build/imagecache', 'List', 't', '', 136, '', '', '', -10, 'sites/all/modules/imagecache/imagecache_ui.pages.inc'),
('admin/content/node/overview', '', '', 'user_access', 'a:1:{i:0;s:16:"administer nodes";}', 'drupal_get_form', 'a:1:{i:0;s:18:"node_admin_content";}', 15, 4, 'admin/content/node', 'admin/content/node', 'List', 't', '', 136, '', '', '', -10, 'modules/node/node.admin.inc'),
('admin/content/types/list', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'content_types_overview', 'a:0:{}', 15, 4, 'admin/content/types', 'admin/content/types', 'List', 't', '', 136, '', '', '', -10, 'sites/all/modules/cck/includes/content.admin.inc'),
('admin/build/path/list', '', '', 'user_access', 'a:1:{i:0;s:22:"administer url aliases";}', 'path_admin_overview', 'a:0:{}', 15, 4, 'admin/build/path', 'admin/build/path', 'List', 't', '', 136, '', '', '', -10, 'modules/path/path.admin.inc'),
('admin/build/modules/list', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:14:"system_modules";}', 15, 4, 'admin/build/modules', 'admin/build/modules', 'List', 't', '', 136, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/content/taxonomy/list', '', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:1:{i:0;s:30:"taxonomy_overview_vocabularies";}', 15, 4, 'admin/content/taxonomy', 'admin/content/taxonomy', 'List', 't', '', 136, '', '', '', -10, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/user/rules/list', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access', 'a:0:{}', 15, 4, 'admin/user/rules', 'admin/user/rules', 'List', 't', '', 136, '', '', '', -10, 'modules/user/user.admin.inc'),
('admin/user/user/list', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'user_admin', 'a:1:{i:0;s:4:"list";}', 15, 4, 'admin/user/user', 'admin/user/user', 'List', 't', '', 136, '', '', '', -10, 'modules/user/user.admin.inc'),
('admin/settings/filters/list', '', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'drupal_get_form', 'a:1:{i:0;s:21:"filter_admin_overview";}', 15, 4, 'admin/settings/filters', 'admin/settings/filters', 'List', 't', '', 136, '', '', '', 0, 'modules/filter/filter.admin.inc'),
('admin/settings/imageapi/list', '', '', 'user_access', 'a:1:{i:0;s:19:"administer imageapi";}', 'drupal_get_form', 'a:1:{i:0;s:17:"imageapi_settings";}', 15, 4, 'admin/settings/imageapi', 'admin/settings/imageapi', 'List', 't', '', 136, '', '', '', -1, ''),
('admin/settings/language/overview', '', '', 'user_access', 'a:1:{i:0;s:20:"administer languages";}', 'locale_inc_callback', 'a:2:{i:0;s:15:"drupal_get_form";i:1;s:30:"locale_languages_overview_form";}', 15, 4, 'admin/settings/language', 'admin/settings/language', 'List', 't', '', 136, '', '', '', 0, ''),
('admin/settings/wysiwyg/profile', '', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'drupal_get_form', 'a:1:{i:0;s:24:"wysiwyg_profile_overview";}', 15, 4, 'admin/settings/wysiwyg', 'admin/settings/wysiwyg', 'List', 't', '', 136, '', '', '', 0, 'sites/all/modules/wysiwyg/wysiwyg.admin.inc'),
('admin/build/translate/overview', '', '', 'user_access', 'a:1:{i:0;s:19:"translate interface";}', 'locale_inc_callback', 'a:1:{i:0;s:32:"locale_translate_overview_screen";}', 15, 4, 'admin/build/translate', 'admin/build/translate', 'Overview', 't', '', 136, '', '', '', 0, ''),
('user/%/edit/account', 'a:1:{i:1;a:1:{s:18:"user_category_load";a:2:{i:0;s:4:"%map";i:1;s:6:"%index";}}}', '', 'user_edit_access', 'a:1:{i:0;i:1;}', 'user_edit', 'a:1:{i:0;i:1;}', 11, 4, 'user/%/edit', 'user/%', 'Account', 't', '', 136, '', '', '', 0, 'modules/user/user.pages.inc'),
('admin/build/themes/select', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:2:{i:0;s:18:"system_themes_form";i:1;N;}', 15, 4, 'admin/build/themes', 'admin/build/themes', 'List', 't', '', 136, '', 'Select the default theme.', '', -1, 'modules/system/system.admin.inc'),
('admin/build/menu/list', '', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'menu_overview_page', 'a:0:{}', 15, 4, 'admin/build/menu', 'admin/build/menu', 'List menus', 't', '', 136, '', '', '', -10, 'modules/menu/menu.admin.inc'),
('admin/settings/file-system/settings', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:27:"system_file_system_settings";}', 15, 4, 'admin/settings/file-system', 'admin/settings/file-system', 'Settings', 't', '', 136, '', '', '', -10, 'modules/system/system.admin.inc'),
('sites/default/files/imagecache', '', '', '_imagecache_menu_access_public_files', 'a:0:{}', 'imagecache_cache', 'a:0:{}', 15, 4, '', 'sites/default/files/imagecache', '', 't', '', 4, '', '', '', 0, ''),
('admin/build/themes/settings', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:21:"system_theme_settings";}', 15, 4, 'admin/build/themes', 'admin/build/themes', 'Configure', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/settings/actions/manage', '', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'system_actions_manage', 'a:0:{}', 15, 4, 'admin/settings/actions', 'admin/settings/actions', 'Manage actions', 't', '', 136, '', 'Manage the actions defined for your site.', '', -2, ''),
('admin/content/nodewords/settings', '', '', 'user_access', 'a:1:{i:0;s:20:"administer meta tags";}', 'drupal_get_form', 'a:1:{i:0;s:23:"nodewords_settings_form";}', 15, 4, 'admin/content/nodewords', 'admin/content/nodewords', 'Settings', 't', '', 136, '', '', '', -10, 'sites/all/modules/nodewords/nodewords.admin.inc'),
('admin/build/modules/uninstall', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:24:"system_modules_uninstall";}', 15, 4, 'admin/build/modules', 'admin/build/modules', 'Uninstall', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/path/add', '', '', 'user_access', 'a:1:{i:0;s:22:"administer url aliases";}', 'path_admin_edit', 'a:0:{}', 15, 4, 'admin/build/path', 'admin/build/path', 'Add alias', 't', '', 128, '', '', '', 0, 'modules/path/path.admin.inc'),
('admin/settings/filters/add', '', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'filter_admin_format_page', 'a:0:{}', 15, 4, 'admin/settings/filters', 'admin/settings/filters', 'Add input format', 't', '', 128, '', '', '', 1, 'modules/filter/filter.admin.inc'),
('admin/settings/language/add', '', '', 'user_access', 'a:1:{i:0;s:20:"administer languages";}', 'locale_inc_callback', 'a:1:{i:0;s:27:"locale_languages_add_screen";}', 15, 4, 'admin/settings/language', 'admin/settings/language', 'Add language', 't', '', 128, '', '', '', 5, ''),
('admin/user/rules/add', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access_add', 'a:0:{}', 15, 4, 'admin/user/rules', 'admin/user/rules', 'Add rule', 't', '', 128, '', '', '', 0, 'modules/user/user.admin.inc'),
('admin/user/user/create', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'user_admin', 'a:1:{i:0;s:6:"create";}', 15, 4, 'admin/user/user', 'admin/user/user', 'Add user', 't', '', 128, '', '', '', 0, 'modules/user/user.admin.inc'),
('admin/user/rules/check', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access_check', 'a:0:{}', 15, 4, 'admin/user/rules', 'admin/user/rules', 'Check rules', 't', '', 128, '', '', '', 0, 'modules/user/user.admin.inc'),
('admin/settings/imageapi/config', '', '', 'user_access', 'a:1:{i:0;s:19:"administer imageapi";}', 'drupal_get_form', 'a:1:{i:0;s:25:"imageapi_gd_settings_form";}', 15, 4, 'admin/settings/imageapi', 'admin/settings/imageapi', 'Configure', 't', '', 128, '', '', '', 0, ''),
('admin/settings/language/configure', '', '', 'user_access', 'a:1:{i:0;s:20:"administer languages";}', 'locale_inc_callback', 'a:2:{i:0;s:15:"drupal_get_form";i:1;s:31:"locale_languages_configure_form";}', 15, 4, 'admin/settings/language', 'admin/settings/language', 'Configure', 't', '', 128, '', '', '', 10, ''),
('admin/build/translate/export', '', '', 'user_access', 'a:1:{i:0;s:19:"translate interface";}', 'locale_inc_callback', 'a:1:{i:0;s:30:"locale_translate_export_screen";}', 15, 4, 'admin/build/translate', 'admin/build/translate', 'Export', 't', '', 128, '', '', '', 30, ''),
('admin/content/types/fields', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'content_fields_list', 'a:0:{}', 15, 4, 'admin/content/types', 'admin/content/types', 'Fields', 't', '', 128, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc'),
('admin/build/translate/import', '', '', 'user_access', 'a:1:{i:0;s:19:"translate interface";}', 'locale_inc_callback', 'a:2:{i:0;s:15:"drupal_get_form";i:1;s:28:"locale_translate_import_form";}', 15, 4, 'admin/build/translate', 'admin/build/translate', 'Import', 't', '', 128, '', '', '', 20, ''),
('admin/settings/actions/orphan', '', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'system_actions_remove_orphans', 'a:0:{}', 15, 4, '', 'admin/settings/actions/orphan', 'Remove orphans', 't', '', 4, '', '', '', 0, ''),
('admin/build/translate/search', '', '', 'user_access', 'a:1:{i:0;s:19:"translate interface";}', 'locale_inc_callback', 'a:1:{i:0;s:28:"locale_translate_seek_screen";}', 15, 4, 'admin/build/translate', 'admin/build/translate', 'Search', 't', '', 128, '', '', '', 10, ''),
('admin/build/block/add', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'drupal_get_form', 'a:1:{i:0;s:20:"block_add_block_form";}', 15, 4, 'admin/build/block', 'admin/build/block', 'Add block', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/build/menu/add', '', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:2:{i:0;s:14:"menu_edit_menu";i:1;s:3:"add";}', 15, 4, 'admin/build/menu', 'admin/build/menu', 'Add menu', 't', '', 128, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('imagefield_zip/ahah-multigroup/%/%', 'a:2:{i:2;N;i:3;N;}', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'imagefield_zip_multigroup_js', 'a:2:{i:0;i:2;i:1;i:3;}', 12, 4, '', 'imagefield_zip/ahah-multigroup/%/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/cck/modules/imagefield_zip/imagefield_zip.ahah.inc'),
('admin/content/types/add', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:1:{i:0;s:14:"node_type_form";}', 15, 4, 'admin/content/types', 'admin/content/types', 'Add content type', 't', '', 128, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/build/imagecache/add', '', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'drupal_get_form', 'a:1:{i:0;s:25:"imagecache_ui_preset_form";}', 15, 4, 'admin/build/imagecache', 'admin/build/imagecache', 'Add new preset', 't', '', 128, '', '', '', 0, 'sites/all/modules/imagecache/imagecache_ui.pages.inc'),
('admin/settings/imce/profile', '', '', 'user_access', 'a:1:{i:0;s:28:"administer imce(execute PHP)";}', 'imce_profile_operations', 'a:0:{}', 15, 4, '', 'admin/settings/imce/profile', 'Add new profile', 't', '', 4, '', '', '', 0, 'sites/all/modules/imce/inc/imce.admin.inc'),
('admin/build/path/pathauto', '', '', 'user_access', 'a:1:{i:0;s:19:"administer pathauto";}', 'drupal_get_form', 'a:1:{i:0;s:23:"pathauto_admin_settings";}', 15, 4, 'admin/build/path', 'admin/build/path', 'Automated alias settings', 't', '', 128, '', '', '', 10, 'sites/all/modules/pathauto/pathauto.admin.inc'),
('admin/settings/clean-urls/check', '', '', '1', 'a:0:{}', 'drupal_json', 'a:1:{i:0;a:1:{s:6:"status";b:1;}}', 15, 4, '', 'admin/settings/clean-urls/check', 'Clean URL check', 't', '', 4, '', '', '', 0, ''),
('admin/settings/actions/configure', '', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'drupal_get_form', 'a:1:{i:0;s:24:"system_actions_configure";}', 15, 4, '', 'admin/settings/actions/configure', 'Configure an advanced action', 't', '', 4, '', '', '', 0, ''),
('admin/settings/date-time/lookup', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_date_time_lookup', 'a:0:{}', 15, 4, '', 'admin/settings/date-time/lookup', 'Date and time lookup', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/content/nodewords/meta-tags', '', '', 'user_access', 'a:1:{i:0;s:20:"administer meta tags";}', 'drupal_get_form', 'a:1:{i:0;s:19:"nodewords_tags_form";}', 15, 4, 'admin/content/nodewords', 'admin/content/nodewords', 'Default and specific meta tags', 't', '', 128, '', '', '', -9, 'sites/all/modules/nodewords/nodewords.admin.inc'),
('admin/build/path/delete_bulk', '', '', 'user_access', 'a:1:{i:0;s:22:"administer url aliases";}', 'drupal_get_form', 'a:1:{i:0;s:21:"pathauto_admin_delete";}', 15, 4, 'admin/build/path', 'admin/build/path', 'Delete aliases', 't', '', 128, '', '', '', 30, 'sites/all/modules/pathauto/pathauto.admin.inc'),
('admin/build/path/edit', '', '', 'user_access', 'a:1:{i:0;s:22:"administer url aliases";}', 'path_admin_edit', 'a:0:{}', 15, 4, '', 'admin/build/path/edit', 'Edit alias', 't', '', 4, '', '', '', 0, 'modules/path/path.admin.inc'),
('admin/user/roles/edit', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'drupal_get_form', 'a:1:{i:0;s:15:"user_admin_role";}', 15, 4, '', 'admin/user/roles/edit', 'Edit role', 't', '', 4, '', '', '', 0, 'modules/user/user.admin.inc'),
('admin/user/rules/edit', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access_edit', 'a:0:{}', 15, 4, '', 'admin/user/rules/edit', 'Edit rule', 't', '', 4, '', '', '', 0, 'modules/user/user.admin.inc'),
('admin/reports/status/php', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_php', 'a:0:{}', 15, 4, '', 'admin/reports/status/php', 'PHP', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/content/node-settings/rebuild', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'drupal_get_form', 'a:1:{i:0;s:30:"node_configure_rebuild_confirm";}', 15, 4, '', 'admin/content/node-settings/rebuild', 'Rebuild permissions', 't', '', 4, '', '', '', 0, 'modules/node/node.admin.inc'),
('admin/reports/status/run-cron', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_run_cron', 'a:0:{}', 15, 4, '', 'admin/reports/status/run-cron', 'Run cron', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/reports/status/sql', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_sql', 'a:0:{}', 15, 4, '', 'admin/reports/status/sql', 'SQL', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/menu/settings', '', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:1:{i:0;s:14:"menu_configure";}', 15, 4, 'admin/build/menu', 'admin/build/menu', 'Settings', 't', '', 128, '', '', '', 5, 'modules/menu/menu.admin.inc'),
('admin/build/translate/update', '', '', 'user_access', 'a:1:{i:0;s:19:"translate interface";}', 'l10n_update_admin_overview', 'a:0:{}', 15, 4, 'admin/build/translate', 'admin/build/translate', 'Update', 't', '', 128, '', 'Available updates', '', 20, 'sites/all/modules/l10n_update/l10n_update.admin.inc'),
('admin/build/views/add', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_add_page', 'a:0:{}', 15, 4, 'admin/build/views', 'admin/build/views', 'Add', 't', '', 128, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/build/views/list', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_list_views', 'a:0:{}', 15, 4, 'admin/build/views', 'admin/build/views', 'List', 't', '', 136, '', '', '', -1, 'sites/all/modules/views/includes/admin.inc'),
('admin/build/block/configure', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'drupal_get_form', 'a:1:{i:0;s:21:"block_admin_configure";}', 15, 4, '', 'admin/build/block/configure', 'Configure block', 't', '', 4, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/build/path/delete', '', '', 'user_access', 'a:1:{i:0;s:22:"administer url aliases";}', 'drupal_get_form', 'a:1:{i:0;s:25:"path_admin_delete_confirm";}', 15, 4, '', 'admin/build/path/delete', 'Delete alias', 't', '', 4, '', '', '', 0, 'modules/path/path.admin.inc'),
('admin/build/block/delete', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'drupal_get_form', 'a:1:{i:0;s:16:"block_box_delete";}', 15, 4, '', 'admin/build/block/delete', 'Delete block', 't', '', 4, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/settings/filters/delete', '', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'drupal_get_form', 'a:1:{i:0;s:19:"filter_admin_delete";}', 15, 4, '', 'admin/settings/filters/delete', 'Delete input format', 't', '', 4, '', '', '', 0, 'modules/filter/filter.admin.inc'),
('admin/user/rules/delete', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'drupal_get_form', 'a:1:{i:0;s:32:"user_admin_access_delete_confirm";}', 15, 4, '', 'admin/user/rules/delete', 'Delete rule', 't', '', 4, '', '', '', 0, 'modules/user/user.admin.inc'),
('admin/reports/event/%', 'a:1:{i:3;N;}', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'dblog_event', 'a:1:{i:0;i:3;}', 14, 4, '', 'admin/reports/event/%', 'Details', 't', '', 4, '', '', '', 0, 'modules/dblog/dblog.admin.inc'),
('admin/build/views/import', '', '', 'views_import_access', 'a:1:{i:0;s:16:"administer views";}', 'drupal_get_form', 'a:1:{i:0;s:20:"views_ui_import_page";}', 15, 4, 'admin/build/views', 'admin/build/views', 'Import', 't', '', 128, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/content/taxonomy/%', 'a:1:{i:3;s:24:"taxonomy_vocabulary_load";}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:2:{i:0;s:23:"taxonomy_overview_terms";i:1;i:3;}', 14, 4, '', 'admin/content/taxonomy/%', 'List terms', 't', '', 4, '', '', '', 0, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/content/node-type/page', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:4:"page";s:4:"name";s:4:"Page";s:6:"module";s:4:"node";s:11:"description";s:296:"A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an "About us" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site''s initial home page.";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:4:"page";}}', 15, 4, '', 'admin/content/node-type/page', 'Page', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/settings/language/update', '', '', 'user_access', 'a:1:{i:0;s:19:"translate interface";}', 'drupal_get_form', 'a:1:{i:0;s:31:"l10n_update_admin_settings_form";}', 15, 4, 'admin/settings/language', 'admin/settings/language', 'Translation updates', 't', '', 128, '', 'Automatic update configuration', '', 20, 'sites/all/modules/l10n_update/l10n_update.admin.inc'),
('admin/build/views/tools', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'drupal_get_form', 'a:1:{i:0;s:20:"views_ui_admin_tools";}', 15, 4, 'admin/build/views', 'admin/build/views', 'Tools', 't', '', 128, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/settings/file-system/transliteration', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:27:"transliteration_retroactive";}', 15, 4, 'admin/settings/file-system', 'admin/settings/file-system', 'Transliteration', 't', '', 128, '', 'Convert existing file names to US-ASCII.', '', 10, 'sites/all/modules/transliteration/transliteration.admin.inc'),
('imagefield_zip/ahah/%/%', 'a:2:{i:2;N;i:3;N;}', '', 'filefield_edit_access', 'a:2:{i:0;i:2;i:1;i:3;}', 'imagefield_zip_js', 'a:2:{i:0;i:2;i:1;i:3;}', 12, 4, '', 'imagefield_zip/ahah/%/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/cck/modules/imagefield_zip/imagefield_zip.ahah.inc'),
('admin/settings/logging/dblog', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:20:"dblog_admin_settings";}', 15, 4, '', 'admin/settings/logging/dblog', 'Database logging', 't', '', 6, '', 'Settings for logging to the Drupal database logs. This is the most common method for small to medium sites on shared hosting. The logs are viewable from the admin pages.', '', 0, 'modules/dblog/dblog.admin.inc'),
('admin/settings/admin/settings', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:19:"admin_settings_form";}', 15, 4, 'admin/settings/admin', 'admin/settings/admin', 'Settings', 't', '', 136, '', 'Settings for site administration tools.', '', 0, 'sites/all/modules/admin/admin.admin.inc'),
('admin/build/views1/convert', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_convert1', 'a:1:{i:0;i:4;}', 15, 4, '', 'admin/build/views1/convert', 'Convert view', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/convert.inc'),
('admin/build/views1/delete', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'drupal_get_form', 'a:2:{i:0;s:24:"views_ui_delete1_confirm";i:1;i:4;}', 15, 4, '', 'admin/build/views1/delete', 'Delete view', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/convert.inc'),
('admin/settings/admin/rebuild', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:22:"admin_settings_rebuild";}', 15, 4, 'admin/settings/admin', 'admin/settings/admin', 'Rebuild', 't', '', 128, '', 'Wipe and rebuild the administrative menu.', '', 10, 'sites/all/modules/admin/admin.admin.inc'),
('admin/settings/filters/%', 'a:1:{i:3;s:18:"filter_format_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'filter_admin_format_page', 'a:1:{i:0;i:3;}', 14, 4, '', 'admin/settings/filters/%', '', 'filter_admin_format_title', 'a:1:{i:0;i:3;}', 4, '', '', '', 0, 'modules/filter/filter.admin.inc'),
('admin/settings/admin/theme', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:27:"system_admin_theme_settings";}', 15, 4, 'admin/settings/admin', 'admin/settings/admin', 'Administration theme', 't', '', 128, 'system_admin_theme_settings', 'Settings for how your administrative pages should look.', 'left', 10, 'modules/system/system.admin.inc'),
('admin/build/imagecache/%', 'a:1:{i:3;s:25:"imagecache_ui_preset_load";}', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'drupal_get_form', 'a:2:{i:0;s:25:"imagecache_ui_preset_form";i:1;i:3;}', 14, 4, '', 'admin/build/imagecache/%', '', 'imagecache_preset_title_callback', 'a:2:{i:0;s:24:"Edit preset: !presetname";i:1;i:3;}', 4, '', '', '', 0, 'sites/all/modules/imagecache/imagecache_ui.pages.inc'),
('admin/build/menu-customize/%', 'a:1:{i:3;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:2:{i:0;s:18:"menu_overview_form";i:1;i:3;}', 14, 4, '', 'admin/build/menu-customize/%', 'Customize menu', 'menu_overview_title', 'a:1:{i:0;i:3;}', 4, '', '', '', 0, 'modules/menu/menu.admin.inc');
INSERT INTO `menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES
('admin/content/node-type/page/edit', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:4:"page";s:4:"name";s:4:"Page";s:6:"module";s:4:"node";s:11:"description";s:296:"A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an "About us" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site''s initial home page.";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:4:"page";}}', 31, 5, 'admin/content/node-type/page', 'admin/content/node-type/page', 'Edit', 't', '', 136, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/build/themes/settings/global', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:21:"system_theme_settings";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Global settings', 't', '', 136, '', '', '', -1, 'modules/system/system.admin.inc'),
('admin/content/taxonomy/%/list', 'a:1:{i:3;s:24:"taxonomy_vocabulary_load";}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:2:{i:0;s:23:"taxonomy_overview_terms";i:1;i:3;}', 29, 5, 'admin/content/taxonomy/%', 'admin/content/taxonomy/%', 'List', 't', '', 136, '', '', '', -10, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/settings/filters/%/edit', 'a:1:{i:3;s:18:"filter_format_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'filter_admin_format_page', 'a:1:{i:0;i:3;}', 29, 5, 'admin/settings/filters/%', 'admin/settings/filters/%', 'Edit', 't', '', 136, '', '', '', 0, 'modules/filter/filter.admin.inc'),
('admin/build/menu-customize/%/list', 'a:1:{i:3;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:2:{i:0;s:18:"menu_overview_form";i:1;i:3;}', 29, 5, 'admin/build/menu-customize/%', 'admin/build/menu-customize/%', 'List items', 't', '', 136, '', '', '', -10, 'modules/menu/menu.admin.inc'),
('admin/content/nodewords/meta-tags/default', '', '', 'user_access', 'a:1:{i:0;s:20:"administer meta tags";}', 'drupal_get_form', 'a:1:{i:0;s:19:"nodewords_tags_form";}', 31, 5, 'admin/content/nodewords/meta-tags', 'admin/content/nodewords', 'Default values', 't', '', 136, '', '', '', -10, 'sites/all/modules/nodewords/nodewords.admin.inc'),
('admin/build/modules/list/confirm', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:14:"system_modules";}', 31, 5, '', 'admin/build/modules/list/confirm', 'List', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/modules/uninstall/confirm', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:24:"system_modules_uninstall";}', 31, 5, '', 'admin/build/modules/uninstall/confirm', 'Uninstall', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/themes/settings/bluemarine', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:33:"themes/bluemarine/bluemarine.info";s:4:"name";s:10:"bluemarine";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:10:"Bluemarine";s:11:"description";s:66:"Table-based multi-column theme with a marine and ash color scheme.";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/bluemarine/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/bluemarine/script.js";}s:10:"screenshot";s:32:"themes/bluemarine/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/bluemarine/style.css";}}s:6:"engine";s:11:"phptemplate";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:10:"bluemarine";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Bluemarine', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/themes/settings/chameleon', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":11:{s:8:"filename";s:31:"themes/chameleon/chameleon.info";s:4:"name";s:9:"chameleon";s:4:"type";s:5:"theme";s:5:"owner";s:32:"themes/chameleon/chameleon.theme";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:12:{s:4:"name";s:9:"Chameleon";s:11:"description";s:42:"Minimalist tabled theme with light colors.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:8:"features";a:4:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";}s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:9:"style.css";s:26:"themes/chameleon/style.css";s:10:"common.css";s:27:"themes/chameleon/common.css";}}s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:7:"scripts";a:1:{s:9:"script.js";s:26:"themes/chameleon/script.js";}s:10:"screenshot";s:31:"themes/chameleon/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:9:"style.css";s:26:"themes/chameleon/style.css";s:10:"common.css";s:27:"themes/chameleon/common.css";}}}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:9:"chameleon";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Chameleon', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/themes/settings/cube', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":13:{s:8:"filename";s:37:"sites/all/themes/rubik/cube/cube.info";s:4:"name";s:4:"cube";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:16:{s:4:"name";s:4:"Cube";s:11:"description";s:44:"Spaces-aware front-end theme based on Rubik.";s:10:"base theme";s:5:"rubik";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:11:"stylesheets";a:1:{s:6:"screen";a:1:{s:9:"style.css";s:37:"sites/all/themes/rubik/cube/style.css";}}s:7:"regions";a:4:{s:6:"header";s:6:"Header";s:7:"content";s:7:"Content";s:4:"left";s:4:"Left";s:5:"right";s:5:"Right";}s:9:"designkit";a:2:{s:5:"color";a:1:{s:10:"background";s:7:"#0088cc";}s:4:"logo";a:2:{s:4:"logo";s:23:"imagecache_scale:200x50";s:5:"print";s:24:"imagecache_scale:600x150";}}s:7:"layouts";a:5:{s:7:"default";a:3:{s:4:"name";s:7:"Default";s:11:"description";s:23:"Simple one column page.";s:8:"template";s:4:"page";}s:7:"sidebar";a:5:{s:4:"name";s:7:"Sidebar";s:11:"description";s:26:"Main content with sidebar.";s:10:"stylesheet";s:18:"layout-sidebar.css";s:8:"template";s:14:"layout-sidebar";s:7:"regions";a:2:{i:0;s:7:"content";i:1;s:5:"right";}}s:5:"split";a:5:{s:4:"name";s:5:"Split";s:11:"description";s:12:"50/50 split.";s:10:"stylesheet";s:16:"layout-split.css";s:8:"template";s:14:"layout-sidebar";s:7:"regions";a:2:{i:0;s:7:"content";i:1;s:5:"right";}}s:7:"columns";a:5:{s:4:"name";s:7:"Columns";s:11:"description";s:20:"Three column layout.";s:10:"stylesheet";s:18:"layout-columns.css";s:8:"template";s:14:"layout-columns";s:7:"regions";a:4:{i:0;s:6:"header";i:1;s:7:"content";i:2;s:4:"left";i:3;s:5:"right";}}s:6:"offset";a:5:{s:4:"name";s:15:"Offset sidebars";s:11:"description";s:38:"Main content with two offset sidebars.";s:10:"stylesheet";s:17:"layout-offset.css";s:8:"template";s:13:"layout-offset";s:7:"regions";a:4:{i:0;s:6:"header";i:1;s:7:"content";i:2;s:4:"left";i:3;s:5:"right";}}}s:7:"version";s:13:"6.x-3.0-beta3";s:7:"project";s:5:"rubik";s:9:"datestamp";s:10:"1329952845";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:37:"sites/all/themes/rubik/cube/script.js";}s:10:"screenshot";s:42:"sites/all/themes/rubik/cube/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:6:"screen";a:1:{s:9:"style.css";s:37:"sites/all/themes/rubik/cube/style.css";}}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:5:"rubik";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:4:"cube";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Cube', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/themes/settings/garland', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:27:"themes/garland/garland.info";s:4:"name";s:7:"garland";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:7:"Garland";s:11:"description";s:66:"Tableless, recolorable, multi-column, fluid width theme (default).";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:24:"themes/garland/script.js";}s:10:"screenshot";s:29:"themes/garland/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:6:"engine";s:11:"phptemplate";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:7:"garland";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Garland', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/themes/settings/marvin', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:35:"themes/chameleon/marvin/marvin.info";s:4:"name";s:6:"marvin";s:4:"type";s:5:"theme";s:5:"owner";s:0:"";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:6:"Marvin";s:11:"description";s:31:"Boxy tabled theme in all grays.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:10:"base theme";s:9:"chameleon";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:33:"themes/chameleon/marvin/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/chameleon/marvin/script.js";}s:10:"screenshot";s:38:"themes/chameleon/marvin/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:33:"themes/chameleon/marvin/style.css";}}s:10:"base_theme";s:9:"chameleon";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:6:"marvin";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Marvin', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/themes/settings/minnelli', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":13:{s:8:"filename";s:37:"themes/garland/minnelli/minnelli.info";s:4:"name";s:8:"minnelli";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:14:{s:4:"name";s:8:"Minnelli";s:11:"description";s:56:"Tableless, recolorable, multi-column, fixed width theme.";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:10:"base theme";s:7:"garland";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:12:"minnelli.css";s:36:"themes/garland/minnelli/minnelli.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/garland/minnelli/script.js";}s:10:"screenshot";s:38:"themes/garland/minnelli/screenshot.png";s:3:"php";s:5:"4.3.5";s:6:"engine";s:11:"phptemplate";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:12:"minnelli.css";s:36:"themes/garland/minnelli/minnelli.css";}}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:7:"garland";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:8:"minnelli";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Minnelli', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/themes/settings/pushbutton', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:33:"themes/pushbutton/pushbutton.info";s:4:"name";s:10:"pushbutton";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:10:"Pushbutton";s:11:"description";s:52:"Tabled, multi-column theme in blue and orange tones.";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/pushbutton/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/pushbutton/script.js";}s:10:"screenshot";s:32:"themes/pushbutton/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/pushbutton/style.css";}}s:6:"engine";s:11:"phptemplate";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:10:"pushbutton";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Pushbutton', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/themes/settings/rubik', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":14:{s:8:"filename";s:33:"sites/all/themes/rubik/rubik.info";s:4:"name";s:5:"rubik";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:14:{s:4:"name";s:5:"Rubik";s:11:"description";s:18:"Clean admin theme.";s:10:"base theme";s:3:"tao";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"scripts";a:1:{s:11:"js/rubik.js";s:34:"sites/all/themes/rubik/js/rubik.js";}s:11:"stylesheets";a:1:{s:6:"screen";a:3:{s:8:"core.css";s:31:"sites/all/themes/rubik/core.css";s:9:"icons.css";s:32:"sites/all/themes/rubik/icons.css";s:9:"style.css";s:32:"sites/all/themes/rubik/style.css";}}s:7:"version";s:13:"6.x-3.0-beta3";s:7:"project";s:5:"rubik";s:9:"datestamp";s:10:"1329952845";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:10:"screenshot";s:37:"sites/all/themes/rubik/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:6:"screen";a:3:{s:8:"core.css";s:31:"sites/all/themes/rubik/core.css";s:9:"icons.css";s:32:"sites/all/themes/rubik/icons.css";s:9:"style.css";s:32:"sites/all/themes/rubik/style.css";}}s:7:"scripts";a:1:{s:11:"js/rubik.js";s:34:"sites/all/themes/rubik/js/rubik.js";}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:3:"tao";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:5:"rubik";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Rubik', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/themes/settings/tao', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":13:{s:8:"filename";s:29:"sites/all/themes/tao/tao.info";s:4:"name";s:3:"tao";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"core";s:3:"6.x";s:11:"description";s:149:"Tao is a base theme that is all about going with the flow. It takes care of key reset and utility tasks so that sub-themes can get on with their job.";s:6:"engine";s:11:"phptemplate";s:4:"name";s:3:"Tao";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:7:"scripts";a:1:{s:9:"js/tao.js";s:30:"sites/all/themes/tao/js/tao.js";}s:11:"stylesheets";a:3:{s:6:"screen";a:3:{s:9:"reset.css";s:30:"sites/all/themes/tao/reset.css";s:10:"drupal.css";s:31:"sites/all/themes/tao/drupal.css";s:8:"base.css";s:29:"sites/all/themes/tao/base.css";}s:5:"print";a:3:{s:9:"reset.css";s:30:"sites/all/themes/tao/reset.css";s:8:"base.css";s:29:"sites/all/themes/tao/base.css";s:9:"print.css";s:30:"sites/all/themes/tao/print.css";}s:3:"all";a:20:{s:9:"admin.css";s:30:"sites/all/themes/tao/admin.css";s:9:"block.css";s:30:"sites/all/themes/tao/block.css";s:8:"book.css";s:29:"sites/all/themes/tao/book.css";s:11:"comment.css";s:32:"sites/all/themes/tao/comment.css";s:9:"dblog.css";s:30:"sites/all/themes/tao/dblog.css";s:12:"defaults.css";s:33:"sites/all/themes/tao/defaults.css";s:9:"forum.css";s:30:"sites/all/themes/tao/forum.css";s:8:"help.css";s:29:"sites/all/themes/tao/help.css";s:15:"maintenance.css";s:36:"sites/all/themes/tao/maintenance.css";s:8:"node.css";s:29:"sites/all/themes/tao/node.css";s:10:"openid.css";s:31:"sites/all/themes/tao/openid.css";s:8:"poll.css";s:29:"sites/all/themes/tao/poll.css";s:11:"profile.css";s:32:"sites/all/themes/tao/profile.css";s:10:"search.css";s:31:"sites/all/themes/tao/search.css";s:10:"system.css";s:31:"sites/all/themes/tao/system.css";s:16:"system-menus.css";s:37:"sites/all/themes/tao/system-menus.css";s:12:"taxonomy.css";s:33:"sites/all/themes/tao/taxonomy.css";s:11:"tracker.css";s:32:"sites/all/themes/tao/tracker.css";s:10:"update.css";s:31:"sites/all/themes/tao/update.css";s:8:"user.css";s:29:"sites/all/themes/tao/user.css";}}s:7:"version";s:7:"6.x-3.3";s:7:"project";s:3:"tao";s:9:"datestamp";s:10:"1329952556";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:10:"screenshot";s:35:"sites/all/themes/tao/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:3:{s:6:"screen";a:3:{s:9:"reset.css";s:30:"sites/all/themes/tao/reset.css";s:10:"drupal.css";s:31:"sites/all/themes/tao/drupal.css";s:8:"base.css";s:29:"sites/all/themes/tao/base.css";}s:5:"print";a:3:{s:9:"reset.css";s:30:"sites/all/themes/tao/reset.css";s:8:"base.css";s:29:"sites/all/themes/tao/base.css";s:9:"print.css";s:30:"sites/all/themes/tao/print.css";}s:3:"all";a:20:{s:9:"admin.css";s:30:"sites/all/themes/tao/admin.css";s:9:"block.css";s:30:"sites/all/themes/tao/block.css";s:8:"book.css";s:29:"sites/all/themes/tao/book.css";s:11:"comment.css";s:32:"sites/all/themes/tao/comment.css";s:9:"dblog.css";s:30:"sites/all/themes/tao/dblog.css";s:12:"defaults.css";s:33:"sites/all/themes/tao/defaults.css";s:9:"forum.css";s:30:"sites/all/themes/tao/forum.css";s:8:"help.css";s:29:"sites/all/themes/tao/help.css";s:15:"maintenance.css";s:36:"sites/all/themes/tao/maintenance.css";s:8:"node.css";s:29:"sites/all/themes/tao/node.css";s:10:"openid.css";s:31:"sites/all/themes/tao/openid.css";s:8:"poll.css";s:29:"sites/all/themes/tao/poll.css";s:11:"profile.css";s:32:"sites/all/themes/tao/profile.css";s:10:"search.css";s:31:"sites/all/themes/tao/search.css";s:10:"system.css";s:31:"sites/all/themes/tao/system.css";s:16:"system-menus.css";s:37:"sites/all/themes/tao/system-menus.css";s:12:"taxonomy.css";s:33:"sites/all/themes/tao/taxonomy.css";s:11:"tracker.css";s:32:"sites/all/themes/tao/tracker.css";s:10:"update.css";s:31:"sites/all/themes/tao/update.css";s:8:"user.css";s:29:"sites/all/themes/tao/user.css";}}s:7:"scripts";a:1:{s:9:"js/tao.js";s:30:"sites/all/themes/tao/js/tao.js";}s:6:"engine";s:11:"phptemplate";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:3:"tao";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Tao', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/themes/settings/virdini', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":13:{s:8:"filename";s:37:"sites/all/themes/virdini/virdini.info";s:4:"name";s:7:"virdini";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"1";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:11:{s:4:"name";s:11:"Virdini.com";s:11:"description";s:45:"Theme designed by Virdini.сom for this site.";s:4:"core";s:3:"6.x";s:7:"project";s:7:"virdini";s:6:"engine";s:11:"phptemplate";s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:13:"css/style.css";s:38:"sites/all/themes/virdini/css/style.css";s:19:"css/forms-style.css";s:44:"sites/all/themes/virdini/css/forms-style.css";}}s:7:"scripts";a:1:{s:12:"js/script.js";s:37:"sites/all/themes/virdini/js/script.js";}s:7:"regions";a:8:{s:4:"left";s:11:"Left region";s:9:"main_menu";s:9:"Main menu";s:5:"right";s:12:"Right region";s:7:"content";s:7:"Content";s:6:"header";s:13:"Header region";s:6:"footer";s:13:"Footer region";s:4:"lang";s:9:"Languages";s:6:"search";s:6:"Search";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:10:"screenshot";s:39:"sites/all/themes/virdini/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:13:"css/style.css";s:38:"sites/all/themes/virdini/css/style.css";s:19:"css/forms-style.css";s:44:"sites/all/themes/virdini/css/forms-style.css";}}s:7:"scripts";a:1:{s:12:"js/script.js";s:37:"sites/all/themes/virdini/js/script.js";}s:6:"engine";s:11:"phptemplate";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:7:"virdini";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Virdini.com', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('filefield/ahah/%/%/%', 'a:3:{i:2;N;i:3;N;i:4;N;}', '', 'filefield_edit_access', 'a:2:{i:0;i:2;i:1;i:3;}', 'filefield_js', 'a:3:{i:0;i:2;i:1;i:3;i:2;i:4;}', 24, 5, '', 'filefield/ahah/%/%/%', '', 't', '', 4, '', '', '', 0, ''),
('admin/settings/imageapi/config/imageapi_gd', '', '', 'user_access', 'a:1:{i:0;s:19:"administer imageapi";}', 'drupal_get_form', 'a:1:{i:0;s:25:"imageapi_gd_settings_form";}', 31, 5, 'admin/settings/imageapi/config', 'admin/settings/imageapi', '@name', 't', 'a:1:{s:5:"@name";s:12:"ImageAPI GD2";}', 136, '', '', '', 0, ''),
('admin/build/menu-customize/%/add', 'a:1:{i:3;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:4:{i:0;s:14:"menu_edit_item";i:1;s:3:"add";i:2;N;i:3;i:3;}', 29, 5, 'admin/build/menu-customize/%', 'admin/build/menu-customize/%', 'Add item', 't', '', 128, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/build/block/list/bluemarine', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:33:"themes/bluemarine/bluemarine.info";s:4:"name";s:10:"bluemarine";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:10:"Bluemarine";s:11:"description";s:66:"Table-based multi-column theme with a marine and ash color scheme.";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/bluemarine/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/bluemarine/script.js";}s:10:"screenshot";s:32:"themes/bluemarine/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/bluemarine/style.css";}}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_display', 'a:1:{i:0;s:10:"bluemarine";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Bluemarine', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/build/block/list/chameleon', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":11:{s:8:"filename";s:31:"themes/chameleon/chameleon.info";s:4:"name";s:9:"chameleon";s:4:"type";s:5:"theme";s:5:"owner";s:32:"themes/chameleon/chameleon.theme";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:12:{s:4:"name";s:9:"Chameleon";s:11:"description";s:42:"Minimalist tabled theme with light colors.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:8:"features";a:4:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";}s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:9:"style.css";s:26:"themes/chameleon/style.css";s:10:"common.css";s:27:"themes/chameleon/common.css";}}s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:7:"scripts";a:1:{s:9:"script.js";s:26:"themes/chameleon/script.js";}s:10:"screenshot";s:31:"themes/chameleon/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:9:"style.css";s:26:"themes/chameleon/style.css";s:10:"common.css";s:27:"themes/chameleon/common.css";}}}}', 'block_admin_display', 'a:1:{i:0;s:9:"chameleon";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Chameleon', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/settings/filters/%/configure', 'a:1:{i:3;s:18:"filter_format_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'filter_admin_configure_page', 'a:1:{i:0;i:3;}', 29, 5, 'admin/settings/filters/%', 'admin/settings/filters/%', 'Configure', 't', '', 128, '', '', '', 1, 'modules/filter/filter.admin.inc'),
('admin/settings/language/delete/%', 'a:1:{i:4;N;}', '', 'user_access', 'a:1:{i:0;s:20:"administer languages";}', 'locale_inc_callback', 'a:3:{i:0;s:15:"drupal_get_form";i:1;s:28:"locale_languages_delete_form";i:2;i:4;}', 30, 5, '', 'admin/settings/language/delete/%', 'Confirm', 't', '', 4, '', '', '', 0, ''),
('admin/build/block/list/cube', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":13:{s:8:"filename";s:37:"sites/all/themes/rubik/cube/cube.info";s:4:"name";s:4:"cube";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:16:{s:4:"name";s:4:"Cube";s:11:"description";s:44:"Spaces-aware front-end theme based on Rubik.";s:10:"base theme";s:5:"rubik";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:11:"stylesheets";a:1:{s:6:"screen";a:1:{s:9:"style.css";s:37:"sites/all/themes/rubik/cube/style.css";}}s:7:"regions";a:4:{s:6:"header";s:6:"Header";s:7:"content";s:7:"Content";s:4:"left";s:4:"Left";s:5:"right";s:5:"Right";}s:9:"designkit";a:2:{s:5:"color";a:1:{s:10:"background";s:7:"#0088cc";}s:4:"logo";a:2:{s:4:"logo";s:23:"imagecache_scale:200x50";s:5:"print";s:24:"imagecache_scale:600x150";}}s:7:"layouts";a:5:{s:7:"default";a:3:{s:4:"name";s:7:"Default";s:11:"description";s:23:"Simple one column page.";s:8:"template";s:4:"page";}s:7:"sidebar";a:5:{s:4:"name";s:7:"Sidebar";s:11:"description";s:26:"Main content with sidebar.";s:10:"stylesheet";s:18:"layout-sidebar.css";s:8:"template";s:14:"layout-sidebar";s:7:"regions";a:2:{i:0;s:7:"content";i:1;s:5:"right";}}s:5:"split";a:5:{s:4:"name";s:5:"Split";s:11:"description";s:12:"50/50 split.";s:10:"stylesheet";s:16:"layout-split.css";s:8:"template";s:14:"layout-sidebar";s:7:"regions";a:2:{i:0;s:7:"content";i:1;s:5:"right";}}s:7:"columns";a:5:{s:4:"name";s:7:"Columns";s:11:"description";s:20:"Three column layout.";s:10:"stylesheet";s:18:"layout-columns.css";s:8:"template";s:14:"layout-columns";s:7:"regions";a:4:{i:0;s:6:"header";i:1;s:7:"content";i:2;s:4:"left";i:3;s:5:"right";}}s:6:"offset";a:5:{s:4:"name";s:15:"Offset sidebars";s:11:"description";s:38:"Main content with two offset sidebars.";s:10:"stylesheet";s:17:"layout-offset.css";s:8:"template";s:13:"layout-offset";s:7:"regions";a:4:{i:0;s:6:"header";i:1;s:7:"content";i:2;s:4:"left";i:3;s:5:"right";}}}s:7:"version";s:13:"6.x-3.0-beta3";s:7:"project";s:5:"rubik";s:9:"datestamp";s:10:"1329952845";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:37:"sites/all/themes/rubik/cube/script.js";}s:10:"screenshot";s:42:"sites/all/themes/rubik/cube/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:6:"screen";a:1:{s:9:"style.css";s:37:"sites/all/themes/rubik/cube/style.css";}}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:5:"rubik";}}', 'block_admin_display', 'a:1:{i:0;s:4:"cube";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Cube', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/content/nodewords/meta-tags/custom', '', '', 'user_access', 'a:1:{i:0;s:20:"administer meta tags";}', 'drupal_get_form', 'a:1:{i:0;s:31:"nodewords_custom_pages_overview";}', 31, 5, 'admin/content/nodewords/meta-tags', 'admin/content/nodewords', 'Custom pages', 't', '', 128, '', '', '', 20, 'sites/all/modules/nodewords/nodewords.admin.inc'),
('admin/content/node-type/page/delete', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:24:"node_type_delete_confirm";i:1;O:8:"stdClass":14:{s:4:"type";s:4:"page";s:4:"name";s:4:"Page";s:6:"module";s:4:"node";s:11:"description";s:296:"A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an "About us" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site''s initial home page.";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:4:"page";}}', 31, 5, '', 'admin/content/node-type/page/delete', 'Delete', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/build/translate/delete/%', 'a:1:{i:4;N;}', '', 'user_access', 'a:1:{i:0;s:19:"translate interface";}', 'locale_inc_callback', 'a:2:{i:0;s:28:"locale_translate_delete_page";i:1;i:4;}', 30, 5, '', 'admin/build/translate/delete/%', 'Delete string', 't', '', 4, '', '', '', 0, ''),
('admin/content/node-type/page/display', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:29:"content_display_overview_form";i:1;s:4:"page";}', 31, 5, 'admin/content/node-type/page', 'admin/content/node-type/page', 'Display fields', 't', '', 128, '', '', '', 2, 'sites/all/modules/cck/includes/content.admin.inc'),
('admin/settings/language/edit/%', 'a:1:{i:4;N;}', '', 'user_access', 'a:1:{i:0;s:20:"administer languages";}', 'locale_inc_callback', 'a:3:{i:0;s:15:"drupal_get_form";i:1;s:26:"locale_languages_edit_form";i:2;i:4;}', 30, 5, '', 'admin/settings/language/edit/%', 'Edit language', 't', '', 4, '', '', '', 0, ''),
('admin/build/menu-customize/%/edit', 'a:1:{i:3;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:3:{i:0;s:14:"menu_edit_menu";i:1;s:4:"edit";i:2;i:3;}', 29, 5, 'admin/build/menu-customize/%', 'admin/build/menu-customize/%', 'Edit menu', 't', '', 128, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/build/translate/edit/%', 'a:1:{i:4;N;}', '', 'user_access', 'a:1:{i:0;s:19:"translate interface";}', 'locale_inc_callback', 'a:3:{i:0;s:15:"drupal_get_form";i:1;s:26:"locale_translate_edit_form";i:2;i:4;}', 30, 5, '', 'admin/build/translate/edit/%', 'Edit string', 't', '', 4, '', '', '', 0, ''),
('admin/content/taxonomy/edit/term', '', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'taxonomy_admin_term_edit', 'a:0:{}', 31, 5, '', 'admin/content/taxonomy/edit/term', 'Edit term', 't', '', 4, '', '', '', 0, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/content/nodewords/meta-tags/errorpage_403', '', '', 'user_access', 'a:1:{i:0;s:20:"administer meta tags";}', 'drupal_get_form', 'a:3:{i:0;s:19:"nodewords_tags_form";i:1;s:1:"2";i:2;s:3:"403";}', 31, 5, 'admin/content/nodewords/meta-tags', 'admin/content/nodewords', 'Error 403 page', 't', '', 128, '', '', '', -7, 'sites/all/modules/nodewords/nodewords.admin.inc'),
('admin/content/nodewords/meta-tags/errorpage_404', '', '', 'user_access', 'a:1:{i:0;s:20:"administer meta tags";}', 'drupal_get_form', 'a:3:{i:0;s:19:"nodewords_tags_form";i:1;s:1:"2";i:2;s:3:"404";}', 31, 5, 'admin/content/nodewords/meta-tags', 'admin/content/nodewords', 'Error 404 page', 't', '', 128, '', '', '', -6, 'sites/all/modules/nodewords/nodewords.admin.inc'),
('admin/content/nodewords/meta-tags/frontpage', '', '', 'user_access', 'a:1:{i:0;s:20:"administer meta tags";}', 'drupal_get_form', 'a:2:{i:0;s:19:"nodewords_tags_form";i:1;s:1:"3";}', 31, 5, 'admin/content/nodewords/meta-tags', 'admin/content/nodewords', 'Front page', 't', '', 128, '', '', '', -9, 'sites/all/modules/nodewords/nodewords.admin.inc'),
('admin/build/block/list/garland', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:27:"themes/garland/garland.info";s:4:"name";s:7:"garland";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:7:"Garland";s:11:"description";s:66:"Tableless, recolorable, multi-column, fluid width theme (default).";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:24:"themes/garland/script.js";}s:10:"screenshot";s:29:"themes/garland/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_display', 'a:1:{i:0;s:7:"garland";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Garland', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/build/block/list/js', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'block_admin_display_js', 'a:0:{}', 31, 5, '', 'admin/build/block/list/js', 'JavaScript List Form', 't', '', 4, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/content/node-type/page/fields', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:27:"content_field_overview_form";i:1;s:4:"page";}', 31, 5, 'admin/content/node-type/page', 'admin/content/node-type/page', 'Manage fields', 't', '', 128, '', '', '', 1, 'sites/all/modules/cck/includes/content.admin.inc'),
('admin/content/node-type/page/form', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:31:"nodeformcols_configuration_form";i:1;s:4:"page";i:2;i:5;}', 31, 5, 'admin/content/node-type/page', 'admin/content/node-type/page', 'Manage form', 't', '', 128, '', '', '', 3, 'sites/all/modules/nodeformcols/nodeformcols.admin.inc'),
('admin/build/block/list/marvin', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:35:"themes/chameleon/marvin/marvin.info";s:4:"name";s:6:"marvin";s:4:"type";s:5:"theme";s:5:"owner";s:0:"";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:6:"Marvin";s:11:"description";s:31:"Boxy tabled theme in all grays.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:10:"base theme";s:9:"chameleon";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:33:"themes/chameleon/marvin/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/chameleon/marvin/script.js";}s:10:"screenshot";s:38:"themes/chameleon/marvin/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:33:"themes/chameleon/marvin/style.css";}}s:10:"base_theme";s:9:"chameleon";}}', 'block_admin_display', 'a:1:{i:0;s:6:"marvin";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Marvin', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/build/block/list/minnelli', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":13:{s:8:"filename";s:37:"themes/garland/minnelli/minnelli.info";s:4:"name";s:8:"minnelli";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:14:{s:4:"name";s:8:"Minnelli";s:11:"description";s:56:"Tableless, recolorable, multi-column, fixed width theme.";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:10:"base theme";s:7:"garland";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:12:"minnelli.css";s:36:"themes/garland/minnelli/minnelli.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/garland/minnelli/script.js";}s:10:"screenshot";s:38:"themes/garland/minnelli/screenshot.png";s:3:"php";s:5:"4.3.5";s:6:"engine";s:11:"phptemplate";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:12:"minnelli.css";s:36:"themes/garland/minnelli/minnelli.css";}}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:7:"garland";}}', 'block_admin_display', 'a:1:{i:0;s:8:"minnelli";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Minnelli', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/build/block/list/pushbutton', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:33:"themes/pushbutton/pushbutton.info";s:4:"name";s:10:"pushbutton";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:10:"Pushbutton";s:11:"description";s:52:"Tabled, multi-column theme in blue and orange tones.";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/pushbutton/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/pushbutton/script.js";}s:10:"screenshot";s:32:"themes/pushbutton/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/pushbutton/style.css";}}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_display', 'a:1:{i:0;s:10:"pushbutton";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Pushbutton', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/settings/filters/%/order', 'a:1:{i:3;s:18:"filter_format_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'filter_admin_order_page', 'a:1:{i:0;i:3;}', 29, 5, 'admin/settings/filters/%', 'admin/settings/filters/%', 'Rearrange', 't', '', 128, '', '', '', 2, 'modules/filter/filter.admin.inc'),
('user/reset/%/%/%', 'a:3:{i:2;N;i:3;N;i:4;N;}', '', '1', 'a:0:{}', 'drupal_get_form', 'a:4:{i:0;s:15:"user_pass_reset";i:1;i:2;i:2;i:3;i:3;i:4;}', 24, 5, '', 'user/reset/%/%/%', 'Reset password', 't', '', 4, '', '', '', 0, 'modules/user/user.pages.inc'),
('admin/build/block/list/rubik', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":14:{s:8:"filename";s:33:"sites/all/themes/rubik/rubik.info";s:4:"name";s:5:"rubik";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:14:{s:4:"name";s:5:"Rubik";s:11:"description";s:18:"Clean admin theme.";s:10:"base theme";s:3:"tao";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"scripts";a:1:{s:11:"js/rubik.js";s:34:"sites/all/themes/rubik/js/rubik.js";}s:11:"stylesheets";a:1:{s:6:"screen";a:3:{s:8:"core.css";s:31:"sites/all/themes/rubik/core.css";s:9:"icons.css";s:32:"sites/all/themes/rubik/icons.css";s:9:"style.css";s:32:"sites/all/themes/rubik/style.css";}}s:7:"version";s:13:"6.x-3.0-beta3";s:7:"project";s:5:"rubik";s:9:"datestamp";s:10:"1329952845";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:10:"screenshot";s:37:"sites/all/themes/rubik/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:6:"screen";a:3:{s:8:"core.css";s:31:"sites/all/themes/rubik/core.css";s:9:"icons.css";s:32:"sites/all/themes/rubik/icons.css";s:9:"style.css";s:32:"sites/all/themes/rubik/style.css";}}s:7:"scripts";a:1:{s:11:"js/rubik.js";s:34:"sites/all/themes/rubik/js/rubik.js";}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:3:"tao";}}', 'block_admin_display', 'a:1:{i:0;s:5:"rubik";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Rubik', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/content/nodewords/meta-tags/offline', '', '', 'user_access', 'a:1:{i:0;s:20:"administer meta tags";}', 'drupal_get_form', 'a:2:{i:0;s:19:"nodewords_tags_form";i:1;s:2:"11";}', 31, 5, 'admin/content/nodewords/meta-tags', 'admin/content/nodewords', 'Site off-line page', 't', '', 128, '', '', '', -8, 'sites/all/modules/nodewords/nodewords.admin.inc');
INSERT INTO `menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES
('admin/build/block/list/tao', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":13:{s:8:"filename";s:29:"sites/all/themes/tao/tao.info";s:4:"name";s:3:"tao";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"core";s:3:"6.x";s:11:"description";s:149:"Tao is a base theme that is all about going with the flow. It takes care of key reset and utility tasks so that sub-themes can get on with their job.";s:6:"engine";s:11:"phptemplate";s:4:"name";s:3:"Tao";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:7:"scripts";a:1:{s:9:"js/tao.js";s:30:"sites/all/themes/tao/js/tao.js";}s:11:"stylesheets";a:3:{s:6:"screen";a:3:{s:9:"reset.css";s:30:"sites/all/themes/tao/reset.css";s:10:"drupal.css";s:31:"sites/all/themes/tao/drupal.css";s:8:"base.css";s:29:"sites/all/themes/tao/base.css";}s:5:"print";a:3:{s:9:"reset.css";s:30:"sites/all/themes/tao/reset.css";s:8:"base.css";s:29:"sites/all/themes/tao/base.css";s:9:"print.css";s:30:"sites/all/themes/tao/print.css";}s:3:"all";a:20:{s:9:"admin.css";s:30:"sites/all/themes/tao/admin.css";s:9:"block.css";s:30:"sites/all/themes/tao/block.css";s:8:"book.css";s:29:"sites/all/themes/tao/book.css";s:11:"comment.css";s:32:"sites/all/themes/tao/comment.css";s:9:"dblog.css";s:30:"sites/all/themes/tao/dblog.css";s:12:"defaults.css";s:33:"sites/all/themes/tao/defaults.css";s:9:"forum.css";s:30:"sites/all/themes/tao/forum.css";s:8:"help.css";s:29:"sites/all/themes/tao/help.css";s:15:"maintenance.css";s:36:"sites/all/themes/tao/maintenance.css";s:8:"node.css";s:29:"sites/all/themes/tao/node.css";s:10:"openid.css";s:31:"sites/all/themes/tao/openid.css";s:8:"poll.css";s:29:"sites/all/themes/tao/poll.css";s:11:"profile.css";s:32:"sites/all/themes/tao/profile.css";s:10:"search.css";s:31:"sites/all/themes/tao/search.css";s:10:"system.css";s:31:"sites/all/themes/tao/system.css";s:16:"system-menus.css";s:37:"sites/all/themes/tao/system-menus.css";s:12:"taxonomy.css";s:33:"sites/all/themes/tao/taxonomy.css";s:11:"tracker.css";s:32:"sites/all/themes/tao/tracker.css";s:10:"update.css";s:31:"sites/all/themes/tao/update.css";s:8:"user.css";s:29:"sites/all/themes/tao/user.css";}}s:7:"version";s:7:"6.x-3.3";s:7:"project";s:3:"tao";s:9:"datestamp";s:10:"1329952556";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:10:"screenshot";s:35:"sites/all/themes/tao/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:3:{s:6:"screen";a:3:{s:9:"reset.css";s:30:"sites/all/themes/tao/reset.css";s:10:"drupal.css";s:31:"sites/all/themes/tao/drupal.css";s:8:"base.css";s:29:"sites/all/themes/tao/base.css";}s:5:"print";a:3:{s:9:"reset.css";s:30:"sites/all/themes/tao/reset.css";s:8:"base.css";s:29:"sites/all/themes/tao/base.css";s:9:"print.css";s:30:"sites/all/themes/tao/print.css";}s:3:"all";a:20:{s:9:"admin.css";s:30:"sites/all/themes/tao/admin.css";s:9:"block.css";s:30:"sites/all/themes/tao/block.css";s:8:"book.css";s:29:"sites/all/themes/tao/book.css";s:11:"comment.css";s:32:"sites/all/themes/tao/comment.css";s:9:"dblog.css";s:30:"sites/all/themes/tao/dblog.css";s:12:"defaults.css";s:33:"sites/all/themes/tao/defaults.css";s:9:"forum.css";s:30:"sites/all/themes/tao/forum.css";s:8:"help.css";s:29:"sites/all/themes/tao/help.css";s:15:"maintenance.css";s:36:"sites/all/themes/tao/maintenance.css";s:8:"node.css";s:29:"sites/all/themes/tao/node.css";s:10:"openid.css";s:31:"sites/all/themes/tao/openid.css";s:8:"poll.css";s:29:"sites/all/themes/tao/poll.css";s:11:"profile.css";s:32:"sites/all/themes/tao/profile.css";s:10:"search.css";s:31:"sites/all/themes/tao/search.css";s:10:"system.css";s:31:"sites/all/themes/tao/system.css";s:16:"system-menus.css";s:37:"sites/all/themes/tao/system-menus.css";s:12:"taxonomy.css";s:33:"sites/all/themes/tao/taxonomy.css";s:11:"tracker.css";s:32:"sites/all/themes/tao/tracker.css";s:10:"update.css";s:31:"sites/all/themes/tao/update.css";s:8:"user.css";s:29:"sites/all/themes/tao/user.css";}}s:7:"scripts";a:1:{s:9:"js/tao.js";s:30:"sites/all/themes/tao/js/tao.js";}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_display', 'a:1:{i:0;s:3:"tao";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Tao', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/build/block/list/virdini', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":13:{s:8:"filename";s:37:"sites/all/themes/virdini/virdini.info";s:4:"name";s:7:"virdini";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"1";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:11:{s:4:"name";s:11:"Virdini.com";s:11:"description";s:45:"Theme designed by Virdini.сom for this site.";s:4:"core";s:3:"6.x";s:7:"project";s:7:"virdini";s:6:"engine";s:11:"phptemplate";s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:13:"css/style.css";s:38:"sites/all/themes/virdini/css/style.css";s:19:"css/forms-style.css";s:44:"sites/all/themes/virdini/css/forms-style.css";}}s:7:"scripts";a:1:{s:12:"js/script.js";s:37:"sites/all/themes/virdini/js/script.js";}s:7:"regions";a:8:{s:4:"left";s:11:"Left region";s:9:"main_menu";s:9:"Main menu";s:5:"right";s:12:"Right region";s:7:"content";s:7:"Content";s:6:"header";s:13:"Header region";s:6:"footer";s:13:"Footer region";s:4:"lang";s:9:"Languages";s:6:"search";s:6:"Search";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:10:"screenshot";s:39:"sites/all/themes/virdini/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:13:"css/style.css";s:38:"sites/all/themes/virdini/css/style.css";s:19:"css/forms-style.css";s:44:"sites/all/themes/virdini/css/forms-style.css";}}s:7:"scripts";a:1:{s:12:"js/script.js";s:37:"sites/all/themes/virdini/js/script.js";}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_display', 'a:1:{i:0;s:7:"virdini";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Virdini.com', 't', '', 136, '', '', '', -10, 'modules/block/block.admin.inc'),
('admin/views/ajax/autocomplete/tag', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_autocomplete_tag', 'a:0:{}', 31, 5, '', 'admin/views/ajax/autocomplete/tag', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/content/taxonomy/add/vocabulary', '', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:1:{i:0;s:24:"taxonomy_form_vocabulary";}', 31, 5, 'admin/content/taxonomy', 'admin/content/taxonomy', 'Add vocabulary', 't', '', 128, '', '', '', 0, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/build/views/tools/basic', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'drupal_get_form', 'a:1:{i:0;s:20:"views_ui_admin_tools";}', 31, 5, 'admin/build/views/tools', 'admin/build/views', 'Basic', 't', '', 136, '', '', '', -10, 'sites/all/modules/views/includes/admin.inc'),
('admin/views/ajax/autocomplete/user', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'views_ajax_autocomplete_user', 'a:0:{}', 31, 5, '', 'admin/views/ajax/autocomplete/user', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/ajax.inc'),
('admin/build/views/tools/convert', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_admin_convert', 'a:0:{}', 31, 5, 'admin/build/views/tools', 'admin/build/views', 'Convert', 't', '', 128, '', 'Convert stored Views 1 views.', '', 1, 'sites/all/modules/views/includes/convert.inc'),
('admin/settings/actions/delete/%', 'a:1:{i:4;s:12:"actions_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'drupal_get_form', 'a:2:{i:0;s:26:"system_actions_delete_form";i:1;i:4;}', 30, 5, '', 'admin/settings/actions/delete/%', 'Delete action', 't', '', 4, '', 'Delete an action.', '', 0, ''),
('admin/build/menu-customize/%/delete', 'a:1:{i:3;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'menu_delete_menu_page', 'a:1:{i:0;i:3;}', 29, 5, '', 'admin/build/menu-customize/%/delete', 'Delete menu', 't', '', 4, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/build/views/edit/%', 'a:1:{i:4;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_edit_page', 'a:1:{i:0;i:4;}', 30, 5, 'admin/build/views', 'admin/build/views', 'Edit', 't', '', 128, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('node/%/revisions/%/view', 'a:2:{i:1;a:1:{s:9:"node_load";a:1:{i:0;i:3;}}i:3;N;}', '', '_node_revision_access', 'a:1:{i:0;i:1;}', 'node_show', 'a:3:{i:0;i:1;i:1;N;i:2;b:1;}', 21, 5, '', 'node/%/revisions/%/view', 'Revisions', 't', '', 4, '', '', '', 0, ''),
('node/%/revisions/%/delete', 'a:2:{i:1;a:1:{s:9:"node_load";a:1:{i:0;i:3;}}i:3;N;}', '', '_node_revision_access', 'a:2:{i:0;i:1;i:1;s:6:"delete";}', 'drupal_get_form', 'a:2:{i:0;s:28:"node_revision_delete_confirm";i:1;i:1;}', 21, 5, '', 'node/%/revisions/%/delete', 'Delete earlier revision', 't', '', 4, '', '', '', 0, 'modules/node/node.pages.inc'),
('admin/build/views/break-lock/%', 'a:1:{i:4;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'drupal_get_form', 'a:2:{i:0;s:27:"views_ui_break_lock_confirm";i:1;i:4;}', 30, 5, '', 'admin/build/views/break-lock/%', 'Delete view', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/build/views/delete/%', 'a:1:{i:4;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'drupal_get_form', 'a:2:{i:0;s:23:"views_ui_delete_confirm";i:1;i:4;}', 30, 5, '', 'admin/build/views/delete/%', 'Delete view', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('node/%/revisions/%/revert', 'a:2:{i:1;a:1:{s:9:"node_load";a:1:{i:0;i:3;}}i:3;N;}', '', '_node_revision_access', 'a:2:{i:0;i:1;i:1;s:6:"update";}', 'drupal_get_form', 'a:2:{i:0;s:28:"node_revision_revert_confirm";i:1;i:1;}', 21, 5, '', 'node/%/revisions/%/revert', 'Revert to earlier revision', 't', '', 4, '', '', '', 0, 'modules/node/node.pages.inc'),
('admin/build/views/export/%', 'a:1:{i:4;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'drupal_get_form', 'a:2:{i:0;s:20:"views_ui_export_page";i:1;i:4;}', 30, 5, '', 'admin/build/views/export/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/build/views/clone/%', 'a:1:{i:4;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_clone_page', 'a:1:{i:0;i:4;}', 30, 5, '', 'admin/build/views/clone/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/build/views/disable/%', 'a:1:{i:4;s:21:"views_ui_default_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_disable_page', 'a:1:{i:0;i:4;}', 30, 5, '', 'admin/build/views/disable/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/build/views/enable/%', 'a:1:{i:4;s:21:"views_ui_default_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_enable_page', 'a:1:{i:0;i:4;}', 30, 5, '', 'admin/build/views/enable/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/build/imagecache/%/delete', 'a:1:{i:3;s:25:"imagecache_ui_preset_load";}', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'drupal_get_form', 'a:2:{i:0;s:32:"imagecache_ui_preset_delete_form";i:1;i:3;}', 29, 5, '', 'admin/build/imagecache/%/delete', '', 'imagecache_preset_title_callback', 'a:2:{i:0;s:26:"Delete preset: !presetname";i:1;i:3;}', 4, '', '', '', 0, 'sites/all/modules/imagecache/imagecache_ui.pages.inc'),
('admin/build/imagecache/%/export', 'a:1:{i:3;s:25:"imagecache_ui_preset_load";}', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'drupal_get_form', 'a:2:{i:0;s:32:"imagecache_ui_preset_export_form";i:1;i:3;}', 29, 5, '', 'admin/build/imagecache/%/export', '', 'imagecache_preset_title_callback', 'a:2:{i:0;s:26:"Export preset: !presetname";i:1;i:3;}', 4, '', '', '', 0, 'sites/all/modules/imagecache/imagecache_ui.pages.inc'),
('admin/build/imagecache/%/flush', 'a:1:{i:3;s:25:"imagecache_ui_preset_load";}', '', 'user_access', 'a:1:{i:0;s:16:"flush imagecache";}', 'drupal_get_form', 'a:2:{i:0;s:31:"imagecache_ui_preset_flush_form";i:1;i:3;}', 29, 5, '', 'admin/build/imagecache/%/flush', '', 'imagecache_preset_title_callback', 'a:2:{i:0;s:25:"Flush preset: !presetname";i:1;i:3;}', 4, '', '', '', 0, 'sites/all/modules/imagecache/imagecache_ui.pages.inc'),
('admin/build/imagecache/%/override', 'a:1:{i:3;s:25:"imagecache_ui_preset_load";}', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'drupal_get_form', 'a:3:{i:0;s:25:"imagecache_ui_preset_form";i:1;i:3;i:2;b:1;}', 29, 5, '', 'admin/build/imagecache/%/override', '', 'imagecache_preset_title_callback', 'a:2:{i:0;s:28:"Override preset: !presetname";i:1;i:3;}', 4, '', '', '', 0, 'sites/all/modules/imagecache/imagecache_ui.pages.inc'),
('admin/build/imagecache/%/%', 'a:2:{i:3;s:25:"imagecache_ui_preset_load";i:4;s:22:"imagecache_action_load";}', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'drupal_get_form', 'a:3:{i:0;s:25:"imagecache_ui_action_form";i:1;i:3;i:2;i:4;}', 28, 5, '', 'admin/build/imagecache/%/%', '', 'imagecache_preset_title_callback', 'a:3:{i:0;s:30:"!action for preset !presetname";i:1;i:3;i:2;i:4;}', 4, '', '', '', 0, 'sites/all/modules/imagecache/imagecache_ui.pages.inc'),
('admin/content/node-type/page/display/basic', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:29:"content_display_overview_form";i:1;s:4:"page";i:2;s:5:"basic";}', 63, 6, 'admin/content/node-type/page/display', 'admin/content/node-type/page', 'Basic', 't', '', 136, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc'),
('admin/content/node-type/page/display/rss', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:29:"content_display_overview_form";i:1;s:4:"page";i:2;s:3:"rss";}', 63, 6, 'admin/content/node-type/page/display', 'admin/content/node-type/page', 'RSS', 't', '', 128, '', '', '', 1, 'sites/all/modules/cck/includes/content.admin.inc'),
('admin/content/node-type/page/display/token', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:29:"content_display_overview_form";i:1;s:4:"page";i:2;s:5:"token";}', 63, 6, 'admin/content/node-type/page/display', 'admin/content/node-type/page', 'Token', 't', '', 128, '', '', '', 1, 'sites/all/modules/cck/includes/content.admin.inc'),
('admin/content/nodewords/meta-tags/custom/add', '', '', 'user_access', 'a:1:{i:0;s:20:"administer meta tags";}', 'drupal_get_form', 'a:1:{i:0;s:27:"nodewords_custom_pages_edit";}', 63, 6, '', 'admin/content/nodewords/meta-tags/custom/add', 'Add custom pages meta tags', 't', '', 4, '', '', '', 0, 'sites/all/modules/nodewords/nodewords.admin.inc'),
('admin/content/taxonomy/%/add/term', 'a:1:{i:3;s:24:"taxonomy_vocabulary_load";}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'taxonomy_add_term_page', 'a:1:{i:0;i:3;}', 59, 6, 'admin/content/taxonomy/%', 'admin/content/taxonomy/%', 'Add term', 't', '', 128, '', '', '', 0, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/build/menu/item/%/delete', 'a:1:{i:4;s:14:"menu_link_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'menu_item_delete_page', 'a:1:{i:0;i:4;}', 61, 6, '', 'admin/build/menu/item/%/delete', 'Delete menu item', 't', '', 4, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/build/menu/item/%/edit', 'a:1:{i:4;s:14:"menu_link_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:4:{i:0;s:14:"menu_edit_item";i:1;s:4:"edit";i:2;i:4;i:3;N;}', 61, 6, '', 'admin/build/menu/item/%/edit', 'Edit menu item', 't', '', 4, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/content/taxonomy/edit/vocabulary/%', 'a:1:{i:5;s:24:"taxonomy_vocabulary_load";}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'taxonomy_admin_vocabulary_edit', 'a:1:{i:0;i:5;}', 62, 6, '', 'admin/content/taxonomy/edit/vocabulary/%', 'Edit vocabulary', 't', '', 4, '', '', '', 0, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/build/menu/item/%/reset', 'a:1:{i:4;s:14:"menu_link_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:2:{i:0;s:23:"menu_reset_item_confirm";i:1;i:4;}', 61, 6, '', 'admin/build/menu/item/%/reset', 'Reset menu item', 't', '', 4, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/build/views/%/add-display/%', 'a:2:{i:3;s:16:"views_ui_js_load";i:5;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_add_display', 'a:2:{i:0;i:3;i:1;i:5;}', 58, 6, '', 'admin/build/views/%/add-display/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/settings/wysiwyg/profile/%/edit', 'a:1:{i:4;s:20:"wysiwyg_profile_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'drupal_get_form', 'a:2:{i:0;s:20:"wysiwyg_profile_form";i:1;i:4;}', 61, 6, 'admin/settings/wysiwyg/profile/%wysiwyg_profile', 'admin/settings/wysiwyg/profile', 'Edit', 't', '', 128, '', '', '', 0, 'sites/all/modules/wysiwyg/wysiwyg.admin.inc'),
('admin/build/views/%/analyze/%', 'a:2:{i:3;s:16:"views_ui_js_load";i:5;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_analyze_view', 'a:2:{i:0;i:3;i:1;i:5;}', 58, 6, '', 'admin/build/views/%/analyze/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/build/views/%/clone-display/%', 'a:2:{i:3;s:16:"views_ui_js_load";i:5;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_clone_display', 'a:3:{i:0;i:3;i:1;i:5;i:2;i:6;}', 58, 6, '', 'admin/build/views/%/clone-display/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/settings/wysiwyg/profile/%/delete', 'a:1:{i:4;s:20:"wysiwyg_profile_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'drupal_get_form', 'a:2:{i:0;s:30:"wysiwyg_profile_delete_confirm";i:1;i:4;}', 61, 6, 'admin/settings/wysiwyg/profile/%wysiwyg_profile', 'admin/settings/wysiwyg/profile', 'Remove', 't', '', 128, '', '', '', 10, 'sites/all/modules/wysiwyg/wysiwyg.admin.inc'),
('admin/build/views/%/%/%', 'a:3:{i:3;s:16:"views_ui_js_load";i:4;N;i:5;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_ajax_form', 'a:3:{i:0;i:3;i:1;i:4;i:2;i:5;}', 56, 6, '', 'admin/build/views/%/%/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/build/views/%/details/%', 'a:2:{i:3;s:16:"views_ui_js_load";i:5;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_edit_details', 'a:2:{i:0;i:3;i:1;i:5;}', 58, 6, '', 'admin/build/views/%/details/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/build/views/%/preview/%', 'a:2:{i:3;s:16:"views_ui_js_load";i:5;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_preview', 'a:2:{i:0;i:3;i:1;i:5;}', 58, 6, '', 'admin/build/views/%/preview/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/build/imagecache/%/add/%', 'a:2:{i:3;s:25:"imagecache_ui_preset_load";i:5;N;}', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'imagecache_ui_action_add_page', 'a:2:{i:0;i:3;i:1;i:5;}', 58, 6, '', 'admin/build/imagecache/%/add/%', '', 'imagecache_preset_title_callback', 'a:3:{i:0;s:30:"Add !actionname to !presetname";i:1;i:3;i:2;i:5;}', 4, '', '', '', 0, 'sites/all/modules/imagecache/imagecache_ui.pages.inc'),
('admin/build/imagecache/%/%/delete', 'a:2:{i:3;s:25:"imagecache_ui_preset_load";i:4;s:22:"imagecache_action_load";}', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'drupal_get_form', 'a:3:{i:0;s:32:"imagecache_ui_action_delete_form";i:1;i:3;i:2;i:4;}', 57, 6, '', 'admin/build/imagecache/%/%/delete', '', 'imagecache_preset_title_callback', 'a:3:{i:0;s:37:"Delete !action for preset !presetname";i:1;i:3;i:2;i:4;}', 4, '', '', '', 0, 'sites/all/modules/imagecache/imagecache_ui.pages.inc'),
('admin/content/nodewords/meta-tags/custom/%/delete', 'a:1:{i:5;s:19:"nodewords_page_load";}', '', 'user_access', 'a:1:{i:0;s:20:"administer meta tags";}', 'drupal_get_form', 'a:2:{i:0;s:37:"nodewords_custom_pages_confirm_delete";i:1;i:5;}', 125, 7, '', 'admin/content/nodewords/meta-tags/custom/%/delete', 'Delete custom pages meta tags', 't', '', 4, '', '', '', 0, 'sites/all/modules/nodewords/nodewords.admin.inc'),
('admin/content/nodewords/meta-tags/custom/%/edit', 'a:1:{i:5;s:19:"nodewords_page_load";}', '', 'user_access', 'a:1:{i:0;s:20:"administer meta tags";}', 'drupal_get_form', 'a:2:{i:0;s:27:"nodewords_custom_pages_edit";i:1;i:5;}', 125, 7, '', 'admin/content/nodewords/meta-tags/custom/%/edit', 'Edit custom pages meta tags', 't', '', 4, '', '', '', 0, 'sites/all/modules/nodewords/nodewords.admin.inc');

-- --------------------------------------------------------

--
-- Table structure for table `node`
--

CREATE TABLE IF NOT EXISTS `node` (
  `nid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT '',
  `language` varchar(12) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `uid` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created` int(11) NOT NULL DEFAULT '0',
  `changed` int(11) NOT NULL DEFAULT '0',
  `comment` int(11) NOT NULL DEFAULT '0',
  `promote` int(11) NOT NULL DEFAULT '0',
  `moderate` int(11) NOT NULL DEFAULT '0',
  `sticky` int(11) NOT NULL DEFAULT '0',
  `tnid` int(10) unsigned NOT NULL DEFAULT '0',
  `translate` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`),
  UNIQUE KEY `vid` (`vid`),
  KEY `node_changed` (`changed`),
  KEY `node_created` (`created`),
  KEY `node_moderate` (`moderate`),
  KEY `node_promote_status` (`promote`,`status`),
  KEY `node_status_type` (`status`,`type`,`nid`),
  KEY `node_title_type` (`title`,`type`(4)),
  KEY `node_type` (`type`(4)),
  KEY `uid` (`uid`),
  KEY `tnid` (`tnid`),
  KEY `translate` (`translate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nodewords`
--

CREATE TABLE IF NOT EXISTS `nodewords` (
  `mtid` int(11) NOT NULL AUTO_INCREMENT,
  `type` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL DEFAULT '',
  `content` longtext NOT NULL,
  PRIMARY KEY (`mtid`),
  UNIQUE KEY `nodewords_type_id_name` (`type`,`id`,`name`),
  KEY `nodewords_name` (`name`(6)),
  KEY `nodewords_type_id` (`type`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nodewords_custom`
--

CREATE TABLE IF NOT EXISTS `nodewords_custom` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `path` mediumtext NOT NULL,
  `weight` smallint(6) NOT NULL DEFAULT '0',
  `enabled` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `node_access`
--

CREATE TABLE IF NOT EXISTS `node_access` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `gid` int(10) unsigned NOT NULL DEFAULT '0',
  `realm` varchar(255) NOT NULL DEFAULT '',
  `grant_view` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `grant_update` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `grant_delete` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`,`gid`,`realm`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `node_access`
--

INSERT INTO `node_access` (`nid`, `gid`, `realm`, `grant_view`, `grant_update`, `grant_delete`) VALUES
(0, 0, 'all', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `node_comment_statistics`
--

CREATE TABLE IF NOT EXISTS `node_comment_statistics` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_timestamp` int(11) NOT NULL DEFAULT '0',
  `last_comment_name` varchar(60) DEFAULT NULL,
  `last_comment_uid` int(11) NOT NULL DEFAULT '0',
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`),
  KEY `node_comment_timestamp` (`last_comment_timestamp`),
  KEY `comment_count` (`comment_count`),
  KEY `last_comment_uid` (`last_comment_uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `node_counter`
--

CREATE TABLE IF NOT EXISTS `node_counter` (
  `nid` int(11) NOT NULL DEFAULT '0',
  `totalcount` bigint(20) unsigned NOT NULL DEFAULT '0',
  `daycount` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `node_revisions`
--

CREATE TABLE IF NOT EXISTS `node_revisions` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `body` longtext NOT NULL,
  `teaser` longtext NOT NULL,
  `log` longtext NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `format` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `node_type`
--

CREATE TABLE IF NOT EXISTS `node_type` (
  `type` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `module` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `help` mediumtext NOT NULL,
  `has_title` tinyint(3) unsigned NOT NULL,
  `title_label` varchar(255) NOT NULL DEFAULT '',
  `has_body` tinyint(3) unsigned NOT NULL,
  `body_label` varchar(255) NOT NULL DEFAULT '',
  `min_word_count` smallint(5) unsigned NOT NULL,
  `custom` tinyint(4) NOT NULL DEFAULT '0',
  `modified` tinyint(4) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `orig_type` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `node_type`
--

INSERT INTO `node_type` (`type`, `name`, `module`, `description`, `help`, `has_title`, `title_label`, `has_body`, `body_label`, `min_word_count`, `custom`, `modified`, `locked`, `orig_type`) VALUES
('page', 'Page', 'node', 'A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an "About us" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site''s initial home page.', '', 1, 'Title', 1, 'Body', 0, 1, 1, 0, 'page');

-- --------------------------------------------------------

--
-- Table structure for table `page_title`
--

CREATE TABLE IF NOT EXISTS `page_title` (
  `type` varchar(15) NOT NULL DEFAULT 'node',
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `page_title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`type`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pathauto_persist`
--

CREATE TABLE IF NOT EXISTS `pathauto_persist` (
  `entity_type` varchar(32) NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  `pathauto` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`entity_type`,`entity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE IF NOT EXISTS `permission` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `perm` longtext,
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`pid`, `rid`, `perm`, `tid`) VALUES
(6, 1, 'access content', 0),
(7, 2, 'access content', 0),
(8, 3, 'use admin toolbar, administer google analytics, access imagefield_zip widget, administer menu, access content, administer nodes, edit meta tag DESCRIPTION, edit meta tag KEYWORDS, set page title, create url aliases, administer smtp module, administer taxonomy, change own username, access all views, site administer', 0);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`rid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`rid`, `name`) VALUES
(1, 'anonymous user'),
(2, 'authenticated user'),
(3, 'manager');

-- --------------------------------------------------------

--
-- Table structure for table `semaphore`
--

CREATE TABLE IF NOT EXISTS `semaphore` (
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  `expire` double NOT NULL,
  PRIMARY KEY (`name`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `uid` int(10) unsigned NOT NULL,
  `sid` varchar(64) NOT NULL DEFAULT '',
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `cache` int(11) NOT NULL DEFAULT '0',
  `session` longtext,
  PRIMARY KEY (`sid`),
  KEY `timestamp` (`timestamp`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `system`
--

CREATE TABLE IF NOT EXISTS `system` (
  `filename` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `owner` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `throttle` tinyint(4) NOT NULL DEFAULT '0',
  `bootstrap` int(11) NOT NULL DEFAULT '0',
  `schema_version` smallint(6) NOT NULL DEFAULT '-1',
  `weight` int(11) NOT NULL DEFAULT '0',
  `info` text,
  PRIMARY KEY (`filename`),
  KEY `modules` (`type`(12),`status`,`weight`,`filename`),
  KEY `bootstrap` (`type`(12),`status`,`bootstrap`,`weight`,`filename`),
  KEY `type_name` (`type`(12),`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `system`
--

INSERT INTO `system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES
('themes/garland/minnelli/minnelli.info', 'minnelli', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, 0, -1, 0, 'a:14:{s:4:"name";s:8:"Minnelli";s:11:"description";s:56:"Tableless, recolorable, multi-column, fixed width theme.";s:7:"version";s:4:"6.35";s:4:"core";s:3:"6.x";s:10:"base theme";s:7:"garland";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:12:"minnelli.css";s:36:"themes/garland/minnelli/minnelli.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/garland/minnelli/script.js";}s:10:"screenshot";s:38:"themes/garland/minnelli/screenshot.png";s:3:"php";s:5:"4.3.5";s:6:"engine";s:11:"phptemplate";}'),
('themes/garland/garland.info', 'garland', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, 0, -1, 0, 'a:13:{s:4:"name";s:7:"Garland";s:11:"description";s:66:"Tableless, recolorable, multi-column, fluid width theme (default).";s:7:"version";s:4:"6.35";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:24:"themes/garland/script.js";}s:10:"screenshot";s:29:"themes/garland/screenshot.png";s:3:"php";s:5:"4.3.5";}'),
('themes/bluemarine/bluemarine.info', 'bluemarine', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, 0, -1, 0, 'a:13:{s:4:"name";s:10:"Bluemarine";s:11:"description";s:66:"Table-based multi-column theme with a marine and ash color scheme.";s:7:"version";s:4:"6.35";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/bluemarine/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/bluemarine/script.js";}s:10:"screenshot";s:32:"themes/bluemarine/screenshot.png";s:3:"php";s:5:"4.3.5";}'),
('themes/pushbutton/pushbutton.info', 'pushbutton', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, 0, -1, 0, 'a:13:{s:4:"name";s:10:"Pushbutton";s:11:"description";s:52:"Tabled, multi-column theme in blue and orange tones.";s:7:"version";s:4:"6.35";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/pushbutton/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/pushbutton/script.js";}s:10:"screenshot";s:32:"themes/pushbutton/screenshot.png";s:3:"php";s:5:"4.3.5";}'),
('themes/chameleon/marvin/marvin.info', 'marvin', 'theme', '', 0, 0, 0, -1, 0, 'a:13:{s:4:"name";s:6:"Marvin";s:11:"description";s:31:"Boxy tabled theme in all grays.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:7:"version";s:4:"6.35";s:4:"core";s:3:"6.x";s:10:"base theme";s:9:"chameleon";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:33:"themes/chameleon/marvin/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/chameleon/marvin/script.js";}s:10:"screenshot";s:38:"themes/chameleon/marvin/screenshot.png";s:3:"php";s:5:"4.3.5";}'),
('themes/chameleon/chameleon.info', 'chameleon', 'theme', 'themes/chameleon/chameleon.theme', 0, 0, 0, -1, 0, 'a:12:{s:4:"name";s:9:"Chameleon";s:11:"description";s:42:"Minimalist tabled theme with light colors.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:8:"features";a:4:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";}s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:9:"style.css";s:26:"themes/chameleon/style.css";s:10:"common.css";s:27:"themes/chameleon/common.css";}}s:7:"version";s:4:"6.35";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:7:"scripts";a:1:{s:9:"script.js";s:26:"themes/chameleon/script.js";}s:10:"screenshot";s:31:"themes/chameleon/screenshot.png";s:3:"php";s:5:"4.3.5";}'),
('sites/all/themes/rubik/cube/cube.info', 'cube', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, 0, -1, 0, 'a:16:{s:4:"name";s:4:"Cube";s:11:"description";s:44:"Spaces-aware front-end theme based on Rubik.";s:10:"base theme";s:5:"rubik";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:11:"stylesheets";a:1:{s:6:"screen";a:1:{s:9:"style.css";s:37:"sites/all/themes/rubik/cube/style.css";}}s:7:"regions";a:4:{s:6:"header";s:6:"Header";s:7:"content";s:7:"Content";s:4:"left";s:4:"Left";s:5:"right";s:5:"Right";}s:9:"designkit";a:2:{s:5:"color";a:1:{s:10:"background";s:7:"#0088cc";}s:4:"logo";a:2:{s:4:"logo";s:23:"imagecache_scale:200x50";s:5:"print";s:24:"imagecache_scale:600x150";}}s:7:"layouts";a:5:{s:7:"default";a:3:{s:4:"name";s:7:"Default";s:11:"description";s:23:"Simple one column page.";s:8:"template";s:4:"page";}s:7:"sidebar";a:5:{s:4:"name";s:7:"Sidebar";s:11:"description";s:26:"Main content with sidebar.";s:10:"stylesheet";s:18:"layout-sidebar.css";s:8:"template";s:14:"layout-sidebar";s:7:"regions";a:2:{i:0;s:7:"content";i:1;s:5:"right";}}s:5:"split";a:5:{s:4:"name";s:5:"Split";s:11:"description";s:12:"50/50 split.";s:10:"stylesheet";s:16:"layout-split.css";s:8:"template";s:14:"layout-sidebar";s:7:"regions";a:2:{i:0;s:7:"content";i:1;s:5:"right";}}s:7:"columns";a:5:{s:4:"name";s:7:"Columns";s:11:"description";s:20:"Three column layout.";s:10:"stylesheet";s:18:"layout-columns.css";s:8:"template";s:14:"layout-columns";s:7:"regions";a:4:{i:0;s:6:"header";i:1;s:7:"content";i:2;s:4:"left";i:3;s:5:"right";}}s:6:"offset";a:5:{s:4:"name";s:15:"Offset sidebars";s:11:"description";s:38:"Main content with two offset sidebars.";s:10:"stylesheet";s:17:"layout-offset.css";s:8:"template";s:13:"layout-offset";s:7:"regions";a:4:{i:0;s:6:"header";i:1;s:7:"content";i:2;s:4:"left";i:3;s:5:"right";}}}s:7:"version";s:13:"6.x-3.0-beta3";s:7:"project";s:5:"rubik";s:9:"datestamp";s:10:"1329952845";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:37:"sites/all/themes/rubik/cube/script.js";}s:10:"screenshot";s:42:"sites/all/themes/rubik/cube/screenshot.png";s:3:"php";s:5:"4.3.5";}'),
('sites/all/themes/rubik/rubik.info', 'rubik', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, 0, -1, 0, 'a:14:{s:4:"name";s:5:"Rubik";s:11:"description";s:18:"Clean admin theme.";s:10:"base theme";s:3:"tao";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"scripts";a:1:{s:11:"js/rubik.js";s:34:"sites/all/themes/rubik/js/rubik.js";}s:11:"stylesheets";a:1:{s:6:"screen";a:3:{s:8:"core.css";s:31:"sites/all/themes/rubik/core.css";s:9:"icons.css";s:32:"sites/all/themes/rubik/icons.css";s:9:"style.css";s:32:"sites/all/themes/rubik/style.css";}}s:7:"version";s:13:"6.x-3.0-beta3";s:7:"project";s:5:"rubik";s:9:"datestamp";s:10:"1329952845";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:10:"screenshot";s:37:"sites/all/themes/rubik/screenshot.png";s:3:"php";s:5:"4.3.5";}'),
('sites/all/themes/tao/tao.info', 'tao', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, 0, -1, 0, 'a:13:{s:4:"core";s:3:"6.x";s:11:"description";s:149:"Tao is a base theme that is all about going with the flow. It takes care of key reset and utility tasks so that sub-themes can get on with their job.";s:6:"engine";s:11:"phptemplate";s:4:"name";s:3:"Tao";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:7:"scripts";a:1:{s:9:"js/tao.js";s:30:"sites/all/themes/tao/js/tao.js";}s:11:"stylesheets";a:3:{s:6:"screen";a:3:{s:9:"reset.css";s:30:"sites/all/themes/tao/reset.css";s:10:"drupal.css";s:31:"sites/all/themes/tao/drupal.css";s:8:"base.css";s:29:"sites/all/themes/tao/base.css";}s:5:"print";a:3:{s:9:"reset.css";s:30:"sites/all/themes/tao/reset.css";s:8:"base.css";s:29:"sites/all/themes/tao/base.css";s:9:"print.css";s:30:"sites/all/themes/tao/print.css";}s:3:"all";a:20:{s:9:"admin.css";s:30:"sites/all/themes/tao/admin.css";s:9:"block.css";s:30:"sites/all/themes/tao/block.css";s:8:"book.css";s:29:"sites/all/themes/tao/book.css";s:11:"comment.css";s:32:"sites/all/themes/tao/comment.css";s:9:"dblog.css";s:30:"sites/all/themes/tao/dblog.css";s:12:"defaults.css";s:33:"sites/all/themes/tao/defaults.css";s:9:"forum.css";s:30:"sites/all/themes/tao/forum.css";s:8:"help.css";s:29:"sites/all/themes/tao/help.css";s:15:"maintenance.css";s:36:"sites/all/themes/tao/maintenance.css";s:8:"node.css";s:29:"sites/all/themes/tao/node.css";s:10:"openid.css";s:31:"sites/all/themes/tao/openid.css";s:8:"poll.css";s:29:"sites/all/themes/tao/poll.css";s:11:"profile.css";s:32:"sites/all/themes/tao/profile.css";s:10:"search.css";s:31:"sites/all/themes/tao/search.css";s:10:"system.css";s:31:"sites/all/themes/tao/system.css";s:16:"system-menus.css";s:37:"sites/all/themes/tao/system-menus.css";s:12:"taxonomy.css";s:33:"sites/all/themes/tao/taxonomy.css";s:11:"tracker.css";s:32:"sites/all/themes/tao/tracker.css";s:10:"update.css";s:31:"sites/all/themes/tao/update.css";s:8:"user.css";s:29:"sites/all/themes/tao/user.css";}}s:7:"version";s:7:"6.x-3.3";s:7:"project";s:3:"tao";s:9:"datestamp";s:10:"1329952556";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:10:"screenshot";s:35:"sites/all/themes/tao/screenshot.png";s:3:"php";s:5:"4.3.5";}'),
('sites/all/themes/virdini/virdini.info', 'virdini', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 1, 0, 0, -1, 0, 'a:11:{s:4:"name";s:11:"Virdini.com";s:11:"description";s:45:"Theme designed by Virdini.сom for this site.";s:4:"core";s:3:"6.x";s:7:"project";s:7:"virdini";s:6:"engine";s:11:"phptemplate";s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:13:"css/style.css";s:38:"sites/all/themes/virdini/css/style.css";s:19:"css/forms-style.css";s:44:"sites/all/themes/virdini/css/forms-style.css";}}s:7:"scripts";a:1:{s:12:"js/script.js";s:37:"sites/all/themes/virdini/js/script.js";}s:7:"regions";a:8:{s:4:"left";s:11:"Left region";s:9:"main_menu";s:9:"Main menu";s:5:"right";s:12:"Right region";s:7:"content";s:7:"Content";s:6:"header";s:13:"Header region";s:6:"footer";s:13:"Footer region";s:4:"lang";s:9:"Languages";s:6:"search";s:6:"Search";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:10:"screenshot";s:39:"sites/all/themes/virdini/screenshot.png";s:3:"php";s:5:"4.3.5";}'),
('modules/system/system.module', 'system', 'module', '', 1, 0, 0, 6055, 0, 'a:10:{s:4:"name";s:6:"System";s:11:"description";s:54:"Handles general site configuration for administrators.";s:7:"package";s:15:"Core - required";s:7:"version";s:4:"6.35";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/admin/admin.module', 'admin', 'module', '', 1, 0, 0, 6202, 1, 'a:10:{s:4:"name";s:5:"Admin";s:11:"description";s:42:"UI helpers for Drupal admins and managers.";s:7:"package";s:14:"Administration";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.0";s:7:"project";s:5:"admin";s:9:"datestamp";s:10:"1282226188";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/advagg/advagg.module', 'advagg', 'module', '', 0, 0, 0, -1, 250, 'a:10:{s:4:"name";s:27:"Advanced CSS/JS Aggregation";s:11:"description";s:101:"Aggregates multiple CSS/JS files, serves them with gzip encoding and smart client-side cache headers.";s:7:"package";s:27:"Advanced CSS/JS Aggregation";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-1.9";s:7:"project";s:6:"advagg";s:9:"datestamp";s:10:"1340665277";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/advagg/advagg_bundler/advagg_bundler.module', 'advagg_bundler', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:14:"AdvAgg Bundler";s:11:"description";s:89:"Provides intelligent bundling of CSS and JS files by grouping files that belong together.";s:7:"package";s:27:"Advanced CSS/JS Aggregation";s:4:"core";s:3:"6.x";s:12:"dependencies";a:1:{i:0;s:6:"advagg";}s:7:"version";s:7:"6.x-1.9";s:7:"project";s:6:"advagg";s:9:"datestamp";s:10:"1340665277";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/advagg/advagg_css_compress/advagg_css_compress.module', 'advagg_css_compress', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:19:"AdvAgg Compress CSS";s:11:"description";s:60:"Compress CSS with a 3rd party compressor, CSSTidy currently.";s:7:"package";s:27:"Advanced CSS/JS Aggregation";s:4:"core";s:3:"6.x";s:12:"dependencies";a:1:{i:0;s:6:"advagg";}s:3:"php";s:3:"5.0";s:7:"version";s:7:"6.x-1.9";s:7:"project";s:6:"advagg";s:9:"datestamp";s:10:"1340665277";s:10:"dependents";a:0:{}}'),
('sites/all/modules/advagg/advagg_js_cdn/advagg_js_cdn.module', 'advagg_js_cdn', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:21:"AdvAgg CDN Javascript";s:11:"description";s:74:"Use a shared CDN for javascript libraries, Google Libraries API currently.";s:7:"package";s:27:"Advanced CSS/JS Aggregation";s:4:"core";s:3:"6.x";s:12:"dependencies";a:1:{i:0;s:6:"advagg";}s:7:"version";s:7:"6.x-1.9";s:7:"project";s:6:"advagg";s:9:"datestamp";s:10:"1340665277";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/advagg/advagg_js_compress/advagg_js_compress.module', 'advagg_js_compress', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:26:"AdvAgg Compress Javascript";s:11:"description";s:66:"Compress Javascript with a 3rd party compressor, JSMin+ currently.";s:7:"package";s:27:"Advanced CSS/JS Aggregation";s:4:"core";s:3:"6.x";s:12:"dependencies";a:1:{i:0;s:6:"advagg";}s:7:"version";s:7:"6.x-1.9";s:7:"project";s:6:"advagg";s:9:"datestamp";s:10:"1340665277";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/aggregator/aggregator.module', 'aggregator', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:10:"Aggregator";s:11:"description";s:57:"Aggregates syndicated content (RSS, RDF, and Atom feeds).";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.35";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/block/block.module', 'block', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:5:"Block";s:11:"description";s:62:"Controls the boxes that are displayed around the main content.";s:7:"package";s:15:"Core - required";s:7:"version";s:4:"6.35";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/blog/blog.module', 'blog', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:4:"Blog";s:11:"description";s:69:"Enables keeping easily and regularly updated user web pages or blogs.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.35";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/blogapi/blogapi.module', 'blogapi', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:8:"Blog API";s:11:"description";s:79:"Allows users to post content using applications that support XML-RPC blog APIs.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.35";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/book/book.module', 'book', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:4:"Book";s:11:"description";s:63:"Allows users to structure site pages in a hierarchy or outline.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.35";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/color/color.module', 'color', 'module', '', 0, 0, 0, 6001, 0, 'a:10:{s:4:"name";s:5:"Color";s:11:"description";s:61:"Allows the user to change the color scheme of certain themes.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.35";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/colorbox/colorbox.module', 'colorbox', 'module', '', 0, 0, 0, -1, 0, 'a:9:{s:4:"name";s:8:"Colorbox";s:11:"description";s:72:"A light-weight, customizable lightbox plugin for jQuery 1.3 through 1.6.";s:4:"core";s:3:"6.x";s:12:"dependencies";a:1:{i:0;s:14:"virdini_jquery";}s:7:"version";s:7:"6.x-1.4";s:7:"project";s:8:"colorbox";s:9:"datestamp";s:10:"1358398265";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/comment/comment.module', 'comment', 'module', '', 0, 0, 0, 6005, 0, 'a:10:{s:4:"name";s:7:"Comment";s:11:"description";s:57:"Allows users to comment on and discuss published content.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.35";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/contact/contact.module', 'contact', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:7:"Contact";s:11:"description";s:61:"Enables the use of both personal and site-wide contact forms.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.35";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/cck/content.module', 'content', 'module', '', 1, 0, 0, 6010, 0, 'a:10:{s:4:"name";s:7:"Content";s:11:"description";s:50:"Allows administrators to define new content types.";s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.9";s:7:"project";s:3:"cck";s:9:"datestamp";s:10:"1294407979";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/cck/modules/content_copy/content_copy.module', 'content_copy', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:12:"Content Copy";s:11:"description";s:51:"Enables ability to import/export field definitions.";s:12:"dependencies";a:1:{i:0;s:7:"content";}s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.9";s:7:"project";s:3:"cck";s:9:"datestamp";s:10:"1294407979";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/cck/modules/content_permissions/content_permissions.module', 'content_permissions', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:19:"Content Permissions";s:11:"description";s:43:"Set field-level permissions for CCK fields.";s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:12:"dependencies";a:1:{i:0;s:7:"content";}s:7:"version";s:7:"6.x-2.9";s:7:"project";s:3:"cck";s:9:"datestamp";s:10:"1294407979";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/ctm/ctm.module', 'ctm', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:30:"Menu Settings per Content Type";s:11:"description";s:98:"This module allow to set the Menu Settings with certain Menus for content editing by Content Type.";s:7:"package";s:14:"Administration";s:4:"core";s:3:"6.x";s:7:"project";s:3:"ctm";s:7:"version";s:7:"6.x-1.1";s:9:"datestamp";s:10:"1305175615";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/dblog/dblog.module', 'dblog', 'module', '', 1, 0, 0, 6000, 0, 'a:10:{s:4:"name";s:16:"Database logging";s:11:"description";s:47:"Logs and records system events to the database.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.35";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/fast_404/fast_404.module', 'fast_404', 'module', '', 1, 0, 1, 0, -1000, 'a:9:{s:4:"name";s:8:"Fast 404";s:11:"description";s:90:"Speed up the generation of 404 pages with this module. Route 404 display to a static page.";s:4:"core";s:3:"6.x";s:7:"version";s:11:"6.x-1.x-dev";s:7:"project";s:8:"fast_404";s:9:"datestamp";s:10:"1331381592";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/cck/modules/fieldgroup/fieldgroup.module', 'fieldgroup', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:10:"Fieldgroup";s:11:"description";s:37:"Create display groups for CCK fields.";s:12:"dependencies";a:1:{i:0;s:7:"content";}s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.9";s:7:"project";s:3:"cck";s:9:"datestamp";s:10:"1294407979";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/cck/modules/filefield/filefield.module', 'filefield', 'module', '', 1, 0, 0, 6104, 0, 'a:10:{s:4:"name";s:9:"FileField";s:11:"description";s:26:"Defines a file field type.";s:12:"dependencies";a:1:{i:0;s:7:"content";}s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:3:"php";s:3:"5.0";s:7:"version";s:8:"6.x-3.13";s:7:"project";s:9:"filefield";s:9:"datestamp";s:10:"1405541029";s:10:"dependents";a:0:{}}'),
('sites/all/modules/cck/modules/filefield/filefield_meta/filefield_meta.module', 'filefield_meta', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:14:"FileField Meta";s:11:"description";s:48:"Add metadata gathering and storage to FileField.";s:12:"dependencies";a:2:{i:0;s:9:"filefield";i:1;s:6:"getid3";}s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:3:"php";s:3:"5.0";s:7:"version";s:8:"6.x-3.13";s:7:"project";s:9:"filefield";s:9:"datestamp";s:10:"1405541029";s:10:"dependents";a:0:{}}'),
('modules/filter/filter.module', 'filter', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:6:"Filter";s:11:"description";s:60:"Handles the filtering of content in preparation for display.";s:7:"package";s:15:"Core - required";s:7:"version";s:4:"6.35";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/forum/forum.module', 'forum', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:5:"Forum";s:11:"description";s:50:"Enables threaded discussions about general topics.";s:12:"dependencies";a:2:{i:0;s:8:"taxonomy";i:1;s:7:"comment";}s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.35";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/globalredirect/globalredirect.module', 'globalredirect', 'module', '', 1, 0, 0, 6101, 0, 'a:9:{s:4:"name";s:15:"Global Redirect";s:11:"description";s:129:"Searches for an alias of the current URL and 301 redirects if found. Stops duplicate content arising when path module is enabled.";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-1.5";s:7:"project";s:14:"globalredirect";s:9:"datestamp";s:10:"1339752680";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/help/help.module', 'help', 'module', '', 0, 0, 0, 0, 0, 'a:10:{s:4:"name";s:4:"Help";s:11:"description";s:35:"Manages the display of online help.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.35";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/imageapi/imageapi.module', 'imageapi', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:8:"ImageAPI";s:11:"description";s:38:"ImageAPI supporting multiple toolkits.";s:7:"package";s:10:"ImageCache";s:4:"core";s:3:"6.x";s:3:"php";s:3:"5.1";s:7:"version";s:8:"6.x-1.10";s:7:"project";s:8:"imageapi";s:9:"datestamp";s:10:"1305563215";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}}'),
('sites/all/modules/imageapi/imageapi_gd.module', 'imageapi_gd', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:12:"ImageAPI GD2";s:11:"description";s:49:"Uses PHP''s built-in GD2 image processing support.";s:7:"package";s:10:"ImageCache";s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-1.10";s:7:"project";s:8:"imageapi";s:9:"datestamp";s:10:"1305563215";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/imageapi/imageapi_imagemagick.module', 'imageapi_imagemagick', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:20:"ImageAPI ImageMagick";s:11:"description";s:33:"Command Line ImageMagick support.";s:7:"package";s:10:"ImageCache";s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-1.10";s:7:"project";s:8:"imageapi";s:9:"datestamp";s:10:"1305563215";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/imagecache/imagecache.module', 'imagecache', 'module', '', 1, 0, 0, 6001, 0, 'a:10:{s:4:"name";s:10:"ImageCache";s:11:"description";s:36:"Dynamic image manipulator and cache.";s:7:"package";s:10:"ImageCache";s:12:"dependencies";a:1:{i:0;s:8:"imageapi";}s:4:"core";s:3:"6.x";s:7:"version";s:11:"6.x-2.0-rc1";s:7:"project";s:10:"imagecache";s:9:"datestamp";s:10:"1337742655";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/imagecache/imagecache_ui.module', 'imagecache_ui', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:13:"ImageCache UI";s:11:"description";s:26:"ImageCache User Interface.";s:12:"dependencies";a:2:{i:0;s:10:"imagecache";i:1;s:8:"imageapi";}s:7:"package";s:10:"ImageCache";s:4:"core";s:3:"6.x";s:7:"version";s:11:"6.x-2.0-rc1";s:7:"project";s:10:"imagecache";s:9:"datestamp";s:10:"1337742655";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/cck/modules/imagefield/imagefield.module', 'imagefield', 'module', '', 1, 0, 0, 6006, 0, 'a:10:{s:4:"name";s:10:"ImageField";s:11:"description";s:28:"Defines an image field type.";s:4:"core";s:3:"6.x";s:12:"dependencies";a:2:{i:0;s:7:"content";i:1;s:9:"filefield";}s:7:"package";s:3:"CCK";s:7:"version";s:8:"6.x-3.11";s:7:"project";s:10:"imagefield";s:9:"datestamp";s:10:"1365969012";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/imce/imce.module', 'imce', 'module', '', 1, 0, 0, 6202, 0, 'a:9:{s:4:"name";s:4:"IMCE";s:11:"description";s:82:"An image/file uploader and browser supporting personal directories and user quota.";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.7";s:7:"project";s:4:"imce";s:9:"datestamp";s:10:"1400275728";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/imce_wysiwyg/imce_wysiwyg.module', 'imce_wysiwyg', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:23:"IMCE Wysiwyg API bridge";s:11:"description";s:82:"Makes IMCE available as plugin for client-side editors integrated via Wysiwyg API.";s:7:"package";s:14:"User interface";s:4:"core";s:3:"6.x";s:12:"dependencies";a:2:{i:0;s:4:"imce";i:1;s:7:"wysiwyg";}s:7:"version";s:7:"6.x-1.1";s:7:"project";s:12:"imce_wysiwyg";s:9:"datestamp";s:10:"1268433606";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/jquery_ui/jquery_ui.module', 'jquery_ui', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:9:"jQuery UI";s:11:"description";s:55:"Provides the jQuery UI plug-in to other Drupal modules.";s:7:"package";s:14:"User interface";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-1.5";s:7:"project";s:9:"jquery_ui";s:9:"datestamp";s:10:"1308323216";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/l10n_update/l10n_update.module', 'l10n_update', 'module', '', 1, 0, 0, 6005, 0, 'a:10:{s:4:"name";s:19:"Localization update";s:11:"description";s:58:"Provides automatic downloads and updates for translations.";s:12:"dependencies";a:1:{i:0;s:6:"locale";}s:4:"core";s:3:"6.x";s:7:"package";s:13:"Multilanguage";s:3:"php";s:1:"5";s:7:"version";s:13:"6.x-1.0-beta3";s:7:"project";s:11:"l10n_update";s:9:"datestamp";s:10:"1330292747";s:10:"dependents";a:0:{}}'),
('modules/locale/locale.module', 'locale', 'module', '', 1, 0, 0, 6007, 0, 'a:10:{s:4:"name";s:6:"Locale";s:11:"description";s:119:"Adds language handling functionality and enables the translation of the user interface to languages other than English.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.35";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/menu/menu.module', 'menu', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:4:"Menu";s:11:"description";s:60:"Allows administrators to customize the site navigation menu.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.35";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/node/node.module', 'node', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:4:"Node";s:11:"description";s:66:"Allows content to be submitted to the site and displayed on pages.";s:7:"package";s:15:"Core - required";s:7:"version";s:4:"6.35";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/cck/modules/nodereference/nodereference.module', 'nodereference', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:14:"Node Reference";s:11:"description";s:59:"Defines a field type for referencing one node from another.";s:12:"dependencies";a:3:{i:0;s:7:"content";i:1;s:4:"text";i:2;s:13:"optionwidgets";}s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.9";s:7:"project";s:3:"cck";s:9:"datestamp";s:10:"1294407979";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/nodewords/nodewords.module', 'nodewords', 'module', '', 1, 0, 0, 6187, 10, 'a:11:{s:4:"name";s:9:"Nodewords";s:11:"description";s:67:"Implement an API that other modules can use to implement meta tags.";s:7:"package";s:9:"Meta tags";s:4:"core";s:3:"6.x";s:10:"recommends";a:2:{i:0;s:8:"checkall";i:1;s:13:"vertical_tabs";}s:7:"version";s:8:"6.x-1.14";s:7:"project";s:9:"nodewords";s:9:"datestamp";s:10:"1354723721";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/nodewords/nodewords_basic/nodewords_basic.module', 'nodewords_basic', 'module', '', 1, 0, 0, 6114, 12, 'a:10:{s:4:"name";s:25:"Nodewords basic meta tags";s:11:"description";s:199:"Add the ''abstract'', ''canonical'', ''copyright'', ''description'', ''keywords'', ''logo'', ''original-source'', ''revisit-after'', ''robots'', ''standout'' and ''syndication-source'' meta tags, and the ''title'' HTML tag.";s:12:"dependencies";a:1:{i:0;s:9:"nodewords";}s:7:"package";s:9:"Meta tags";s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-1.14";s:7:"project";s:9:"nodewords";s:9:"datestamp";s:10:"1354723721";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/nodewords/nodewords_extra/nodewords_extra.module', 'nodewords_extra', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:25:"Nodewords extra meta tags";s:11:"description";s:100:"Add the Dublin Core, ''geo.placename'', ''geo.position'', ''geo.region'', ''icbm'' and ''shorturl'' meta tags.";s:12:"dependencies";a:1:{i:0;s:9:"nodewords";}s:7:"package";s:9:"Meta tags";s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-1.14";s:7:"project";s:9:"nodewords";s:9:"datestamp";s:10:"1354723721";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/nodewords/nodewords_og/nodewords_og.module', 'nodewords_og', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:30:"Nodewords Open Graph meta tags";s:11:"description";s:172:"Add the Open Graph (i.e. Facebook) meta tags. Note: the theme must be customized in order for these tags to work correctly, please see the README.txt file for full details.";s:12:"dependencies";a:2:{i:0;s:9:"nodewords";i:1;s:15:"nodewords_basic";}s:7:"package";s:9:"Meta tags";s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-1.14";s:7:"project";s:9:"nodewords";s:9:"datestamp";s:10:"1354723721";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/cck/modules/number/number.module', 'number', 'module', '', 1, 0, 0, 6000, 0, 'a:10:{s:4:"name";s:6:"Number";s:11:"description";s:28:"Defines numeric field types.";s:12:"dependencies";a:1:{i:0;s:7:"content";}s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.9";s:7:"project";s:3:"cck";s:9:"datestamp";s:10:"1294407979";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/openid/openid.module', 'openid', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:6:"OpenID";s:11:"description";s:48:"Allows users to log into your site using OpenID.";s:7:"version";s:4:"6.35";s:7:"package";s:15:"Core - optional";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/cck/modules/optionwidgets/optionwidgets.module', 'optionwidgets', 'module', '', 1, 0, 0, 6001, 0, 'a:10:{s:4:"name";s:14:"Option Widgets";s:11:"description";s:82:"Defines selection, check box and radio button widgets for text and numeric fields.";s:12:"dependencies";a:1:{i:0;s:7:"content";}s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.9";s:7:"project";s:3:"cck";s:9:"datestamp";s:10:"1294407979";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/path/path.module', 'path', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:4:"Path";s:11:"description";s:28:"Allows users to rename URLs.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.35";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/pathauto/pathauto.module', 'pathauto', 'module', '', 1, 0, 0, 7, 1, 'a:10:{s:4:"name";s:8:"Pathauto";s:11:"description";s:95:"Provides a mechanism for modules to automatically generate aliases for the content they manage.";s:12:"dependencies";a:2:{i:0;s:4:"path";i:1;s:5:"token";}s:4:"core";s:3:"6.x";s:10:"recommends";a:1:{i:0;s:13:"path_redirect";}s:7:"version";s:7:"6.x-1.6";s:7:"project";s:8:"pathauto";s:9:"datestamp";s:10:"1320076535";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/php/php.module', 'php', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:10:"PHP filter";s:11:"description";s:50:"Allows embedded PHP code/snippets to be evaluated.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.35";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/ping/ping.module', 'ping', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:4:"Ping";s:11:"description";s:51:"Alerts other sites when your site has been updated.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.35";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/poll/poll.module', 'poll', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:4:"Poll";s:11:"description";s:95:"Allows your site to capture votes on different topics in the form of multiple choice questions.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.35";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/profile/profile.module', 'profile', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:7:"Profile";s:11:"description";s:36:"Supports configurable user profiles.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.35";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/search/search.module', 'search', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:6:"Search";s:11:"description";s:36:"Enables site-wide keyword searching.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.35";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/smtp/smtp.module', 'smtp', 'module', '', 0, 0, 0, 0, 0, 'a:10:{s:4:"name";s:27:"SMTP Authentication Support";s:11:"description";s:72:"Allows the sending of site e-mail through an SMTP server of your choice.";s:4:"core";s:3:"6.x";s:7:"package";s:4:"Mail";s:3:"php";s:5:"4.0.0";s:7:"version";s:7:"6.x-1.1";s:7:"project";s:4:"smtp";s:9:"datestamp";s:10:"1360762545";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}}'),
('modules/statistics/statistics.module', 'statistics', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:10:"Statistics";s:11:"description";s:37:"Logs access statistics for your site.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.35";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/syslog/syslog.module', 'syslog', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:6:"Syslog";s:11:"description";s:41:"Logs and records system events to syslog.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.35";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/taxonomy/taxonomy.module', 'taxonomy', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:8:"Taxonomy";s:11:"description";s:38:"Enables the categorization of content.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.35";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/cck/modules/text/text.module', 'text', 'module', '', 1, 0, 0, 6003, 0, 'a:10:{s:4:"name";s:4:"Text";s:11:"description";s:32:"Defines simple text field types.";s:12:"dependencies";a:1:{i:0;s:7:"content";}s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.9";s:7:"project";s:3:"cck";s:9:"datestamp";s:10:"1294407979";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/throttle/throttle.module', 'throttle', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:8:"Throttle";s:11:"description";s:66:"Handles the auto-throttling mechanism, to control site congestion.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.35";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/token/token.module', 'token', 'module', '', 1, 0, 0, 1, 10, 'a:9:{s:4:"name";s:5:"Token";s:11:"description";s:79:"Provides a shared API for replacement of textual placeholders with actual data.";s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-1.19";s:7:"project";s:5:"token";s:9:"datestamp";s:10:"1347470077";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/token/tokenSTARTER.module', 'tokenSTARTER', 'module', '', 0, 0, 0, -1, 0, 'a:9:{s:4:"name";s:12:"TokenSTARTER";s:11:"description";s:72:"Provides additional tokens and a base on which to build your own tokens.";s:12:"dependencies";a:1:{i:0;s:5:"token";}s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-1.19";s:7:"project";s:5:"token";s:9:"datestamp";s:10:"1347470077";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/token/token_actions.module', 'token_actions', 'module', '', 1, 0, 0, 0, 0, 'a:9:{s:4:"name";s:13:"Token actions";s:11:"description";s:73:"Provides enhanced versions of core Drupal actions using the Token module.";s:12:"dependencies";a:1:{i:0;s:5:"token";}s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-1.19";s:7:"project";s:5:"token";s:9:"datestamp";s:10:"1347470077";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/token/tests/token_test.module', 'token_test', 'module', '', 0, 0, 0, -1, 0, 'a:12:{s:4:"name";s:10:"Token Test";s:11:"description";s:39:"Testing module for token functionality.";s:7:"package";s:7:"Testing";s:4:"core";s:3:"6.x";s:5:"files";a:1:{i:0;s:17:"token_test.module";}s:6:"hidden";b:1;s:7:"version";s:8:"6.x-1.19";s:7:"project";s:5:"token";s:9:"datestamp";s:10:"1347470077";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/tracker/tracker.module', 'tracker', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:7:"Tracker";s:11:"description";s:43:"Enables tracking of recent posts for users.";s:12:"dependencies";a:1:{i:0;s:7:"comment";}s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.35";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/translation/translation.module', 'translation', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:19:"Content translation";s:11:"description";s:57:"Allows content to be translated into different languages.";s:12:"dependencies";a:1:{i:0;s:6:"locale";}s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.35";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/transliteration/transliteration.module', 'transliteration', 'module', '', 1, 0, 0, 0, 0, 'a:9:{s:4:"name";s:15:"Transliteration";s:11:"description";s:61:"Converts non-latin text to US-ASCII and sanitizes file names.";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-3.1";s:7:"project";s:15:"transliteration";s:9:"datestamp";s:10:"1338540716";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/trigger/trigger.module', 'trigger', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:7:"Trigger";s:11:"description";s:90:"Enables actions to be fired on certain system events, such as when new content is created.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.35";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/update/update.module', 'update', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:13:"Update status";s:11:"description";s:88:"Checks the status of available updates for Drupal and your installed modules and themes.";s:7:"version";s:4:"6.35";s:7:"package";s:15:"Core - optional";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/upload/upload.module', 'upload', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:6:"Upload";s:11:"description";s:51:"Allows users to upload and attach files to content.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.35";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/user/user.module', 'user', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:4:"User";s:11:"description";s:47:"Manages the user registration and login system.";s:7:"package";s:15:"Core - required";s:7:"version";s:4:"6.35";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1426707431";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/cck/modules/userreference/userreference.module', 'userreference', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:14:"User Reference";s:11:"description";s:56:"Defines a field type for referencing a user from a node.";s:12:"dependencies";a:3:{i:0;s:7:"content";i:1;s:4:"text";i:2;s:13:"optionwidgets";}s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.9";s:7:"project";s:3:"cck";s:9:"datestamp";s:10:"1294407979";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/views/views.module', 'views', 'module', '', 1, 0, 0, 6013, 10, 'a:10:{s:4:"name";s:5:"Views";s:11:"description";s:55:"Create customized lists and queries from your database.";s:7:"package";s:5:"Views";s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-2.18";s:7:"project";s:5:"views";s:9:"datestamp";s:10:"1423647793";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/views/views_export/views_export.module', 'views_export', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:14:"Views exporter";s:11:"description";s:40:"Allows exporting multiple views at once.";s:7:"package";s:5:"Views";s:12:"dependencies";a:1:{i:0;s:5:"views";}s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-2.18";s:7:"project";s:5:"views";s:9:"datestamp";s:10:"1423647793";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/views/views_ui.module', 'views_ui', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:8:"Views UI";s:11:"description";s:93:"Administrative interface to views. Without this module, you cannot create or edit your views.";s:7:"package";s:5:"Views";s:4:"core";s:3:"6.x";s:12:"dependencies";a:1:{i:0;s:5:"views";}s:7:"version";s:8:"6.x-2.18";s:7:"project";s:5:"views";s:9:"datestamp";s:10:"1423647793";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/virdini/virdini_jquery/virdini_jquery.module', 'virdini_jquery', 'module', '', 1, 0, 0, 0, 99, 'a:9:{s:4:"name";s:14:"Virdini jQuery";s:11:"description";s:50:"Updates Drupal to use the 1.8.3 version of jQuery.";s:7:"package";s:8:" Virdini";s:4:"core";s:3:"6.x";s:7:"project";s:7:"virdini";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:7:"version";N;s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/wysiwyg/wysiwyg.module', 'wysiwyg', 'module', '', 1, 0, 0, 6201, 0, 'a:10:{s:4:"name";s:7:"Wysiwyg";s:11:"description";s:55:"Allows users to edit contents with client-side editors.";s:7:"package";s:14:"User interface";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.4";s:7:"project";s:7:"wysiwyg";s:9:"datestamp";s:10:"1308450722";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/poormanscron/poormanscron.module', 'poormanscron', 'module', '', 1, 0, 0, 6201, 0, 'a:9:{s:4:"name";s:12:"Poormanscron";s:11:"description";s:56:"Internal scheduler for users without a cron application.";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.2";s:7:"project";s:12:"poormanscron";s:9:"datestamp";s:10:"1263749708";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/page_title/tests/page_title_views_test.module', 'page_title_views_test', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:27:"Page Title Views SimpleTest";s:11:"description";s:61:"SimpleTest dependency modue for testing Views with Page Title";s:4:"core";s:3:"6.x";s:7:"package";s:11:"Development";s:12:"dependencies";a:2:{i:0;s:10:"page_title";i:1;s:5:"views";}s:7:"version";s:7:"6.x-2.7";s:7:"project";s:10:"page_title";s:9:"datestamp";s:10:"1336556783";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES
('sites/all/modules/page_title/page_title.module', 'page_title', 'module', '', 1, 0, 0, 6200, 0, 'a:10:{s:4:"name";s:10:"Page Title";s:11:"description";s:60:"Enhanced control over the page title (in the &lt;head> tag).";s:12:"dependencies";a:1:{i:0;s:5:"token";}s:4:"core";s:3:"6.x";s:7:"package";s:3:"SEO";s:7:"version";s:7:"6.x-2.7";s:7:"project";s:10:"page_title";s:9:"datestamp";s:10:"1336556783";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/google_analytics/googleanalytics.module', 'googleanalytics', 'module', '', 1, 0, 0, 6401, 0, 'a:10:{s:4:"name";s:16:"Google Analytics";s:11:"description";s:102:"Allows your site to be tracked by Google Analytics by adding a Javascript tracking code to every page.";s:4:"core";s:3:"6.x";s:7:"package";s:10:"Statistics";s:7:"version";s:7:"6.x-4.1";s:7:"project";s:16:"google_analytics";s:9:"datestamp";s:10:"1417276686";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/cck/modules/imagefield_zip/imagefield_zip.module', 'imagefield_zip', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:32:"ImageField Zip/HTML5 Bulk Upload";s:11:"description";s:114:"Upload via HTML5 or a zip file containing images that will automatically be populated to a multi-value imagefield.";s:7:"package";s:3:"CCK";s:12:"dependencies";a:1:{i:0;s:10:"imagefield";}s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-1.2";s:7:"project";s:14:"imagefield_zip";s:9:"datestamp";s:10:"1319664634";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/nodeformcols/nfcbiblio.module', 'nfcbiblio', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:20:"Biblio compatability";s:11:"description";s:30:"Adds support for biblio fields";s:12:"dependencies";a:2:{i:0;s:12:"nodeformcols";i:1;s:6:"biblio";}s:4:"core";s:3:"6.x";s:7:"package";s:17:"Node form columns";s:7:"version";s:7:"6.x-1.7";s:7:"project";s:12:"nodeformcols";s:9:"datestamp";s:10:"1389798524";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/nodeformcols/nfccaptcha.module', 'nfccaptcha', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:21:"CAPTCHA compatability";s:11:"description";s:38:"Adds support for CAPTCHA in node forms";s:12:"dependencies";a:2:{i:0;s:12:"nodeformcols";i:1;s:7:"captcha";}s:4:"core";s:3:"6.x";s:7:"package";s:17:"Node form columns";s:7:"version";s:7:"6.x-1.7";s:7:"project";s:12:"nodeformcols";s:9:"datestamp";s:10:"1389798524";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/nodeformcols/nodeformcols.module', 'nodeformcols', 'module', '', 1, 0, 0, 6100, 1, 'a:10:{s:4:"name";s:17:"Node form columns";s:11:"description";s:55:"Separates the node forms into two columns and a footer.";s:4:"core";s:3:"6.x";s:7:"package";s:17:"Node form columns";s:7:"version";s:7:"6.x-1.7";s:7:"project";s:12:"nodeformcols";s:9:"datestamp";s:10:"1389798524";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/virdini/virdini_settings/virdini_settings.module', 'virdini_settings', 'module', '', 1, 0, 0, 0, 0, 'a:9:{s:4:"name";s:8:"Settings";s:11:"description";s:25:"Settings for current site";s:7:"package";s:8:" Virdini";s:4:"core";s:3:"6.x";s:7:"project";s:7:"virdini";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:7:"version";N;s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/admin_plus/admin_plus.module', 'admin_plus', 'module', '', 1, 0, 0, 0, 0, 'a:8:{s:4:"name";s:10:"Admin Plus";s:11:"description";s:0:"";s:7:"package";s:14:"Administration";s:4:"core";s:3:"6.x";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:7:"version";N;s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/virdini/virdini_fix/virdini_fix.module', 'virdini_fix', 'module', '', 1, 0, 0, 0, 0, 'a:9:{s:4:"name";s:3:"Fix";s:11:"description";s:25:"Fix drupal core & modules";s:7:"package";s:8:" Virdini";s:4:"core";s:3:"6.x";s:7:"project";s:7:"virdini";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:7:"version";N;s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/pathauto_persist/pathauto_persist.module', 'pathauto_persist', 'module', '', 1, 0, 0, 6000, 0, 'a:9:{s:4:"name";s:25:"Pathauto persistant state";s:11:"description";s:62:"Keeps track and enforces a persistant Pathauto state per node.";s:4:"core";s:3:"6.x";s:12:"dependencies";a:1:{i:0;s:8:"pathauto";}s:7:"version";s:7:"6.x-1.2";s:7:"project";s:16:"pathauto_persist";s:9:"datestamp";s:10:"1320164137";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');

-- --------------------------------------------------------

--
-- Table structure for table `term_data`
--

CREATE TABLE IF NOT EXISTS `term_data` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`),
  KEY `taxonomy_tree` (`vid`,`weight`,`name`),
  KEY `vid_name` (`vid`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `term_hierarchy`
--

CREATE TABLE IF NOT EXISTS `term_hierarchy` (
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `parent` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`,`parent`),
  KEY `parent` (`parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `term_node`
--

CREATE TABLE IF NOT EXISTS `term_node` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`,`vid`),
  KEY `vid` (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `term_relation`
--

CREATE TABLE IF NOT EXISTS `term_relation` (
  `trid` int(11) NOT NULL AUTO_INCREMENT,
  `tid1` int(10) unsigned NOT NULL DEFAULT '0',
  `tid2` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`trid`),
  UNIQUE KEY `tid1_tid2` (`tid1`,`tid2`),
  KEY `tid2` (`tid2`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `term_synonym`
--

CREATE TABLE IF NOT EXISTS `term_synonym` (
  `tsid` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`tsid`),
  KEY `tid` (`tid`),
  KEY `name_tid` (`name`,`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `url_alias`
--

CREATE TABLE IF NOT EXISTS `url_alias` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `src` varchar(128) NOT NULL DEFAULT '',
  `dst` varchar(128) NOT NULL DEFAULT '',
  `language` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`pid`),
  UNIQUE KEY `dst_language_pid` (`dst`,`language`,`pid`),
  KEY `src_language_pid` (`src`,`language`,`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `url_alias`
--

INSERT INTO `url_alias` (`pid`, `src`, `dst`, `language`) VALUES
(1, 'user/3', 'users/manager', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '',
  `pass` varchar(32) NOT NULL DEFAULT '',
  `mail` varchar(64) DEFAULT '',
  `mode` tinyint(4) NOT NULL DEFAULT '0',
  `sort` tinyint(4) DEFAULT '0',
  `threshold` tinyint(4) DEFAULT '0',
  `theme` varchar(255) NOT NULL DEFAULT '',
  `signature` varchar(255) NOT NULL DEFAULT '',
  `signature_format` smallint(6) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '0',
  `login` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `timezone` varchar(8) DEFAULT NULL,
  `language` varchar(12) NOT NULL DEFAULT '',
  `picture` varchar(255) NOT NULL DEFAULT '',
  `init` varchar(64) DEFAULT '',
  `data` longtext,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `name` (`name`),
  KEY `access` (`access`),
  KEY `created` (`created`),
  KEY `mail` (`mail`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `name`, `pass`, `mail`, `mode`, `sort`, `threshold`, `theme`, `signature`, `signature_format`, `created`, `access`, `login`, `status`, `timezone`, `language`, `picture`, `init`, `data`) VALUES
(0, '', '', '', 0, 0, 0, '', '', 0, 0, 0, 0, 0, NULL, '', '', '', NULL),
(1, 'admin', '3d801aa532c1cec3ee82d87a99fdf63f', 'dev@virdini.net', 0, 0, 0, '', '', 0, 1346030797, 1428831335, 1428831335, 1, NULL, '', '', 'dev@virdini.net', 'a:0:{}'),
(3, 'manager', '3d801aa532c1cec3ee82d87a99fdf63f', 'info@virdini.com', 0, 0, 0, '', '', 0, 1346034402, 1346034402, 1346034435, 0, NULL, '', '', 'info@virdini.com', 'a:1:{s:13:"form_build_id";s:37:"form-51c0b2e007e88bfb82e173cb8cba8782";}');

-- --------------------------------------------------------

--
-- Table structure for table `users_roles`
--

CREATE TABLE IF NOT EXISTS `users_roles` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`rid`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_roles`
--

INSERT INTO `users_roles` (`uid`, `rid`) VALUES
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `variable`
--

CREATE TABLE IF NOT EXISTS `variable` (
  `name` varchar(128) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `variable`
--

INSERT INTO `variable` (`name`, `value`) VALUES
('theme_default', 's:7:"virdini";'),
('filter_html_1', 'i:1;'),
('node_options_forum', 'a:1:{i:0;s:6:"status";}'),
('drupal_private_key', 's:64:"f8fcbd3b88939743cdffe98c31f27da8e49207f651a71e54570f9d51800244c0";'),
('menu_masks', 'a:24:{i:0;i:125;i:1;i:63;i:2;i:62;i:3;i:61;i:4;i:59;i:5;i:58;i:6;i:57;i:7;i:56;i:8;i:31;i:9;i:30;i:10;i:29;i:11;i:28;i:12;i:24;i:13;i:21;i:14;i:15;i:15;i:14;i:16;i:12;i:17;i:11;i:18;i:7;i:19;i:6;i:20;i:5;i:21;i:3;i:22;i:2;i:23;i:1;}'),
('install_task', 's:4:"done";'),
('menu_expanded', 'a:0:{}'),
('site_name', 's:22:"drupaljquery.localhost";'),
('site_mail', 's:15:"dev@virdini.net";'),
('date_default_timezone', 's:5:"10800";'),
('user_email_verification', 'i:1;'),
('clean_url', 's:1:"1";'),
('install_time', 'i:1346030865;'),
('node_options_page', 'a:1:{i:0;s:6:"status";}'),
('comment_page', 'i:0;'),
('theme_settings', 'a:1:{s:21:"toggle_node_info_page";b:0;}'),
('drupal_http_request_fails', 'b:0;'),
('css_js_query_string', 's:20:"XtCWNdv6RUayFz2wQu3c";'),
('install_profile', 's:7:"default";'),
('content_schema_version', 'i:6009;'),
('imce_profiles', 'a:2:{i:1;a:10:{s:4:"name";s:6:"User-1";s:7:"usertab";i:1;s:8:"filesize";i:0;s:5:"quota";i:0;s:7:"tuquota";i:0;s:10:"extensions";s:1:"*";s:10:"dimensions";s:9:"1200x1200";s:7:"filenum";i:0;s:11:"directories";a:1:{i:0;a:7:{s:4:"name";s:1:".";s:6:"subnav";i:1;s:6:"browse";i:1;s:6:"upload";i:1;s:5:"thumb";i:1;s:6:"delete";i:1;s:6:"resize";i:1;}}s:10:"thumbnails";a:3:{i:0;a:4:{s:4:"name";s:5:"Small";s:10:"dimensions";s:5:"90x90";s:6:"prefix";s:6:"small_";s:6:"suffix";s:0:"";}i:1;a:4:{s:4:"name";s:6:"Medium";s:10:"dimensions";s:7:"120x120";s:6:"prefix";s:7:"medium_";s:6:"suffix";s:0:"";}i:2;a:4:{s:4:"name";s:5:"Large";s:10:"dimensions";s:7:"180x180";s:6:"prefix";s:6:"large_";s:6:"suffix";s:0:"";}}}i:2;a:10:{s:4:"name";s:7:"manager";s:7:"usertab";i:0;s:8:"filesize";s:1:"0";s:5:"quota";s:1:"0";s:7:"tuquota";s:1:"0";s:10:"extensions";s:1:"*";s:10:"dimensions";s:9:"1200x1200";s:7:"filenum";s:1:"0";s:11:"directories";a:1:{i:0;a:7:{s:4:"name";s:7:"manager";s:6:"subnav";i:1;s:6:"browse";i:1;s:6:"upload";i:1;s:5:"thumb";i:1;s:6:"delete";i:1;s:6:"resize";i:1;}}s:10:"thumbnails";a:1:{i:0;a:4:{s:4:"name";s:5:"Thumb";s:10:"dimensions";s:5:"90x90";s:6:"prefix";s:6:"thumb_";s:6:"suffix";s:0:"";}}}}'),
('imce_roles_profiles', 'a:3:{i:3;a:1:{s:3:"pid";s:1:"2";}i:2;a:1:{s:3:"pid";s:1:"0";}i:1;a:1:{s:3:"pid";s:1:"0";}}'),
('l10n_update_check_mode', 's:1:"3";'),
('pathauto_modulelist', 'a:3:{i:0;s:4:"node";i:1;s:4:"user";i:2;s:8:"taxonomy";}'),
('pathauto_taxonomy_supportsfeeds', 's:6:"0/feed";'),
('pathauto_taxonomy_pattern', 's:25:"[vocab-raw]/[catpath-raw]";'),
('pathauto_taxonomy_bulkupdate', 'i:0;'),
('pathauto_taxonomy_applytofeeds', 's:0:"";'),
('pathauto_taxonomy_2_pattern', 's:0:"";'),
('pathauto_taxonomy_1_pattern', 's:0:"";'),
('pathauto_ignore_words', 's:108:"a,an,as,at,before,but,by,for,from,is,in,into,like,of,off,on,onto,per,since,than,the,this,that,to,up,via,with";'),
('pathauto_indexaliases', 'b:0;'),
('pathauto_indexaliases_bulkupdate', 'b:0;'),
('pathauto_max_component_length', 's:3:"100";'),
('pathauto_max_length', 's:3:"100";'),
('pathauto_node_bulkupdate', 'i:0;'),
('pathauto_node_forum_pattern', 's:0:"";'),
('pathauto_node_image_pattern', 's:0:"";'),
('pathauto_node_page_pattern', 's:0:"";'),
('pathauto_node_pattern', 's:26:"[termpath-raw]/[title-raw]";'),
('language_content_type_page', 's:1:"0";'),
('pathauto_punctuation_quotes', 's:1:"0";'),
('pathauto_separator', 's:1:"-";'),
('pathauto_update_action', 's:1:"1";'),
('pathauto_user_bulkupdate', 'i:0;'),
('pathauto_user_pattern', 's:16:"users/[user-raw]";'),
('pathauto_user_supportsfeeds', 'N;'),
('pathauto_verbose', 'i:0;'),
('pathauto_node_applytofeeds', 's:0:"";'),
('pathauto_punctuation_hyphen', 's:1:"1";'),
('file_directory_temp', 's:23:"sites/default/files/tmp";'),
('javascript_parsed', 'a:10:{i:0;s:14:"misc/jquery.js";i:1;s:14:"misc/drupal.js";i:2;s:46:"sites/all/modules/poormanscron/poormanscron.js";i:3;s:49:"sites/all/modules/admin/includes/jquery.cookie.js";i:4;s:52:"sites/all/modules/admin/includes/jquery.drilldown.js";i:5;s:49:"sites/all/modules/admin/includes/admin.toolbar.js";i:6;s:46:"sites/all/modules/admin/includes/admin.menu.js";i:7;s:37:"sites/all/themes/virdini/js/script.js";i:8;s:30:"sites/all/themes/tao/js/tao.js";i:9;s:34:"sites/all/themes/rubik/js/rubik.js";}'),
('preprocess_js', 's:1:"0";'),
('clear', 's:17:"Clear cached data";'),
('content_extra_weights_page', 'a:8:{s:5:"title";s:2:"-5";s:10:"body_field";s:1:"0";s:20:"revision_information";s:2:"20";s:6:"author";s:2:"20";s:7:"options";s:2:"25";s:4:"menu";s:2:"-2";s:4:"path";s:2:"30";s:9:"nodewords";s:2:"10";}'),
('filter_default_format', 's:1:"2";'),
('imagefield_zip_cck_widget_page_field_ss', 'i:0;'),
('imagefield_zip_upload_mode_page_field_ss', 'i:2;'),
('imagefield_zip_fallback_page_field_ss', 'i:0;'),
('advagg_js_compress_url_key', 'i:1671509882;'),
('pathauto_case', 's:1:"1";'),
('pathauto_max_bulk_update', 's:2:"50";'),
('pathauto_transliterate', 'i:1;'),
('pathauto_reduce_ascii', 'i:1;'),
('l10n_update_import_mode', 's:1:"2";'),
('l10n_update_check_frequency', 's:1:"0";'),
('l10n_update_check_disabled', 'i:1;'),
('l10n_update_download_store', 's:0:"";'),
('imageapi_image_toolkit', 's:11:"imageapi_gd";'),
('imageapi_jpeg_quality', 's:3:"100";'),
('imageapi_crop_background', 's:0:"";'),
('imageapi_interlaced', 'i:0;'),
('image_toolkit', 's:2:"gd";'),
('image_jpeg_quality', 's:3:"100";'),
('admin_toolbar', 'a:4:{s:6:"layout";s:8:"vertical";s:8:"position";s:2:"nw";s:8:"behavior";s:2:"df";s:6:"blocks";a:4:{s:12:"admin-create";i:-1;s:13:"admin-account";i:-1;s:10:"admin-menu";i:1;s:19:"menu-menu-fastadmin";i:-1;}}'),
('admin_theme', 's:5:"rubik";'),
('node_admin_theme', 'i:0;'),
('site_403', 's:0:"";'),
('site_404', 's:0:"";'),
('error_level', 's:1:"0";'),
('configurable_timezones', 's:1:"0";'),
('date_first_day', 's:1:"1";'),
('date_format_short', 's:11:"m/d/Y - H:i";'),
('date_format_short_custom', 's:11:"m/d/Y - H:i";'),
('date_format_medium', 's:14:"D, m/d/Y - H:i";'),
('date_format_medium_custom', 's:14:"D, m/d/Y - H:i";'),
('date_format_long', 's:15:"l, F j, Y - H:i";'),
('date_format_long_custom', 's:15:"l, F j, Y - H:i";'),
('globalredirect_settings', 'a:2:{s:17:"language_redirect";i:1;s:23:"content_location_header";i:1;}'),
('file_directory_path', 's:19:"sites/default/files";'),
('file_downloads', 's:1:"1";'),
('transliteration_file_uploads', 'i:1;'),
('transliteration_file_lowercase', 'i:1;'),
('nodewords_edit', 'a:7:{s:11:"description";s:11:"description";s:8:"keywords";s:8:"keywords";s:8:"abstract";i:0;s:9:"canonical";i:0;s:9:"copyright";i:0;s:13:"revisit-after";i:0;s:6:"robots";i:0;}'),
('nodewords_use_path_alias', 'i:0;'),
('nodewords_enable_user_metatags', 'i:1;'),
('nodewords_list_repeat', 'i:0;'),
('nodewords_use_frontpage_tags', 'i:1;'),
('nodewords_max_size', 's:3:"350";'),
('nodewords_base_url', 's:0:"";'),
('nodewords_keyword_vids', 'a:0:{}'),
('nodewords_global_keywords', 's:0:"";'),
('nodewords_list_robots', 'a:8:{s:5:"index";i:0;s:7:"noindex";i:0;s:6:"follow";i:0;s:8:"nofollow";i:0;s:9:"noarchive";i:0;s:5:"noodp";i:0;s:9:"nosnippet";i:0;s:6:"noydir";i:0;}'),
('feed_default_items', 's:2:"10";'),
('feed_item_length', 's:5:"title";'),
('form_build_id_page', 's:37:"form-82567191c7eaa0010fa1e9aea6237c74";'),
('nodewords_edit_metatags_page', 'i:1;'),
('nodewords_metatags_generation_method_page', 's:1:"1";'),
('nodewords_metatags_generation_source_page', 's:1:"3";'),
('nodewords_use_alt_attribute_page', 'i:1;'),
('nodewords_filter_modules_output_page', 'a:0:{}'),
('nodewords_filter_regexp_page', 's:0:"";'),
('menu_page', 'a:0:{}'),
('rebuild', 's:19:"Rebuild permissions";'),
('default_nodes_main', 's:2:"10";'),
('teaser_length', 's:3:"800";'),
('node_preview', 's:1:"0";'),
('pathauto_node_supportsfeeds', 's:4:"feed";'),
('virdini_jquery_replace', 'b:1;'),
('cron_last', 'i:1428831323;'),
('pathauto_punctuation_double_quotes', 's:1:"0";'),
('pathauto_punctuation_backtick', 's:1:"0";'),
('pathauto_punctuation_comma', 's:1:"0";'),
('pathauto_punctuation_period', 's:1:"0";'),
('pathauto_punctuation_underscore', 's:1:"0";'),
('pathauto_punctuation_colon', 's:1:"0";'),
('pathauto_punctuation_semicolon', 's:1:"0";'),
('pathauto_punctuation_pipe', 's:1:"0";'),
('pathauto_punctuation_left_curly', 's:1:"0";'),
('pathauto_punctuation_left_square', 's:1:"0";'),
('pathauto_punctuation_right_curly', 's:1:"0";'),
('pathauto_punctuation_right_square', 's:1:"0";'),
('pathauto_punctuation_plus', 's:1:"0";'),
('pathauto_punctuation_equal', 's:1:"0";'),
('pathauto_punctuation_asterisk', 's:1:"0";'),
('pathauto_punctuation_ampersand', 's:1:"0";'),
('pathauto_punctuation_percent', 's:1:"0";'),
('pathauto_punctuation_caret', 's:1:"0";'),
('pathauto_punctuation_dollar', 's:1:"0";'),
('pathauto_punctuation_hash', 's:1:"0";'),
('pathauto_punctuation_at', 's:1:"0";'),
('pathauto_punctuation_exclamation', 's:1:"0";'),
('pathauto_punctuation_tilde', 's:1:"0";'),
('pathauto_punctuation_left_parenthesis', 's:1:"0";'),
('pathauto_punctuation_right_parenthesis', 's:1:"0";'),
('pathauto_punctuation_question_mark', 's:1:"0";'),
('pathauto_punctuation_less_than', 's:1:"0";'),
('pathauto_punctuation_greater_than', 's:1:"0";'),
('pathauto_punctuation_slash', 's:1:"0";'),
('pathauto_punctuation_back_slash', 's:1:"0";'),
('user_register', 's:1:"0";'),
('user_registration_help', 's:0:"";'),
('user_mail_register_admin_created_subject', 's:52:"An administrator created an account for you at !site";'),
('user_mail_register_admin_created_body', 's:468:"!username,\r\n\r\nA site administrator at !site has created an account for you. You may now log in to !login_uri using the following username and password:\r\n\r\nusername: !username\r\npassword: !password\r\n\r\nYou may also log in by clicking on this link or copying and pasting it in your browser:\r\n\r\n!login_url\r\n\r\nThis is a one-time login, so it can be used only once.\r\n\r\nAfter logging in, you will be redirected to !edit_uri so you can change your password.\r\n\r\n\r\n--  !site team";'),
('user_mail_register_no_approval_required_subject', 's:38:"Account details for !username at !site";'),
('user_mail_register_no_approval_required_body', 's:442:"!username,\r\n\r\nThank you for registering at !site. You may now log in to !login_uri using the following username and password:\r\n\r\nusername: !username\r\npassword: !password\r\n\r\nYou may also log in by clicking on this link or copying and pasting it in your browser:\r\n\r\n!login_url\r\n\r\nThis is a one-time login, so it can be used only once.\r\n\r\nAfter logging in, you will be redirected to !edit_uri so you can change your password.\r\n\r\n\r\n--  !site team";'),
('user_mail_register_pending_approval_subject', 's:63:"Account details for !username at !site (pending admin approval)";'),
('user_mail_register_pending_approval_body', 's:273:"!username,\r\n\r\nThank you for registering at !site. Your application for an account is currently pending approval. Once it has been approved, you will receive another e-mail containing information about how to log in, set your password, and other details.\r\n\r\n\r\n--  !site team";'),
('user_mail_password_reset_subject', 's:52:"Replacement login information for !username at !site";'),
('user_mail_password_reset_body', 's:419:"!username,\r\n\r\nA request to reset the password for your account has been made at !site.\r\n\r\nYou may now log in to !uri_brief by clicking on this link or copying and pasting it in your browser:\r\n\r\n!login_url\r\n\r\nThis is a one-time login, so it can be used only once. It expires after one day and nothing will happen if it''s not used.\r\n\r\nAfter logging in, you will be redirected to !edit_uri so you can change your password.";'),
('user_mail_status_activated_notify', 'i:1;'),
('user_mail_status_activated_subject', 's:49:"Account details for !username at !site (approved)";'),
('user_mail_status_activated_body', 's:434:"!username,\r\n\r\nYour account at !site has been activated.\r\n\r\nYou may now log in by clicking on this link or copying and pasting it in your browser:\r\n\r\n!login_url\r\n\r\nThis is a one-time login, so it can be used only once.\r\n\r\nAfter logging in, you will be redirected to !edit_uri so you can change your password.\r\n\r\nOnce you have set your own password, you will be able to log in to !login_uri in the future using:\r\n\r\nusername: !username\r\n";'),
('user_mail_status_blocked_notify', 'i:0;'),
('user_mail_status_blocked_subject', 's:48:"Account details for !username at !site (blocked)";'),
('user_mail_status_blocked_body', 's:53:"!username,\r\n\r\nYour account on !site has been blocked.";'),
('user_mail_status_deleted_notify', 'i:0;'),
('user_mail_status_deleted_subject', 's:48:"Account details for !username at !site (deleted)";'),
('user_mail_status_deleted_body', 's:53:"!username,\r\n\r\nYour account on !site has been deleted.";'),
('user_signatures', 's:1:"0";'),
('user_pictures', 's:1:"0";'),
('user_picture_path', 's:8:"pictures";'),
('user_picture_default', 's:0:"";'),
('user_picture_dimensions', 's:5:"85x85";'),
('user_picture_file_size', 's:2:"30";'),
('user_picture_guidelines', 's:0:"";'),
('imce_settings_textarea', 's:0:"";'),
('imce_settings_absurls', 'i:0;'),
('imce_settings_replace', 's:1:"0";'),
('imce_settings_thumb_method', 's:14:"scale_and_crop";'),
('nodeformscols_field_placements_page_default', 'a:8:{s:5:"title";a:4:{s:6:"region";s:4:"main";s:6:"weight";s:1:"0";s:12:"has_required";b:1;s:5:"title";s:5:"Title";}s:10:"body_field";a:5:{s:6:"region";s:4:"main";s:6:"weight";s:1:"1";s:12:"has_required";b:0;s:5:"title";N;s:6:"hidden";i:0;}s:20:"revision_information";a:6:{s:6:"region";s:5:"right";s:6:"weight";s:1:"1";s:12:"has_required";b:0;s:5:"title";s:20:"Revision information";s:9:"collapsed";i:1;s:6:"hidden";i:1;}s:4:"path";a:6:{s:6:"region";s:5:"right";s:6:"weight";s:1:"4";s:12:"has_required";b:0;s:5:"title";s:17:"URL path settings";s:9:"collapsed";i:1;s:6:"hidden";i:0;}s:7:"options";a:6:{s:6:"region";s:5:"right";s:6:"weight";s:1:"3";s:12:"has_required";b:0;s:5:"title";s:18:"Publishing options";s:9:"collapsed";i:1;s:6:"hidden";i:0;}s:6:"author";a:6:{s:6:"region";s:5:"right";s:6:"weight";s:1:"2";s:12:"has_required";b:0;s:5:"title";s:21:"Authoring information";s:9:"collapsed";i:1;s:6:"hidden";i:0;}s:7:"buttons";a:5:{s:6:"region";s:6:"footer";s:6:"weight";s:1:"3";s:12:"has_required";b:0;s:5:"title";N;s:6:"hidden";i:0;}s:9:"nodewords";a:6:{s:6:"region";s:5:"right";s:6:"weight";s:1:"0";s:12:"has_required";b:0;s:5:"title";s:9:"Meta tags";s:9:"collapsed";i:1;s:6:"hidden";i:0;}}'),
('cache', 's:1:"0";'),
('cache_lifetime', 's:1:"0";'),
('page_compression', 's:1:"1";'),
('block_cache', 's:1:"0";'),
('preprocess_css', 's:1:"0";');

-- --------------------------------------------------------

--
-- Table structure for table `views_display`
--

CREATE TABLE IF NOT EXISTS `views_display` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `id` varchar(64) NOT NULL DEFAULT '',
  `display_title` varchar(64) NOT NULL DEFAULT '',
  `display_plugin` varchar(64) NOT NULL DEFAULT '',
  `position` int(11) DEFAULT '0',
  `display_options` longtext,
  PRIMARY KEY (`vid`,`id`),
  KEY `vid` (`vid`,`position`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `views_object_cache`
--

CREATE TABLE IF NOT EXISTS `views_object_cache` (
  `sid` varchar(64) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `obj` varchar(32) DEFAULT NULL,
  `updated` int(10) unsigned NOT NULL DEFAULT '0',
  `data` longtext,
  KEY `sid_obj_name` (`sid`,`obj`,`name`),
  KEY `updated` (`updated`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `views_view`
--

CREATE TABLE IF NOT EXISTS `views_view` (
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `tag` varchar(255) DEFAULT '',
  `base_table` varchar(64) NOT NULL DEFAULT '',
  `core` int(11) DEFAULT '0',
  PRIMARY KEY (`vid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vocabulary`
--

CREATE TABLE IF NOT EXISTS `vocabulary` (
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `help` varchar(255) NOT NULL DEFAULT '',
  `relations` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hierarchy` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `multiple` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `required` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `tags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) NOT NULL DEFAULT '',
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vid`),
  KEY `list` (`weight`,`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `vocabulary`
--

INSERT INTO `vocabulary` (`vid`, `name`, `description`, `help`, `relations`, `hierarchy`, `multiple`, `required`, `tags`, `module`, `weight`) VALUES
(1, 'Category', '', '', 1, 0, 0, 0, 0, 'taxonomy', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vocabulary_node_types`
--

CREATE TABLE IF NOT EXISTS `vocabulary_node_types` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`type`,`vid`),
  KEY `vid` (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `watchdog`
--

CREATE TABLE IF NOT EXISTS `watchdog` (
  `wid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(16) NOT NULL DEFAULT '',
  `message` longtext NOT NULL,
  `variables` longtext NOT NULL,
  `severity` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `link` varchar(255) NOT NULL DEFAULT '',
  `location` text NOT NULL,
  `referer` text,
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`wid`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wysiwyg`
--

CREATE TABLE IF NOT EXISTS `wysiwyg` (
  `format` int(11) NOT NULL DEFAULT '0',
  `editor` varchar(128) NOT NULL DEFAULT '',
  `settings` text,
  PRIMARY KEY (`format`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wysiwyg`
--

INSERT INTO `wysiwyg` (`format`, `editor`, `settings`) VALUES
(1, 'tinymce', 'a:20:{s:7:"default";i:1;s:11:"user_choose";i:0;s:11:"show_toggle";i:1;s:5:"theme";s:8:"advanced";s:8:"language";s:2:"en";s:7:"buttons";a:6:{s:7:"default";a:11:{s:4:"bold";i:1;s:6:"italic";i:1;s:9:"underline";i:1;s:13:"strikethrough";i:1;s:11:"justifyleft";i:1;s:13:"justifycenter";i:1;s:12:"justifyright";i:1;s:11:"justifyfull";i:1;s:4:"link";i:1;s:6:"unlink";i:1;s:5:"image";i:1;}s:8:"advimage";a:1:{s:8:"advimage";i:1;}s:7:"advlink";a:1:{s:7:"advlink";i:1;}s:5:"paste";a:1:{s:9:"pasteword";i:1;}s:4:"imce";a:1:{s:4:"imce";i:1;}s:6:"drupal";a:1:{s:5:"break";i:1;}}s:11:"toolbar_loc";s:3:"top";s:13:"toolbar_align";s:4:"left";s:8:"path_loc";s:6:"bottom";s:8:"resizing";i:1;s:11:"verify_html";i:1;s:12:"preformatted";i:0;s:22:"convert_fonts_to_spans";i:1;s:17:"remove_linebreaks";i:1;s:23:"apply_source_formatting";i:0;s:27:"paste_auto_cleanup_on_paste";i:1;s:13:"block_formats";s:32:"p,address,pre,h2,h3,h4,h5,h6,div";s:11:"css_setting";s:5:"theme";s:8:"css_path";s:0:"";s:11:"css_classes";s:0:"";}'),
(2, 'tinymce', 'a:20:{s:7:"default";i:1;s:11:"user_choose";i:0;s:11:"show_toggle";i:1;s:5:"theme";s:8:"advanced";s:8:"language";s:2:"en";s:7:"buttons";a:8:{s:7:"default";a:15:{s:4:"bold";i:1;s:6:"italic";i:1;s:9:"underline";i:1;s:13:"strikethrough";i:1;s:11:"justifyleft";i:1;s:13:"justifycenter";i:1;s:12:"justifyright";i:1;s:11:"justifyfull";i:1;s:7:"numlist";i:1;s:4:"link";i:1;s:6:"unlink";i:1;s:5:"image";i:1;s:7:"cleanup";i:1;s:9:"forecolor";i:1;s:4:"code";i:1;}s:8:"advimage";a:1:{s:8:"advimage";i:1;}s:7:"advlink";a:1:{s:7:"advlink";i:1;}s:4:"font";a:2:{s:10:"fontselect";i:1;s:14:"fontsizeselect";i:1;}s:5:"paste";a:1:{s:9:"pasteword";i:1;}s:5:"table";a:1:{s:13:"tablecontrols";i:1;}s:4:"imce";a:1:{s:4:"imce";i:1;}s:6:"drupal";a:1:{s:5:"break";i:1;}}s:11:"toolbar_loc";s:3:"top";s:13:"toolbar_align";s:4:"left";s:8:"path_loc";s:6:"bottom";s:8:"resizing";i:1;s:11:"verify_html";i:1;s:12:"preformatted";i:0;s:22:"convert_fonts_to_spans";i:1;s:17:"remove_linebreaks";i:1;s:23:"apply_source_formatting";i:0;s:27:"paste_auto_cleanup_on_paste";i:1;s:13:"block_formats";s:32:"p,address,pre,h2,h3,h4,h5,h6,div";s:11:"css_setting";s:5:"theme";s:8:"css_path";s:0:"";s:11:"css_classes";s:0:"";}');

-- --------------------------------------------------------

--
-- Table structure for table `wysiwyg_user`
--

CREATE TABLE IF NOT EXISTS `wysiwyg_user` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `format` int(11) DEFAULT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  KEY `uid` (`uid`),
  KEY `format` (`format`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
