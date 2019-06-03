CREATE DATABASE blog_exercise CHARACTER SET 'utf8';

USE blog_exercise;


-- Structure de la table 'articles' 
CREATE TABLE articles (
  id_article int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  title varchar(45) ,
  content varchar(4000),
  resume varchar(400) ,
  articles_createdAt date,
  author int(11) NOT NULL,
  index (articles_createdAt)
  ) 
ENGINE=InnoDB;


CREATE TABLE articles_categories_association (
  a_c_id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  categorie_id int(11) NOT NULL,
  article_id int(11) NOT NULL
) 
ENGINE=InnoDB;



CREATE TABLE categories (
  categorie_id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  categorie_name varchar(45) ,
  categorie_description varchar(400)
) ENGINE=InnoDB;




CREATE TABLE comments (
  comment_id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  comment_content varchar(1000) ,
  createdAt datetime ,
  user_id int(11) NOT NULL,
  article_id int(11) NOT NULL,
  subcomment int(11) NOT NULL,
  index(createdAt DESC)
) ENGINE=InnoDB;




CREATE TABLE photos (
  photo_id int(11)PRIMARY KEY NOT NULL AUTO_INCREMENT,
  url_path varchar(500) ,
  article_id int(11) NOT NULL
) ENGINE=InnoDB;





CREATE TABLE users (
  user_id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  pseudo varchar(100) ,
  email varchar(250) ,
  password varchar(250) ,
  role_of_user int(11)
) ENGINE=InnoDB;



ALTER TABLE articles
  ADD CONSTRAINT author_article_fk FOREIGN KEY (author) REFERENCES users (user_id);



ALTER TABLE articles_categories_association
  ADD CONSTRAINT ac_article_fk FOREIGN KEY (article_id) REFERENCES articles (id_article),
  ADD CONSTRAINT ac_categorie_fk FOREIGN KEY (categorie_id) REFERENCES categories (categorie_id);



ALTER TABLE comments
  ADD CONSTRAINT article_comment_fk FOREIGN KEY (article_id) REFERENCES articles (id_article),
  ADD CONSTRAINT user_comment_fk FOREIGN KEY (user_id) REFERENCES users (user_id);



ALTER TABLE photos
  ADD CONSTRAINT photo_article_fk FOREIGN KEY (article_id) REFERENCES articles (id_article);
