-- Create tables for backend

-- Categorizes the associated content
CREATE TABLE tag(
	tag_id bigint,
	tag_name varchar(255),
	tag_description text,
	create_time int,
	last_updated_time int,
	PRIMARY KEY (tag_id, tag_name, tag_description)
)

-- Issues
CREATE TABLE issue(
	issue_id bigint,
	issue_tag bigint,
	issue_name varchar(255),
	issue_description text,
	PRIMARY KEY (issue_id, issue_name),
	FOREIGN KEY (issue_tag) REFERENCES tag (tag_id)
);

-- Knowledge base entries are descriptions of common tasks per
CREATE TABLE knowledge_base(
	kb_id bigint,
	kb_id bigint
	kb_name varchar(255),
	kb_description text,
	kb_content  text,
	kb_is_common int, -- bool
	create_time int,
	last_updated_time int,
	PRIMARY KEY (kb_id, kb_name),
	FOREIGN KEY (kb_id) REFERENCES tag (tag_id)
);

-- A common response or text stored for forwarding, messaging or emailing
CREATE TABLE template(
	template_id bigint,
	template_name varchar(255),
	template_tag bigint,
	template_content text,
	create_time int,
	last_updated_time int,
	PRIMARY KEY (template_id, template_name),
	FOREIGN KEY (template_tag) REFERENCES tag (tag_id)
);

-- Quick reminder
--CREATE TABLE reminder(
--);

-- Company details
--CREATE TABLE client(
--);

