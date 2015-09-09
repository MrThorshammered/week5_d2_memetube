drop table videos;

create table videos (
  id serial8 primary key,
  title varchar(255), 
  url text,
  description varchar(2000)
  
);

INSERT INTO videos (title, url, description) VALUES ('The Ultimate Goat Edition Supercut', 'wfpL6_0OBuA', 'funny goat compilation');
INSERT INTO videos (title, url, description) VALUES ('Quest of the Manwhore', '-zmZfoMkVt8', 'funny music video by sexual lobster');
