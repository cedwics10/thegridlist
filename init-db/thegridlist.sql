DROP TABLE IF EXISTS task_tag CASCADE;

DROP TABLE IF EXISTS tag CASCADE;

DROP TABLE IF EXISTS task CASCADE;

DROP TABLE IF EXISTS list CASCADE;

DROP TABLE IF EXISTS member CASCADE;

CREATE TABLE member (
    mem_id SERIAL PRIMARY KEY,
    mem_username VARCHAR(50) UNIQUE NOT NULL,
    mem_email VARCHAR(100) UNIQUE NOT NULL,
    mem_password_hash VARCHAR(255) NOT NULL,
    mem_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE list (
    lis_id SERIAL PRIMARY KEY,
    lis_member_id INTEGER NOT NULL,
    lis_title VARCHAR(100) NOT NULL,
    lis_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    lis_updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE task (
    tas_id SERIAL PRIMARY KEY,
    tas_list_id INTEGER NOT NULL,
    tas_parent_task_id INTEGER,
    tas_title TEXT NOT NULL,
    tas_description TEXT,
    tas_due_date DATE,
    tas_priority INTEGER CHECK (
        tas_priority BETWEEN 1
        AND 5
    ),
    tas_is_done BOOLEAN DEFAULT FALSE,
    tas_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT unique_task_title_in_list UNIQUE (tas_list_id, tas_title)
);

CREATE TABLE tag (
    tag_id SERIAL PRIMARY KEY,
    tag_name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE task_tag (
    tat_task_id INTEGER NOT NULL,
    tat_tag_id INTEGER NOT NULL,
    PRIMARY KEY (tat_task_id, tat_tag_id)
);

ALTER TABLE
    list
ADD
    CONSTRAINT fk_list_member FOREIGN KEY (lis_member_id) REFERENCES member(mem_id) ON DELETE CASCADE;

ALTER TABLE
    task
ADD
    CONSTRAINT fk_task_list FOREIGN KEY (tas_list_id) REFERENCES list(lis_id) ON DELETE CASCADE;

ALTER TABLE
    task
ADD
    CONSTRAINT fk_task_parent FOREIGN KEY (tas_parent_task_id) REFERENCES task(tas_id) ON DELETE CASCADE;

ALTER TABLE
    task_tag
ADD
    CONSTRAINT fk_tasktag_task FOREIGN KEY (tat_task_id) REFERENCES task(tas_id) ON DELETE CASCADE;

ALTER TABLE
    task_tag
ADD
    CONSTRAINT fk_tasktag_tag FOREIGN KEY (tat_tag_id) REFERENCES tag(tag_id) ON DELETE CASCADE;