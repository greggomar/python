CREATE TABLE `claims_assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `claim_number` varchar(45) DEFAULT NULL,
  `adjuster_name` varchar(45) DEFAULT NULL,
  `date_from` datetime DEFAULT NULL,
  `date_to` datetime DEFAULT NULL,
  `notes` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*
CREATE TABLE `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `organisation_id` varchar(45) NOT NULL,
  `primary` varchar(45) NOT NULL DEFAULT '0',
  `active` varchar(45) NOT NULL DEFAULT '1',
  `last_modified` varchar(45) NOT NULL,
  `user` varchar(45) NOT NULL,
  `title` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;


CREATE TABLE `contact_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  `detail` varchar(45) NOT NULL,
  `primary` varchar(45) NOT NULL DEFAULT '0',
  `active` varchar(45) NOT NULL DEFAULT '1',
  `username` varchar(45) NOT NULL,
  `last_modified` varchar(45) NOT NULL,
  `contact_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_contact_detail_contact1_idx` (`contact_id`),
  CONSTRAINT `fk_contact_detail_contact1` FOREIGN KEY (`contact_id`) REFERENCES `contact` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=latin1;


CREATE TABLE `email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(256) DEFAULT NULL,
  `to` varchar(256) DEFAULT NULL,
  `body` varchar(3000) DEFAULT NULL,
  `date_sent` datetime DEFAULT NULL,
  `organisation_id` int(11) DEFAULT NULL,
  `mpr_number` varchar(45) DEFAULT NULL,
  `subject` varchar(256) DEFAULT NULL,
  `to_name` varchar(256) DEFAULT NULL,
  `type` varchar(45) NOT NULL,
  `process_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;


CREATE TABLE `entity_level1_labels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `text` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

CREATE TABLE `entity_level1_level2_labels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `level1_ID` bigint(10) NOT NULL,
  `level2_ID` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;

CREATE TABLE `entity_level2_labels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `text` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `entity_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `entity_ID` bigint(10) NOT NULL,
  `levels_ID` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

CREATE TABLE `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(256) NOT NULL,
  `date` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `claim_number` varchar(45) NOT NULL,
  `organisation` varchar(45) DEFAULT NULL,
  `payer_id` varchar(45) DEFAULT NULL,
  `process_type_id` varchar(45) NOT NULL,
  `classification_types_id` int(11) NOT NULL,
  `note_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`claim_number`),
  KEY `fk_notes_classification_types1_idx` (`classification_types_id`),
  KEY `fk_notes_note_type1_idx` (`note_type_id`),
  CONSTRAINT `fk_notes_classification_types1` FOREIGN KEY (`classification_types_id`) REFERENCES `classification_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_notes_note_type1` FOREIGN KEY (`note_type_id`) REFERENCES `note_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=latin1;

CREATE TABLE `note_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
*/
CREATE TABLE referral_overrides (id int(11) NOT NULL AUTO_INCREMENT, claim_number varchar(45) DEFAULT NULL,referral_number varchar(45) DEFAULT NULL,adjuster_name varchar(90) DEFAULT NULL, date datetime DEFAULT NULL, PRIMARY KEY (id)) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

CREATE TABLE `referral_actions` (
  `referral_action_id` int(11) NOT NULL,
  `referral_action_text` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`referral_action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `referral_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `row_item_ID` varchar(45) DEFAULT NULL,
  `claim_number` varchar(128) DEFAULT NULL,
  `referral_info` longtext,
  `referral_action_id` varchar(45) DEFAULT NULL,
  `referral_action_text` varchar(45) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `referral_number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*
CREATE TABLE `reminders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note_id` int(11) DEFAULT NULL,
  `followupDate` datetime DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `date` datetime NOT NULL,
  `claim_number` varchar(45) NOT NULL,
  `organisation_id` int(11) NOT NULL,
  `active` varchar(45) NOT NULL DEFAULT '1',
  `process_type_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reminders_contact1_idx` (`contact_id`),
  CONSTRAINT `fk_reminders_contact1` FOREIGN KEY (`contact_id`) REFERENCES `contact` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=latin1;
*/
CREATE TABLE `threshold_ranges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `probabilty_range` varchar(20) DEFAULT NULL,
  `cost_range` decimal(12,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

CREATE TABLE `thresholds` (
  `workflow_id` int(11) NOT NULL,
  `costLow` int(11) NOT NULL,
  `costHigh` varchar(12) NOT NULL,
  `probLow` int(11) NOT NULL,
  `probHigh` int(11) NOT NULL,
  PRIMARY KEY (`workflow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `workflow_actions` (
  `id` int(11) NOT NULL,
  `workflow_action_text` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `workflow_actions` (`id`,`workflow_action_text`) VALUES (0,'Deny');
INSERT INTO `workflow_actions` (`id`,`workflow_action_text`) VALUES (1,'Authorize');
INSERT INTO `workflow_actions` (`id`,`workflow_action_text`) VALUES (2,'Management Review');

INSERT INTO `thresholds` (`workflow_id`,`costLow`,`costHigh`,`probLow`,`probHigh`) VALUES (0,0,'0',0,30);
INSERT INTO `thresholds` (`workflow_id`,`costLow`,`costHigh`,`probLow`,`probHigh`) VALUES (1,0,'500',80,100);
INSERT INTO `thresholds` (`workflow_id`,`costLow`,`costHigh`,`probLow`,`probHigh`) VALUES (2,20000,'& Above',50,50);

INSERT INTO `threshold_ranges` (`id`,`probabilty_range`,`cost_range`) VALUES (1,'0',0);
INSERT INTO `threshold_ranges` (`id`,`probabilty_range`,`cost_range`) VALUES (2,'5',100);
INSERT INTO `threshold_ranges` (`id`,`probabilty_range`,`cost_range`) VALUES (3,'10',200);
INSERT INTO `threshold_ranges` (`id`,`probabilty_range`,`cost_range`) VALUES (4,'15',300);
INSERT INTO `threshold_ranges` (`id`,`probabilty_range`,`cost_range`) VALUES (5,'20',500);
INSERT INTO `threshold_ranges` (`id`,`probabilty_range`,`cost_range`) VALUES (6,'25',750);
INSERT INTO `threshold_ranges` (`id`,`probabilty_range`,`cost_range`) VALUES (7,'30',1000);
INSERT INTO `threshold_ranges` (`id`,`probabilty_range`,`cost_range`) VALUES (8,'35',1250);
INSERT INTO `threshold_ranges` (`id`,`probabilty_range`,`cost_range`) VALUES (9,'40',1500);
INSERT INTO `threshold_ranges` (`id`,`probabilty_range`,`cost_range`) VALUES (10,'45',1750);
INSERT INTO `threshold_ranges` (`id`,`probabilty_range`,`cost_range`) VALUES (11,'50',2000);
INSERT INTO `threshold_ranges` (`id`,`probabilty_range`,`cost_range`) VALUES (12,'55',2500);
INSERT INTO `threshold_ranges` (`id`,`probabilty_range`,`cost_range`) VALUES (13,'60',3000);
INSERT INTO `threshold_ranges` (`id`,`probabilty_range`,`cost_range`) VALUES (14,'65',3500);
INSERT INTO `threshold_ranges` (`id`,`probabilty_range`,`cost_range`) VALUES (15,'70',4000);
INSERT INTO `threshold_ranges` (`id`,`probabilty_range`,`cost_range`) VALUES (16,'75',4500);
INSERT INTO `threshold_ranges` (`id`,`probabilty_range`,`cost_range`) VALUES (17,'80',5000);
INSERT INTO `threshold_ranges` (`id`,`probabilty_range`,`cost_range`) VALUES (18,'85',7500);
INSERT INTO `threshold_ranges` (`id`,`probabilty_range`,`cost_range`) VALUES (19,'90',10000);
INSERT INTO `threshold_ranges` (`id`,`probabilty_range`,`cost_range`) VALUES (20,'95',15000);
INSERT INTO `threshold_ranges` (`id`,`probabilty_range`,`cost_range`) VALUES (21,'100',20000);

INSERT INTO `referral_actions` (`referral_action_id`,`referral_action_text`) VALUES (0,'Deny');
INSERT INTO `referral_actions` (`referral_action_id`,`referral_action_text`) VALUES (1,'Authorize');
INSERT INTO `referral_actions` (`referral_action_id`,`referral_action_text`) VALUES (2,'Management Review');

INSERT INTO `note_type` (`id`,`text`) VALUES (1,'Patient');
INSERT INTO `note_type` (`id`,`text`) VALUES (2,'Referral');
INSERT INTO `note_type` (`id`,`text`) VALUES (3,'System');

INSERT INTO `entity_level2_labels` (`id`,`text`) VALUES (2,'Health Alliance');
INSERT INTO `entity_level2_labels` (`id`,`text`) VALUES (3,'Wellness Alert');
INSERT INTO `entity_level2_labels` (`id`,`text`) VALUES (4,'USMed');

INSERT INTO `entity_level1_labels` (`id`,`text`) VALUES (2,'Physical Therapy');
INSERT INTO `entity_level1_labels` (`id`,`text`) VALUES (3,'Orthopedics');
INSERT INTO `entity_level1_labels` (`id`,`text`) VALUES (4,'Chiropractic');
INSERT INTO `entity_level1_labels` (`id`,`text`) VALUES (5,'Mental Health');
INSERT INTO `entity_level1_labels` (`id`,`text`) VALUES (6,'Dermatology');
INSERT INTO `entity_level1_labels` (`id`,`text`) VALUES (7,'Internal Medicine');
INSERT INTO `entity_level1_labels` (`id`,`text`) VALUES (8,'Family Practice');
INSERT INTO `entity_level1_labels` (`id`,`text`) VALUES (9,'Optometry');
INSERT INTO `entity_level1_labels` (`id`,`text`) VALUES (10,'Rheumatology');

