DROP TABLE IF EXISTS "auth_group";
CREATE TABLE "auth_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(80) NOT NULL UNIQUE);
DROP TABLE IF EXISTS "auth_group_permissions";
CREATE TABLE "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id"), "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"), UNIQUE ("group_id", "permission_id"));
DROP TABLE IF EXISTS "auth_permission";
CREATE TABLE "auth_permission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id"), "codename" varchar(100) NOT NULL, "name" varchar(255) NOT NULL, UNIQUE ("content_type_id", "codename"));
INSERT INTO "auth_permission" VALUES(1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES(2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES(3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES(4,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES(5,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES(6,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES(7,3,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES(8,3,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES(9,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES(10,4,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES(11,4,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES(12,4,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES(13,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES(14,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES(15,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES(16,6,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES(17,6,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES(18,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES(19,7,'add_episode','Can add episode');
INSERT INTO "auth_permission" VALUES(20,7,'change_episode','Can change episode');
INSERT INTO "auth_permission" VALUES(21,7,'delete_episode','Can delete episode');
DROP TABLE IF EXISTS "auth_user";
CREATE TABLE "auth_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "is_superuser" bool NOT NULL, "username" varchar(30) NOT NULL UNIQUE, "first_name" varchar(30) NOT NULL, "last_name" varchar(30) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "last_login" datetime NULL);
INSERT INTO "auth_user" VALUES(1,'pbkdf2_sha256$20000$pa33HhEcItkl$yD6p3J2c2G/twYKM8b0KIpREwFO4tSsFb3aI7bjRMQ0=',1,'johnny','','','sendfelicemail@gmail.com',1,1,'2015-04-28 22:32:09.558161','2015-04-28 22:33:19.209629');
DROP TABLE IF EXISTS "auth_user_groups";
CREATE TABLE "auth_user_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id"), "group_id" integer NOT NULL REFERENCES "auth_group" ("id"), UNIQUE ("user_id", "group_id"));
DROP TABLE IF EXISTS "auth_user_user_permissions";
CREATE TABLE "auth_user_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id"), "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"), UNIQUE ("user_id", "permission_id"));
DROP TABLE IF EXISTS "django_admin_log";
CREATE TABLE "django_admin_log" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "action_time" datetime NOT NULL, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "action_flag" smallint unsigned NOT NULL, "change_message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type" ("id"), "user_id" integer NOT NULL REFERENCES "auth_user" ("id"));
INSERT INTO "django_admin_log" VALUES(1,'2015-05-11 23:53:11.332343','1','Episode 1',1,'',7,1);
INSERT INTO "django_admin_log" VALUES(2,'2015-05-12 00:24:44.288087','1','Episode 1',2,'Changed script.',7,1);
DROP TABLE IF EXISTS "django_content_type";
CREATE TABLE "django_content_type" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL, UNIQUE ("app_label", "model"));
INSERT INTO "django_content_type" VALUES(1,'admin','logentry');
INSERT INTO "django_content_type" VALUES(2,'auth','permission');
INSERT INTO "django_content_type" VALUES(3,'auth','group');
INSERT INTO "django_content_type" VALUES(4,'auth','user');
INSERT INTO "django_content_type" VALUES(5,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES(6,'sessions','session');
INSERT INTO "django_content_type" VALUES(7,'videoscript','episode');
DROP TABLE IF EXISTS "django_migrations";
CREATE TABLE "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);
INSERT INTO "django_migrations" VALUES(1,'contenttypes','0001_initial','2015-04-28 22:22:36.329911');
INSERT INTO "django_migrations" VALUES(2,'auth','0001_initial','2015-04-28 22:22:36.347211');
INSERT INTO "django_migrations" VALUES(3,'admin','0001_initial','2015-04-28 22:22:36.358561');
INSERT INTO "django_migrations" VALUES(4,'contenttypes','0002_remove_content_type_name','2015-04-28 22:22:36.410661');
INSERT INTO "django_migrations" VALUES(5,'auth','0002_alter_permission_name_max_length','2015-04-28 22:22:36.425057');
INSERT INTO "django_migrations" VALUES(6,'auth','0003_alter_user_email_max_length','2015-04-28 22:22:36.438547');
INSERT INTO "django_migrations" VALUES(7,'auth','0004_alter_user_username_opts','2015-04-28 22:22:36.452251');
INSERT INTO "django_migrations" VALUES(8,'auth','0005_alter_user_last_login_null','2015-04-28 22:22:36.467424');
INSERT INTO "django_migrations" VALUES(9,'auth','0006_require_contenttypes_0002','2015-04-28 22:22:36.468777');
INSERT INTO "django_migrations" VALUES(10,'sessions','0001_initial','2015-04-28 22:22:36.474252');
INSERT INTO "django_migrations" VALUES(11,'videoscript','0001_initial','2015-05-11 22:56:51.691838');
INSERT INTO "django_migrations" VALUES(12,'videoscript','0002_episode_author','2015-05-11 23:51:54.757733');
INSERT INTO "django_migrations" VALUES(13,'videoscript','0003_remove_episode_author','2015-05-11 23:51:54.772312');
INSERT INTO "django_migrations" VALUES(14,'videoscript','0004_episode_author','2015-05-11 23:51:54.783151');
DROP TABLE IF EXISTS "django_session";
CREATE TABLE "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);
INSERT INTO "django_session" VALUES('uooor1cplck1mepybfw0ualx4w57ewks','NjBjNGMyYTZmY2ZjZmIxZmQ5ZWQ2MDU4NGU0NmUzZWU1MDRlYWMwYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4MGEzZDExODViMzM5MDQ4YjY5MDA0MjcxNDliOTg2MjEwOWJjNjQiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2015-05-12 22:33:19.211352');
DROP TABLE IF EXISTS "videoscript_episode";
CREATE TABLE "videoscript_episode" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "title" varchar(200) NOT NULL, "script" text NOT NULL, "added_date" datetime NOT NULL, "aired_date" datetime NULL, "author_id" integer NOT NULL REFERENCES "auth_user" ("id"));
INSERT INTO "videoscript_episode" VALUES(1,'Episode 1','EXT. NYC STREETS.

     Josh glances over at the list Terry gave him looking
     confused.
 
                               JOSH
               Terry what is this?
 
     She nods her head like he should know.
 
                               TERRY
               It’s a list of names I came up with.       
             
                               JOSH         
               But we agreed that we would name him Gatsby.
               Why do you have to make this so complicated?
 
     He gives the list back to Terry.
 
                               TERRY
               I’m not making anything complicated. Why do
               You have to be so picky?
    
     There is small pause.       
             
                               JOSH         
               I’m not being picky.  I’m being logical. There
               Is a difference you know. It’s a dog, it’s not
               a baby.  We have so many other things to
               worry about and this is one thing that should
               not be on the list.
 
     Before he could finish his sentence his phone rings.
 
                               JOSH
                         (In a whisper lower voice)
               This is really not a good time but I will
               call you back in about an hour? Actually you
               can just text me.
 
 
                               TERRY         
               Who was that?
 
                               JOSH
               The contact that may sublet the studio. I can’t
               Wait to move into the bigger apartment.
 
                               TERRY         
               Hope it happens fast. Now back to the list.
 
 
 
                 
 
She gives the list back to Josh.
 
                               JOSH
                     (Josh reads the list of names)
                Bandit
                Astro
                Boomer
                Duke
                Clifford.  Really Clifford?
 
                               TERRY         
                So do you like any of them?
 
                                  JOSH         
                Not really.
 
                               TERRY         
                Why do you like about Astro or Bandit?
 
                               JOSH         
                It’s not that I don’t like it.  It’s that I
     already have a name that I really like, why can’t
     we just go with that.  I always had that name in mind.   
     Let’s try a visualization exercise.
 
                    TERRY
     A what?
 
                    JOSH
                Close your eyes and say it 3 times slowly. Like this.
 
Josh Closes his eyes and demonstrates for Terry.
 
                               JOSH
                 Gatsby
                 Gatsby
               Gatsby
                      (Josh smiles at Terry)
                 Now your turn.
 
Terry Closes her eyes and repeats slowly.
                
                               TERRY              
                Gatsby
                Gatsby
                Gatsby  
 
Terry keeps her eyes close for 2 seconds after the slow repeat.               
                               
                               JOSH
                Well?
              
                               TERRY
                I mean.  I guess it’s not that bad. Saying it
                slowly sort of helped.  If I give into the
                name, you gotta meet me halfway on that thing.
 
                               JOSH
                Oh man.  Not the “thing”.  Maybe we should have
                Gotten a cat.
 
              
 

','2015-05-11 23:52:15',NULL,1);
CREATE INDEX "auth_group_permissions_0e939a4f" ON "auth_group_permissions" ("group_id");
CREATE INDEX "auth_group_permissions_8373b171" ON "auth_group_permissions" ("permission_id");
CREATE INDEX "auth_permission_417f1b1c" ON "auth_permission" ("content_type_id");
CREATE INDEX "auth_user_groups_0e939a4f" ON "auth_user_groups" ("group_id");
CREATE INDEX "auth_user_groups_e8701ad4" ON "auth_user_groups" ("user_id");
CREATE INDEX "auth_user_user_permissions_8373b171" ON "auth_user_user_permissions" ("permission_id");
CREATE INDEX "auth_user_user_permissions_e8701ad4" ON "auth_user_user_permissions" ("user_id");
CREATE INDEX "django_admin_log_417f1b1c" ON "django_admin_log" ("content_type_id");
CREATE INDEX "django_admin_log_e8701ad4" ON "django_admin_log" ("user_id");
CREATE INDEX "django_session_de54fa62" ON "django_session" ("expire_date");
CREATE INDEX "videoscript_episode_4f331e2f" ON "videoscript_episode" ("author_id");
