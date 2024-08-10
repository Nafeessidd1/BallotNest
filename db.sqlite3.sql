BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "account_customuser" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"first_name"	varchar(150) NOT NULL,
	"last_name"	varchar(150) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"email"	varchar(254) NOT NULL UNIQUE,
	"user_type"	varchar(1) NOT NULL,
	"created_at"	datetime NOT NULL,
	"updated_at"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "account_customuser_groups" (
	"id"	integer NOT NULL,
	"customuser_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("customuser_id") REFERENCES "account_customuser"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "account_customuser_user_permissions" (
	"id"	integer NOT NULL,
	"customuser_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("customuser_id") REFERENCES "account_customuser"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "account_customuser"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "voting_position" (
	"id"	integer NOT NULL,
	"name"	varchar(50) NOT NULL UNIQUE,
	"max_vote"	integer NOT NULL,
	"priority"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "voting_candidate" (
	"id"	integer NOT NULL,
	"fullname"	varchar(50) NOT NULL,
	"photo"	varchar(100) NOT NULL,
	"bio"	text NOT NULL,
	"position_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("position_id") REFERENCES "voting_position"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "voting_voter" (
	"id"	integer NOT NULL,
	"phone"	varchar(11) NOT NULL UNIQUE,
	"otp"	varchar(10),
	"verified"	bool NOT NULL,
	"voted"	bool NOT NULL,
	"otp_sent"	integer NOT NULL,
	"admin_id"	integer NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("admin_id") REFERENCES "account_customuser"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "voting_votes" (
	"id"	integer NOT NULL,
	"candidate_id"	integer NOT NULL,
	"position_id"	integer NOT NULL,
	"voter_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("candidate_id") REFERENCES "voting_candidate"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("position_id") REFERENCES "voting_position"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("voter_id") REFERENCES "voting_voter"("id") DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO "django_migrations" VALUES (1,'contenttypes','0001_initial','2024-07-28 06:59:51.933503');
INSERT INTO "django_migrations" VALUES (2,'contenttypes','0002_remove_content_type_name','2024-07-28 06:59:51.937827');
INSERT INTO "django_migrations" VALUES (3,'auth','0001_initial','2024-07-28 06:59:51.942783');
INSERT INTO "django_migrations" VALUES (4,'auth','0002_alter_permission_name_max_length','2024-07-28 06:59:51.945184');
INSERT INTO "django_migrations" VALUES (5,'auth','0003_alter_user_email_max_length','2024-07-28 06:59:51.947064');
INSERT INTO "django_migrations" VALUES (6,'auth','0004_alter_user_username_opts','2024-07-28 06:59:51.949633');
INSERT INTO "django_migrations" VALUES (7,'auth','0005_alter_user_last_login_null','2024-07-28 06:59:51.951246');
INSERT INTO "django_migrations" VALUES (8,'auth','0006_require_contenttypes_0002','2024-07-28 06:59:51.951772');
INSERT INTO "django_migrations" VALUES (9,'auth','0007_alter_validators_add_error_messages','2024-07-28 06:59:51.966477');
INSERT INTO "django_migrations" VALUES (10,'auth','0008_alter_user_username_max_length','2024-07-28 06:59:51.968182');
INSERT INTO "django_migrations" VALUES (11,'auth','0009_alter_user_last_name_max_length','2024-07-28 06:59:51.969794');
INSERT INTO "django_migrations" VALUES (12,'auth','0010_alter_group_name_max_length','2024-07-28 06:59:51.971959');
INSERT INTO "django_migrations" VALUES (13,'auth','0011_update_proxy_permissions','2024-07-28 06:59:51.973516');
INSERT INTO "django_migrations" VALUES (14,'auth','0012_alter_user_first_name_max_length','2024-07-28 06:59:51.975078');
INSERT INTO "django_migrations" VALUES (15,'account','0001_initial','2024-07-28 06:59:51.978250');
INSERT INTO "django_migrations" VALUES (16,'admin','0001_initial','2024-07-28 06:59:51.981207');
INSERT INTO "django_migrations" VALUES (17,'admin','0002_logentry_remove_auto_add','2024-07-28 06:59:51.984506');
INSERT INTO "django_migrations" VALUES (18,'admin','0003_logentry_add_action_flag_choices','2024-07-28 06:59:51.986572');
INSERT INTO "django_migrations" VALUES (19,'sessions','0001_initial','2024-07-28 06:59:51.987773');
INSERT INTO "django_migrations" VALUES (20,'voting','0001_initial','2024-07-28 06:59:51.994625');
INSERT INTO "django_content_type" VALUES (1,'admin','logentry');
INSERT INTO "django_content_type" VALUES (2,'auth','permission');
INSERT INTO "django_content_type" VALUES (3,'auth','group');
INSERT INTO "django_content_type" VALUES (4,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES (5,'sessions','session');
INSERT INTO "django_content_type" VALUES (6,'account','customuser');
INSERT INTO "django_content_type" VALUES (7,'voting','position');
INSERT INTO "django_content_type" VALUES (8,'voting','candidate');
INSERT INTO "django_content_type" VALUES (9,'voting','voter');
INSERT INTO "django_content_type" VALUES (10,'voting','votes');
INSERT INTO "auth_permission" VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES (4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES (5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES (6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES (7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES (8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES (9,3,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES (10,3,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES (11,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES (12,3,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES (13,4,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES (14,4,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES (15,4,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES (16,4,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES (17,5,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES (18,5,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES (19,5,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES (20,5,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES (21,6,'add_customuser','Can add user');
INSERT INTO "auth_permission" VALUES (22,6,'change_customuser','Can change user');
INSERT INTO "auth_permission" VALUES (23,6,'delete_customuser','Can delete user');
INSERT INTO "auth_permission" VALUES (24,6,'view_customuser','Can view user');
INSERT INTO "auth_permission" VALUES (25,7,'add_position','Can add position');
INSERT INTO "auth_permission" VALUES (26,7,'change_position','Can change position');
INSERT INTO "auth_permission" VALUES (27,7,'delete_position','Can delete position');
INSERT INTO "auth_permission" VALUES (28,7,'view_position','Can view position');
INSERT INTO "auth_permission" VALUES (29,8,'add_candidate','Can add candidate');
INSERT INTO "auth_permission" VALUES (30,8,'change_candidate','Can change candidate');
INSERT INTO "auth_permission" VALUES (31,8,'delete_candidate','Can delete candidate');
INSERT INTO "auth_permission" VALUES (32,8,'view_candidate','Can view candidate');
INSERT INTO "auth_permission" VALUES (33,9,'add_voter','Can add voter');
INSERT INTO "auth_permission" VALUES (34,9,'change_voter','Can change voter');
INSERT INTO "auth_permission" VALUES (35,9,'delete_voter','Can delete voter');
INSERT INTO "auth_permission" VALUES (36,9,'view_voter','Can view voter');
INSERT INTO "auth_permission" VALUES (37,10,'add_votes','Can add votes');
INSERT INTO "auth_permission" VALUES (38,10,'change_votes','Can change votes');
INSERT INTO "auth_permission" VALUES (39,10,'delete_votes','Can delete votes');
INSERT INTO "auth_permission" VALUES (40,10,'view_votes','Can view votes');
INSERT INTO "account_customuser" VALUES (1,'pbkdf2_sha256$720000$4UHfEec8RYQKktMYOXaypq$4i28ng3wwbpxFS1NGEvcJq2s/8oazjWRwa5LaQFP3vs=','2024-07-28 07:49:06.524039',0,'Nafees','Siddiqui',0,1,'2024-07-28 07:00:47.204136','nafeessiddiqi861@gmail.com','2','2024-07-28 07:00:47.415350','2024-07-28 07:00:47.415359');
INSERT INTO "account_customuser" VALUES (2,'pbkdf2_sha256$720000$lVRUwlIahlDYEY9LDM2rDO$Nei0kPOA3gFnbIjFYJpG8OyGkNPMkbI3OpJN/Knh00Y=','2024-07-30 11:24:54.533243',1,'Administrator','System',1,1,'2024-07-28 07:10:00.228118','nafeess1si21ad035@gmail.com','1','2024-07-28 07:10:00.431054','2024-07-28 07:10:00.431067');
INSERT INTO "account_customuser" VALUES (3,'pbkdf2_sha256$720000$DViubwYExnDGBEIE35sVsK$XCvs2k8c2TZnfj05XJ8PYyM7jOHS7VckTBu3ssAcHLQ=','2024-07-28 09:02:43.994183',0,'ali','inzamam',0,1,'2024-07-28 07:47:30.414301','inzamam@gmail.com','2','2024-07-28 07:47:30.623777','2024-07-28 07:47:30.623786');
INSERT INTO "account_customuser" VALUES (4,'pbkdf2_sha256$720000$cn8T5kCIP7R9O9sD7ow2YX$irVbXJ2fXm8/k8GEbdrC+HWJA8oSCOYBK1py01p0XRo=','2024-07-28 08:21:50.572644',0,'singh','manish',0,1,'2024-07-28 08:21:40.849276','manish@gmail.com','2','2024-07-28 08:21:41.062835','2024-07-28 08:21:41.062842');
INSERT INTO "account_customuser" VALUES (5,'pbkdf2_sha256$720000$lX1WWNM2acNzNCIXGDUqJi$Bs4GIa77H6Ny/NufTwlpiqDcxSurv03ranPp3DH+wMg=','2024-07-28 09:03:18.799416',0,'rai','aman',0,1,'2024-07-28 09:03:12.602766','aman@gmail.com','2','2024-07-28 09:03:12.814565','2024-07-28 09:03:12.814573');
INSERT INTO "account_customuser" VALUES (6,'pbkdf2_sha256$720000$jydvcQnFnhm54CnckPfgju$4F2bIjlHK2hCDcdaWX63mCwZkFJeBKyh+WfoMyEMfOQ=','2024-07-28 11:47:33.461106',0,'jha','narendra',0,1,'2024-07-28 11:47:17.196967','narendra@gmail.com','2','2024-07-28 11:47:17.407873','2024-07-28 11:47:17.407881');
INSERT INTO "account_customuser" VALUES (7,'pbkdf2_sha256$720000$Xb1fmwbELTMCs07v5hn4Fx$QD1XJJ6ym4wAs8njfx6CuuuC7m7vJB0PgID30OYadxM=','2024-07-28 11:51:02.523655',0,'khan','deepu',0,1,'2024-07-28 11:50:46.307290','deepu@gmail.com','2','2024-07-28 11:50:46.516891','2024-07-28 11:50:46.516900');
INSERT INTO "account_customuser" VALUES (8,'pbkdf2_sha256$720000$bxko7z6k5wUckkiJ7VYzgk$EJIjZ3Jg+gbZ9Mv0gbTgewGK/0XgWaN1F+xRDXWJyAA=','2024-07-28 13:22:57.235606',0,'chirag','chaitanya',0,1,'2024-07-28 13:22:44.047144','chaitanya@gmail.com','2','2024-07-28 13:22:44.258134','2024-07-28 13:22:44.258143');
INSERT INTO "account_customuser" VALUES (9,'pbkdf2_sha256$720000$gwV4N5ePPMXN1izPWGac6m$FvcGIgynQuCTkRpkm953uGdlHVrKtjMrPWHat8t5p5g=','2024-07-30 07:19:22.675667',0,'jnj','aashu',0,1,'2024-07-30 07:19:12.562418','aashu@gmail.com','2','2024-07-30 07:19:12.768826','2024-07-30 07:19:12.768834');
INSERT INTO "account_customuser" VALUES (10,'pbkdf2_sha256$720000$BBqiI6FDUlKajpKiR7QOkq$3fPzulenjxePSc0d/vFZ8vX1fSW0qqYyrMcKSb5CDxA=','2024-08-01 19:52:11.759451',0,'qw','fjqwwf',0,1,'2024-08-01 18:12:14.289750','nafees@gmail.com','2','2024-08-01 18:12:14.484791','2024-08-01 18:12:14.484800');
INSERT INTO "account_customuser" VALUES (11,'pbkdf2_sha256$720000$WOzEkVMQBDLl14A2aYUxvl$cI7WqCf6SCmSvKxmoI/dEK44PlIPlqt19gPw63EHJjg=','2024-08-01 19:47:57.870018',1,'Administrator','System',1,1,'2024-08-01 18:15:42.561242','nafeess.1si21ad035@gmail.com','1','2024-08-01 18:15:42.752665','2024-08-01 18:15:42.752672');
INSERT INTO "django_session" VALUES ('zpgg00hto478kq05ik5jfyd24gcjldia','.eJxVi8sKwjAQRf9l1lKaV5O4FPodYWYyIUWtYJuV-O9tQUGX99xzXpCwrTW1RZ5pynAGBadfRshXmY8DmR9tXju543T78m481uUj_ZUVl7pn0kdNQuRdKYYtqsBKmx4DFacpSyzRMmkrQi4rbckOIceBlTfipSC8N1tVNlY:1sXydJ:JtpI-8jU_OQ40Ux7StIrLodHC5xMJUuFYuJv5NKk9Gs','2024-08-11 07:47:57.077638');
INSERT INTO "django_session" VALUES ('sosecr5exny9o9dncocj22jmp39869oc','.eJxVi8sKwjAQRf9l1lKaV5O4FPodYWYyIUWtYJuV-O9tQUGX99xzXpCwrTW1RZ5pynAGBadfRshXmY8DmR9tXju543T78m481uUj_ZUVl7pn0kdNQuRdKYYtqsBKmx4DFacpSyzRMmkrQi4rbckOIceBlTfipSC8N1tVNlY:1sXyeQ:3SBiVyXyFjlie37lrt1gQgrD7bjJVpzSORQ3zMLyang','2024-08-11 07:49:06.524869');
INSERT INTO "django_session" VALUES ('0a21593835vqz9ktve5vjgr1j2b98v72','.eJxVi0EKwjAQRe-StZQ0mWlGl0LPESaTCSlqBdusxLvbgoIu__vvPU3kttbYFn3EKZuTcebwyxLLRef9YJF7m9dObzxdv7wb93X-SH9l5aVuWfDBJgogA4kgZ7KiNiNkSexLKqrKCNJzQIdAxR-THYB6H8htJpvXG07UNcQ:1sYkyM:cgAuFod_Lqk6LkRpMcj8UXclNcnLyoqNrhuus8kWt4g','2024-08-13 11:24:54.534295');
INSERT INTO "voting_position" VALUES (1,'CR',2,1);
INSERT INTO "voting_candidate" VALUES (1,'Shubham singh','candidates/splicing.webp','Shubham Singh is a dedicated and proactive candidate standing for the Class Representative (CR) election in the 4th semester. Known for his strong leadership skills and commitment to his peers, Shubham has consistently demonstrated his ability to represent student interests effectively. He aims to foster a collaborative and inclusive environment, ensuring that every student''s voice is heard. With a clear vision for enhancing academic and extracurricular activities, Shubham promises to work tirelessly to address student concerns and improve the overall college experience. His reliability, enthusiasm, and dedication make him an excellent choice for CR.',1);
INSERT INTO "voting_candidate" VALUES (2,'aman rai','candidates/retouch.png','aman rai Known for his strong leadership skills and commitment to his peers, Shubham has consistently demonstrated his ability to represent student interests effectively. He aims to foster a collaborative and inclusive environment, ensuring that every student''s voice is heard. With a clear vision for enhancing academic and extracurricular activities, Shubham promises to work tirelessly to address student concerns and improve the overall college experience. His reliability, enthusiasm, and dedication make him an excellent choice for CR.',1);
INSERT INTO "voting_voter" VALUES (1,'8690057819','823673',0,1,0,1);
INSERT INTO "voting_voter" VALUES (2,'9888321234','0000',1,1,0,3);
INSERT INTO "voting_voter" VALUES (3,'9888148484','0000',1,1,0,4);
INSERT INTO "voting_voter" VALUES (4,'315325353','0000',1,1,0,5);
INSERT INTO "voting_voter" VALUES (5,'34727452521','0000',1,1,0,6);
INSERT INTO "voting_voter" VALUES (6,'9554757819','0000',1,0,0,7);
INSERT INTO "voting_voter" VALUES (7,'4637532783','0000',1,0,0,8);
INSERT INTO "voting_voter" VALUES (8,'12345','0000',1,1,0,9);
INSERT INTO "voting_voter" VALUES (9,'34235235235','0000',1,1,0,10);
INSERT INTO "voting_votes" VALUES (1,1,1,2);
INSERT INTO "voting_votes" VALUES (2,1,1,1);
INSERT INTO "voting_votes" VALUES (3,2,1,3);
INSERT INTO "voting_votes" VALUES (4,1,1,4);
INSERT INTO "voting_votes" VALUES (5,1,1,5);
INSERT INTO "voting_votes" VALUES (6,2,1,8);
INSERT INTO "voting_votes" VALUES (7,1,1,9);
INSERT INTO "voting_votes" VALUES (8,2,1,9);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "account_customuser_groups_customuser_id_group_id_7e51db7b_uniq" ON "account_customuser_groups" (
	"customuser_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "account_customuser_groups_customuser_id_b6c60904" ON "account_customuser_groups" (
	"customuser_id"
);
CREATE INDEX IF NOT EXISTS "account_customuser_groups_group_id_2be9f6d7" ON "account_customuser_groups" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "account_customuser_user_permissions_customuser_id_permission_id_650e378f_uniq" ON "account_customuser_user_permissions" (
	"customuser_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "account_customuser_user_permissions_customuser_id_03bcc114" ON "account_customuser_user_permissions" (
	"customuser_id"
);
CREATE INDEX IF NOT EXISTS "account_customuser_user_permissions_permission_id_f4aec423" ON "account_customuser_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "voting_candidate_position_id_11fc864a" ON "voting_candidate" (
	"position_id"
);
CREATE INDEX IF NOT EXISTS "voting_votes_candidate_id_4f8a611d" ON "voting_votes" (
	"candidate_id"
);
CREATE INDEX IF NOT EXISTS "voting_votes_position_id_2d19ba9a" ON "voting_votes" (
	"position_id"
);
CREATE INDEX IF NOT EXISTS "voting_votes_voter_id_f4b66619" ON "voting_votes" (
	"voter_id"
);
COMMIT;
