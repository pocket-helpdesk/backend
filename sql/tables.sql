-- Create tables for backend

-- Categorizes the associated content
CREATE TABLE tag(
	tag_id bigint,
	tag_name varchar(255),
	tag_description text,
	tag_user_id bigint,
	create_time int,
	last_updated_time int,
	PRIMARY KEY (tag_id, tag_name),
	FOREIGN KEY (tag_user_id) REFERENCES user (user_id)
);

-- Issues
CREATE TABLE issue(
	issue_id bigint,
	issue_tag bigint,
	issue_name varchar(255),
	issue_description text,
	issue_user_id bigint,
	PRIMARY KEY (issue_id, issue_name),
	FOREIGN KEY (issue_tag) REFERENCES tag (tag_id),
	FOREIGN KEY (issue_user_id) REFERENCES user (user_id)
);

-- Knowledge base entries are descriptions of common tasks per
CREATE TABLE knowledge_base(
	kb_id bigint,
	kb_name varchar(255),
	kb_description text,
	kb_content  text,
	kb_is_common int, -- bool
	kb_user_id bigint,
	create_time int,
	last_updated_time int,
	PRIMARY KEY (kb_id, kb_name),
	FOREIGN KEY (kb_id) REFERENCES tag (tag_id),
	FOREIGN KEY (kb_user_id) REFERENCES user (user_id)
);

-- A common response or text stored for forwarding, messaging or emailing
CREATE TABLE template(
	template_id bigint,
	template_name varchar(255),
	template_tag bigint,
	template_content text,
	template_user_id bigint,
	create_time int,
	last_updated_time int,
	PRIMARY KEY (template_id, template_name),
	FOREIGN KEY (template_tag) REFERENCES tag (tag_id),
	FOREIGN KEY (template_user_id) REFERENCES user (user_id)
);

CREATE TABLE user(
	user_id bigint,
	user_name varchar(255),
	created_time int,
	PRIMARY KEY (user_id)
);

-- Quick reminder
--CREATE TABLE reminder(
--);

-- Company details
--CREATE TABLE client(
--);

