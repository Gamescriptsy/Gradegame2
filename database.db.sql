BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS game (
	id INTEGER NOT NULL, 
	name VARCHAR(100) NOT NULL, 
	image VARCHAR(200) NOT NULL, 
	PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS "transaction" (
	id INTEGER NOT NULL, 
	user_id INTEGER NOT NULL, 
	game_id INTEGER NOT NULL, 
	user_game_id VARCHAR(50) NOT NULL, 
	item_name VARCHAR(100) NOT NULL, 
	amount FLOAT NOT NULL, 
	payment_method VARCHAR(50) NOT NULL, 
	status VARCHAR(20) NOT NULL, 
	created_at DATETIME, 
	PRIMARY KEY (id), 
	FOREIGN KEY(user_id) REFERENCES user (id), 
	FOREIGN KEY(game_id) REFERENCES game (id)
);
CREATE TABLE IF NOT EXISTS user (
	id INTEGER NOT NULL, 
	username VARCHAR(80) NOT NULL, 
	email VARCHAR(120) NOT NULL, 
	password_hash VARCHAR(128) NOT NULL, 
	PRIMARY KEY (id), 
	UNIQUE (username), 
	UNIQUE (email)
);
INSERT INTO "game" ("id","name","image") VALUES (1,'Free Fire','images/KATEGORI_GAME/FINALLL.png'),
 (2,'Mobile Legends','images/KATEGORI_GAME/ML.jpeg'),
 (3,'PUBG Mobile','images/KATEGORI_GAME/PUBG M.jpg');
INSERT INTO "transaction" ("id","user_id","game_id","user_game_id","item_name","amount","payment_method","status","created_at") VALUES (1,1,1,'321129392200','70 Diamonds|9300',9300.0,'bank_transfer','pending','2024-11-25 23:59:57.123373'),
 (2,1,1,'1255232323','50 Diamonds|6800',6800.0,'gopay','pending','2024-11-26 00:02:02.994325'),
 (3,1,1,'1255232323','280 Diamonds|37200',37200.0,'gopay','pending','2024-11-26 00:03:16.343620'),
 (4,1,1,'761954327','860 Diamonds|111500',111500.0,'gopay','pending','2024-11-26 00:11:44.207236'),
 (5,1,1,'761954327','160 Diamonds|21400',21400.0,'gopay','pending','2024-11-26 00:33:45.995384'),
 (6,1,1,'761954327','9290 Diamonds|1184400',1184400.0,'dana','pending','2024-11-26 00:38:43.934064'),
 (7,1,1,'761954327','210 Diamonds|27900',27900.0,'dana','pending','2024-11-26 01:18:55.146174'),
 (8,2,1,'762325349','140 Diamonds|18600',18600.0,'gopay','pending','2024-11-26 01:35:41.264698'),
 (9,3,1,'123456789','Member Mingguan|28200',28200.0,'bank_transfer','pending','2024-11-26 01:43:41.858892');
INSERT INTO "user" ("id","username","email","password_hash") VALUES (1,'4332301027','donutyo7@gmail.com','scrypt:32768:8:1$WBd3IlJAJ0TKJrl2$ad8b6d903c3a528695a479c4126e76f49919a04b16dc919072c419de4e0e6eeb8794ec177d198ebf8f8b2ea43c9251329b4778a79b96f361deea03f9c2ff6266'),
 (2,'rio.4332301027','Rio.4332301027@students.polibatam.ac.id','scrypt:32768:8:1$UCNQT0ngik3OGr3e$941affd50505d90fab122ddf9b7100c35c0a4862de07028cf981c400af7bfac37a96fd15dad68de0d65778d0112b51b2490313c56ee761c9628c2c1e7a431017'),
 (3,'novriska','novriskaindahp@gmail.com','scrypt:32768:8:1$Pp2Xm7QgtLXvIqTw$58a90662ec09dc9bcc9579f7ac2543ce59a913010989f2288c8c389a9e20346ea3e8440455b5a0a0084a053aa5469694c80b3dab3b4e80e4b2acd788aee695f2');
COMMIT;
