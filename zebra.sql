/*
Navicat MySQL Data Transfer

Source Server         : Localhost
Source Server Version : 50525
Source Host           : localhost:3306
Source Database       : zebra

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2012-09-07 17:05:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `zebra_comments`
-- ----------------------------
DROP TABLE IF EXISTS `zebra_comments`;
CREATE TABLE `zebra_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(5) NOT NULL DEFAULT '0',
  `story_id` bigint(20) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `comment` text NOT NULL,
  `upvotes` int(5) NOT NULL DEFAULT '0',
  `downvotes` int(5) NOT NULL,
  `created` int(5) NOT NULL DEFAULT '0',
  `updated` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zebra_comments
-- ----------------------------
INSERT INTO `zebra_comments` VALUES ('1', '0', '8', '1', 'Will definitely keep my ears open for further announcements. As much as I avoid webOS due to the lack of quality apps, booting into it even for a short while causes me to realize just how smooth its UX is and how awkward and backwards in a lot of ways the other mobile OSs are. I also think I am a great commenter.', '1', '0', '0', '1347001526');
INSERT INTO `zebra_comments` VALUES ('2', '1', '8', '1', 'They should have open sourced this thing right from the beginning I reckon.', '1', '0', '1346741169', '0');

-- ----------------------------
-- Table structure for `zebra_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `zebra_permissions`;
CREATE TABLE `zebra_permissions` (
  `permission_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_string` varchar(255) NOT NULL,
  PRIMARY KEY (`permission_id`,`permission_string`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of zebra_permissions
-- ----------------------------
INSERT INTO `zebra_permissions` VALUES ('1', 'edit_own_comments');

-- ----------------------------
-- Table structure for `zebra_permissions_roles`
-- ----------------------------
DROP TABLE IF EXISTS `zebra_permissions_roles`;
CREATE TABLE `zebra_permissions_roles` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of zebra_permissions_roles
-- ----------------------------
INSERT INTO `zebra_permissions_roles` VALUES ('0', '2');
INSERT INTO `zebra_permissions_roles` VALUES ('0', '3');
INSERT INTO `zebra_permissions_roles` VALUES ('1', '1');

-- ----------------------------
-- Table structure for `zebra_roles`
-- ----------------------------
DROP TABLE IF EXISTS `zebra_roles`;
CREATE TABLE `zebra_roles` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(120) NOT NULL,
  `role_display_name` varchar(160) NOT NULL,
  PRIMARY KEY (`role_id`,`role_name`),
  UNIQUE KEY `Unique Role` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of zebra_roles
-- ----------------------------
INSERT INTO `zebra_roles` VALUES ('1', 'user', 'Standard User');
INSERT INTO `zebra_roles` VALUES ('2', 'admin', 'Administrator');
INSERT INTO `zebra_roles` VALUES ('3', 'super_admin', 'Super Administrator');

-- ----------------------------
-- Table structure for `zebra_sessions`
-- ----------------------------
DROP TABLE IF EXISTS `zebra_sessions`;
CREATE TABLE `zebra_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zebra_sessions
-- ----------------------------
INSERT INTO `zebra_sessions` VALUES ('30fa7075677aee4235cc0f9ae5a64f7b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.89 Safari/537.1', '1347001330', 'a:5:{s:7:\"user_id\";s:1:\"1\";s:8:\"username\";s:5:\"zebra\";s:13:\"nice_username\";s:5:\"Zebra\";s:7:\"role_id\";s:1:\"3\";s:9:\"role_name\";s:11:\"super_admin\";}');

-- ----------------------------
-- Table structure for `zebra_stories`
-- ----------------------------
DROP TABLE IF EXISTS `zebra_stories`;
CREATE TABLE `zebra_stories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` tinytext NOT NULL,
  `description` text,
  `external_link` varchar(255) DEFAULT NULL,
  `upvotes` int(5) NOT NULL DEFAULT '0',
  `downvotes` int(5) NOT NULL DEFAULT '0',
  `created` int(5) NOT NULL DEFAULT '0',
  `updated` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zebra_stories
-- ----------------------------
INSERT INTO `zebra_stories` VALUES ('1', '1', 'How We Deploy At Github', 'how-we-deploy-at-github', null, 'https://github.com/blog/1241-deploying-at-github', '2', '0', '1346366020', '0');
INSERT INTO `zebra_stories` VALUES ('2', '1', 'How Tracking Down My Stolen Computer Triggered a Drug Bust', 'how-tracking-down-my-stolen-computer-triggered-a-drug-bust', null, 'http://blog.makezine.com/2012/08/31/how-tracking-down-my-stolen-computer-triggered-a-drug-bust/', '1', '0', '1346464971', '0');
INSERT INTO `zebra_stories` VALUES ('3', '1', 'Building Atari With CreateJS', 'building-atari-with-createjs', null, 'http://atari.com/arcade/developers/building-atari-createjs', '1', '0', '1346465070', '0');
INSERT INTO `zebra_stories` VALUES ('4', '1', 'A Lesson In Timing Attacks', 'a-lesson-in-timing-attacks', null, 'http://codahale.com/a-lesson-in-timing-attacks/', '1', '0', '1346465121', '0');
INSERT INTO `zebra_stories` VALUES ('5', '1', 'Valve Finds Value In Open-Source Drivers', 'valve-finds-value-in-open-source-drivers', null, 'http://www.phoronix.com/scan.php?page=article&item=intel_valve_linux&num=1', '1', '0', '1346465182', '0');
INSERT INTO `zebra_stories` VALUES ('6', '1', 'What Powers Etsy', 'what-powers-etsy', null, 'http://codeascraft.etsy.com/2012/08/31/what-hardware-powers-etsy-com/', '1', '0', '1346465205', '0');
INSERT INTO `zebra_stories` VALUES ('7', '1', 'What Is Good API Design?', 'what-is-good-api-design', null, 'http://richardminerich.com/2012/08/what-is-good-api-design/', '1', '0', '1346465234', '0');
INSERT INTO `zebra_stories` VALUES ('8', '1', 'Open WebOS Beta Officially Released', 'open-webos-beta-officially-released', null, 'http://blog.openwebosproject.org/post/30593510898/open-webos-august-edition', '1', '0', '1346465259', '0');
INSERT INTO `zebra_stories` VALUES ('9', '1', 'Moving From Heroku To Hardware', 'moving-from-heroku-to-hardware', null, 'http://justcramer.com/2012/08/30/how-noops-works-for-sentry/', '1', '0', '1346288196', '0');
INSERT INTO `zebra_stories` VALUES ('10', '1', 'The Human Who Outrun Horses', 'the-human-who-outrun-horses', null, 'http://www.smh.com.au/world/science/the-humans-who-outrun-horses-20120606-1zv96.html', '1', '0', '1346469806', '0');
INSERT INTO `zebra_stories` VALUES ('11', '1', 'Birds Hold \'Funerals\' For Dead', 'birds-hold-funerals-for-dead', null, 'http://www.bbc.co.uk/nature/19421217', '1', '0', '1346470110', '0');
INSERT INTO `zebra_stories` VALUES ('12', '2', 'Left Alone by Its Owner, Reddit Soars', 'left-alone-by-its-owner-reddit-soars', null, 'http://www.nytimes.com/2012/09/03/business/media/reddit-thrives-after-advance-publications-let-it-sink-or-swim.html?hp', '1', '0', '1346637769', '0');
INSERT INTO `zebra_stories` VALUES ('13', '2', 'Apple Never Invented Anything', 'apple-never-invented-anything', null, 'http://www.mondaynote.com/2012/09/02/apple-never-invented-anything/', '2', '0', '1346639849', '0');
INSERT INTO `zebra_stories` VALUES ('14', '1', 'When A Kickstarter Campaign Fails, Does Anyone Get Their Money Back?', 'when-a-kickstarter-campaign-fails-does-anyone-get-their-money-back', null, 'http://www.npr.org/blogs/alltechconsidered/2012/09/03/160505449/when-a-kickstarter-campaign-fails-does-anyone-get-their-money-back', '1', '0', '1346726598', '0');
INSERT INTO `zebra_stories` VALUES ('15', '1', 'Nintendo Almost Made a Knitting Add-On for NES', 'nintendo-almost-made-a-knitting-add-on-for-nes', null, 'http://www.ign.com/articles/2012/08/31/nintendo-almost-made-a-knitting-add-on-for-nes', '1', '0', '1346726686', '0');
INSERT INTO `zebra_stories` VALUES ('16', '1', 'SQL vs. NoSQL', 'sql-vs-nosql', null, 'http://www.linuxjournal.com/article/10770?page=0,0', '1', '0', '1346726735', '0');
INSERT INTO `zebra_stories` VALUES ('17', '1', 'Foggy: jQuery plugin for blurring page elements', 'foggy-jquery-plugin-for-blurring-page-elements', null, 'http://nbartlomiej.github.com/foggy/', '1', '0', '1346726807', '0');
INSERT INTO `zebra_stories` VALUES ('18', '1', 'Pass: The Standard Unix Password Manager', 'pass-the-standard-unix-password-manager', null, 'http://zx2c4.com/projects/password-store/', '1', '0', '1346727252', '0');
INSERT INTO `zebra_stories` VALUES ('19', '1', 'Ask:  How do you find clients?', 'ask-how-do-you-find-clients', 'Hi, I\'m thinking about doing some freelance web design and marketing for a bit of extra cash.\r\n\r\nAside from cold calls what are some good ways to obtain clients?', null, '1', '0', '1346731355', '0');
INSERT INTO `zebra_stories` VALUES ('20', '1', 'AntiSec leaks 1,000,001 Apple UDIDs, Device Names/Types', 'antisec-leaks-1000001-apple-udids-device-namestypes', null, 'http://pastebin.com/nfVT7b0Z', '1', '0', '1346733681', '0');
INSERT INTO `zebra_stories` VALUES ('21', '1', 'Cable lacing on the Curiosity rover', 'cable-lacing-on-the-curiosity-rover', null, 'http://igkt.net/sm/index.php?topic=4028', '1', '0', '1346735888', '0');
INSERT INTO `zebra_stories` VALUES ('22', '3', 'Google Search is only 18% Search', 'google-search-is-only-18-search', null, 'http://blog.jitbit.com/2012/09/googles-serp-is-only-25-serp.html', '1', '1', '1346803080', '0');
INSERT INTO `zebra_stories` VALUES ('23', '3', 'FBI Says Laptop Wasn\'t Hacked; Never Possessed File of Apple Device IDs', 'fbi-says-laptop-wasnt-hacked-never-possessed-file-of-apple-device-ids', null, 'http://www.wired.com/threatlevel/2012/09/fbi-says-laptop-wasnt-hacked-never-possessed-file-of-apple-device-ids', '2', '0', '1346803101', '0');
INSERT INTO `zebra_stories` VALUES ('24', '3', 'What\'s a $4000 Suit Worth?', 'whats-a-4000-suit-worth', null, 'http://www.nytimes.com/2012/09/09/magazine/whats-a-4000-suit-worth.html?pagewanted=all', '1', '0', '1346803216', '0');

-- ----------------------------
-- Table structure for `zebra_users`
-- ----------------------------
DROP TABLE IF EXISTS `zebra_users`;
CREATE TABLE `zebra_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(5) NOT NULL,
  `username` varchar(80) NOT NULL,
  `nice_username` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `password` varchar(140) NOT NULL,
  `register_date` int(11) NOT NULL DEFAULT '0',
  `activation_key` varchar(120) NOT NULL,
  `user_status` enum('active','pending','banned') NOT NULL,
  `remember_me` text,
  PRIMARY KEY (`id`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of zebra_users
-- ----------------------------
INSERT INTO `zebra_users` VALUES ('1', '3', 'zebra', 'Zebra', 'zebra@domain.com', '77675e7508dd8b0e2d5cf9514626a86fbd8279e0edca17d67b3a5fffb1def6f1', '1338865395', '', 'active', '');
INSERT INTO `zebra_users` VALUES ('2', '1', 'maxxx', 'Max', 'throwaway@hotmail.com', '77675e7508dd8b0e2d5cf9514626a86fbd8279e0edca17d67b3a5fffb1def6f1', '1342580595', '', 'active', '');
INSERT INTO `zebra_users` VALUES ('3', '1', 'galazy', 'Galazy', 'galazy@domain.com', '77675e7508dd8b0e2d5cf9514626a86fbd8279e0edca17d67b3a5fffb1def6f1', '1346721764', '', 'active', '');

-- ----------------------------
-- Table structure for `zebra_user_meta`
-- ----------------------------
DROP TABLE IF EXISTS `zebra_user_meta`;
CREATE TABLE `zebra_user_meta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `umeta_key` varchar(255) NOT NULL,
  `umeta_value` longtext NOT NULL,
  PRIMARY KEY (`umeta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of zebra_user_meta
-- ----------------------------
INSERT INTO `zebra_user_meta` VALUES ('1', '1', 'first_name', 'Wolf');
INSERT INTO `zebra_user_meta` VALUES ('2', '1', 'last_name', 'De Wolfe');
INSERT INTO `zebra_user_meta` VALUES ('3', '2', 'first_name', 'Max');
INSERT INTO `zebra_user_meta` VALUES ('4', '2', 'last_name', 'Green');
INSERT INTO `zebra_user_meta` VALUES ('5', '2', 'submissions', '2');
INSERT INTO `zebra_user_meta` VALUES ('6', '1', 'submissions', '6');
INSERT INTO `zebra_user_meta` VALUES ('7', '3', 'submissions', '3');

-- ----------------------------
-- Table structure for `zebra_votes`
-- ----------------------------
DROP TABLE IF EXISTS `zebra_votes`;
CREATE TABLE `zebra_votes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `story_id` bigint(20) unsigned NOT NULL,
  `reason_id` int(5) NOT NULL DEFAULT '0',
  `comment_id` bigint(20) unsigned NOT NULL,
  `vote_type` enum('upvote','downvote') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zebra_votes
-- ----------------------------
INSERT INTO `zebra_votes` VALUES ('1', '1', '1', '0', '0', 'upvote');
INSERT INTO `zebra_votes` VALUES ('2', '1', '2', '0', '0', 'upvote');
INSERT INTO `zebra_votes` VALUES ('3', '1', '3', '0', '0', 'upvote');
INSERT INTO `zebra_votes` VALUES ('4', '1', '4', '0', '0', 'upvote');
INSERT INTO `zebra_votes` VALUES ('5', '1', '5', '0', '0', 'upvote');
INSERT INTO `zebra_votes` VALUES ('6', '1', '6', '0', '0', 'upvote');
INSERT INTO `zebra_votes` VALUES ('7', '1', '7', '0', '0', 'upvote');
INSERT INTO `zebra_votes` VALUES ('8', '1', '8', '0', '0', 'upvote');
INSERT INTO `zebra_votes` VALUES ('9', '1', '9', '0', '0', 'upvote');
INSERT INTO `zebra_votes` VALUES ('10', '1', '18', '0', '0', 'upvote');
INSERT INTO `zebra_votes` VALUES ('11', '1', '19', '0', '0', 'upvote');
INSERT INTO `zebra_votes` VALUES ('12', '1', '20', '0', '0', 'upvote');
INSERT INTO `zebra_votes` VALUES ('13', '1', '21', '0', '0', 'upvote');
INSERT INTO `zebra_votes` VALUES ('14', '2', '1', '0', '0', 'upvote');
INSERT INTO `zebra_votes` VALUES ('15', '1', '0', '0', '1', 'upvote');
INSERT INTO `zebra_votes` VALUES ('16', '1', '0', '0', '2', 'upvote');
INSERT INTO `zebra_votes` VALUES ('18', '1', '12', '0', '0', 'upvote');
INSERT INTO `zebra_votes` VALUES ('19', '3', '22', '0', '0', 'upvote');
INSERT INTO `zebra_votes` VALUES ('20', '3', '23', '0', '0', 'upvote');
INSERT INTO `zebra_votes` VALUES ('21', '3', '24', '0', '0', 'upvote');
INSERT INTO `zebra_votes` VALUES ('22', '1', '24', '0', '0', 'upvote');
INSERT INTO `zebra_votes` VALUES ('23', '1', '23', '0', '0', 'upvote');
INSERT INTO `zebra_votes` VALUES ('26', '1', '13', '0', '0', 'upvote');
INSERT INTO `zebra_votes` VALUES ('27', '1', '22', '5', '0', 'downvote');

-- ----------------------------
-- Table structure for `zebra_vote_reasons`
-- ----------------------------
DROP TABLE IF EXISTS `zebra_vote_reasons`;
CREATE TABLE `zebra_vote_reasons` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `reason` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zebra_vote_reasons
-- ----------------------------
INSERT INTO `zebra_vote_reasons` VALUES ('1', 'Spam');
INSERT INTO `zebra_vote_reasons` VALUES ('2', 'Hateful');
INSERT INTO `zebra_vote_reasons` VALUES ('3', 'This made absolutely no sense');
INSERT INTO `zebra_vote_reasons` VALUES ('4', 'I\'m offended');
INSERT INTO `zebra_vote_reasons` VALUES ('5', 'Too controversial');
INSERT INTO `zebra_vote_reasons` VALUES ('6', 'Too many spelling and grammar errors');
INSERT INTO `zebra_vote_reasons` VALUES ('7', 'Too biased');
INSERT INTO `zebra_vote_reasons` VALUES ('8', 'Fails to make a compelling argument');
INSERT INTO `zebra_vote_reasons` VALUES ('9', 'Lacking facts');
INSERT INTO `zebra_vote_reasons` VALUES ('10', 'Quite clearly don\'t know what they\'re on about');
