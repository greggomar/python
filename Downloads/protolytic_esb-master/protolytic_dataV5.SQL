CREATE TABLE `protolytic_claims_assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `claim_number` varchar(45) DEFAULT NULL,
  `adjuster_name` varchar(45) DEFAULT NULL,
  `date_from` datetime DEFAULT NULL,
  `date_to` datetime DEFAULT NULL,
  `notes` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE protolytic_referral_overrides (id int(11) NOT NULL AUTO_INCREMENT, 
	claim_number varchar(45) DEFAULT NULL,
	referral_number varchar(45) DEFAULT NULL,
	adjuster_name varchar(90) DEFAULT NULL, 
	date datetime DEFAULT NULL, PRIMARY KEY (id)
	) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

CREATE TABLE `protolytic_referral_history` (
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
