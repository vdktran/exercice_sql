-- REQUETES PAGE UTILISATEURS

SELECT * FROM articles LEFT JOIN comments ON comments.article_id=articles.id_articles WHERE articles.author=? ORDER BY articles.articles_createdAt ASC, comments.createdAt DESC;

--  REQUTETES PAGE CATEGORIE


SELECT * FROM articles_categories_association FULL OUTER JOIN categories ON categories.categorie_id = articles_categories_association.categorie_id FULL OUTER JOIN articles ON articles.id_articles = articles_categories_association.article_id WHERE categorie_id=? ORDER BY articles_createdAt DESC;

--  REQUETES PAGE UTILISATEUR

SELECT * FROM articles RIGHT JOIN comments ON articles.id_article = comments.article_id WHERE author=? ORDER BY articles_createdAt DESC;

-- REQUETE PAGE ARTICLE 

SELECT * FROM articles RIGHT JOIN comments ON articles.id_article = comments.article_id WHERE article_id=? ORDER BY createdAt DESC;

-- REQUETE PAGE ADMIN 

-- ADD ARTICLES

INSERT * FROM articles VALUES ?;

-- DELETE ARTICLES 

DELETE FROM articles WHERE id_article=?;

-- UPDATE ARTICLES

UPDATE articles 
SET title ='', 
content='',
resume='',
articles_createdAt='',
author='' 
WHERE id_article=?;

-- NOMBRE D'ARTICLES

SELECT COUNT(id_article)FROM articles;

-- NOMBRE DE CATEGORIES

SELECT COUNT(categorie_id) FROM categories;

-- NOMBRE D'ARTICLES POUR CHAQUE CATEGORIES

SELECT COUNT(article_id) FROM articles_categories_association WHERE categorie_id=?;



