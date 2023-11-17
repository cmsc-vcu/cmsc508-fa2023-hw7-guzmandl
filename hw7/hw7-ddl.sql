# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS peopleroles;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS skills;
-- SET FOREIGN_KEY_CHECKS = 1;


# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    tag VARCHAR(255) NOT NULL,
    url VARCHAR(255) DEFAULT NULL,
    time_commitment VARCHAR(255) DEFAULT NULL
);


# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills (id, name, description, tag) VALUES
(1, 'Data Wizardry', 'Mastering the art of handling and analyzing data with precision and creativity.', 'Skill 1'),
(2, 'Code Alchemist', 'Transforming complex problems into elegant and efficient code solutions.', 'Skill 2'),
(3, 'Cyber Sentinel', 'Guardian of digital realms, skilled in cybersecurity and threat detection.', 'Skill 3'),
(4, 'User Experience Maestro', 'Crafting seamless and delightful user experiences that captivate and engage.', 'Skill 4'),
(5, 'Innovation Guru', 'Pioneering new ideas and solutions to drive innovation and progress.', 'Skill 5'),
(6, 'Agile Maestro', 'Mastering the agile methodology for streamlined and efficient project management.', 'Skill 6'),
(7, 'Cloud Whisperer', 'Harnessing the power of the cloud to optimize and scale IT infrastructure.', 'Skill 7'),
(8, 'Social Media Sorcerer', 'Commanding the realms of social media, creating impactful online presence.', 'Skill 8');



# Section 4
# Create people(id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    linkedin_url VARCHAR(255),
    headshot_url VARCHAR(255),
    discord_handle VARCHAR(255),
    brief_bio VARCHAR(255),
    date_joined DATE NOT NULL
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people (id, last_name, first_name, date_joined) VALUES
(1, 'Person 1', 'John', '2023-02-01'),
(2, 'Person 2', 'Alice', '2023-02-01'),
(3, 'Person 3', 'Bob', '2023-02-01'),
(4, 'Person 4', 'Eva', '2023-02-01'),
(5, 'Person 5', 'Michael', '2023-02-01'),
(6, 'Person 6', 'Sophia', '2023-02-01'),
(7, 'Person 7', 'Vani', '2023-02-01'),
(8, 'Person 8', 'Jessie', '2023-02-01'),
(9, 'Person 9', 'Emily', '2023-02-01'),
(10, 'Person 10', 'Charles', '2023-02-01');


# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
    id INT AUTO_INCREMENT PRIMARY KEY,
    skills_id INT,
    people_id INT,
    date_acquired DATE,
    FOREIGN KEY (skills_id) REFERENCES skills(id),
    FOREIGN KEY (people_id) REFERENCES people(id)
);

# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

INSERT INTO peopleskills (skills_id, people_id, date_acquired) VALUES
-- Person 1 has skills 1,3,6;
(1, 1, '2023-01-01'),
(3, 1, '2023-02-15'),
(6, 1, '2023-03-20'),
(3, 2, '2023-02-10'),
(4, 2, '2023-03-25'),
(5, 2, '2023-04-05'),
(1, 3, '2023-01-05'),
(5, 3, '2023-03-15'),
(3, 5, '2023-02-20'),
(6, 5, '2023-04-10'),
(2, 6, '2023-01-15'),
(3, 6, '2023-02-25'),
(4, 6, '2023-03-30'),
(3, 7, '2023-02-22'),
(5, 7, '2023-03-18'),
(6, 7, '2023-04-02'),
(1, 8, '2023-01-03'),
(3, 8, '2023-02-12'),
(5, 8, '2023-03-22'),
(6, 8, '2023-04-08'),
(2, 9, '2023-01-08'),
(5, 9, '2023-03-10'),
(6, 9, '2023-04-15'),
(1, 10, '2023-01-10'),
(4, 10, '2023-03-05'),
(5, 10, '2023-04-12');
 

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    sort_priority INT
);



# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles (id, name, sort_priority) VALUES
(1, 'Designer', 10),
(2, 'Developer', 20),
(3, 'Recruit', 30),
(4, 'Team Lead', 40),
(5, 'Boss', 50),
(6, 'Mentor', 60);


# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    people_id INT,
    role_id INT,
    date_assigned DATE,
    FOREIGN KEY (people_id) REFERENCES people(id),
    FOREIGN KEY (role_id) REFERENCES roles(id)
);


# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES
    (1, 2, '2023-11-16'),  -- Person 1 is Developer
    (2, 5, '2023-11-16'),  -- Person 2 is Boss
    (2, 6, '2023-11-16'),  -- Person 2 is Mentor
    (3, 2, '2023-11-16'),  -- Person 3 is Developer
    (3, 4, '2023-11-16'),  -- Person 3 is Team Lead
    (4, 3, '2023-11-16'),  -- Person 4 is Recruit
    (5, 3, '2023-11-16'),  -- Person 5 is Recruit
    (6, 2, '2023-11-16'),  -- Person 6 is Developer
    (6, 1, '2023-11-16'),  -- Person 6 is Designer
    (7, 1, '2023-11-16'),  -- Person 7 is Designer
    (8, 1, '2023-11-16'),  -- Person 8 is Designer
    (8, 4, '2023-11-16'),  -- Person 8 is Team Lead
    (9, 2, '2023-11-16'),  -- Person 9 is Developer
    (10, 2, '2023-11-16'), -- Person 10 is Developer
    (10, 1, '2023-11-16'); -- Person 10 is Designer