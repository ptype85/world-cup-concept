CREATE DATABASE football; 

FLUSH PRIVILEGES;

GRANT ALL PRIVILEGES ON football.* to notarealuser@localhost;

FLUSH PRIVILEGES;

USE football;

CREATE TABLE `users` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `full_name` varchar(255),
  `fb_uid` int,
  `created_at` timestamp
);

CREATE TABLE `avatar` (
  `u_id` int,
  `url` varchar(255)
);

CREATE TABLE `points` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `points_count` int
);

CREATE TABLE `position` (
  `id` int,
  `pos` int
);

CREATE TABLE `point_values` (
  `scenario` varchar(255),
  `point_value` int
);

CREATE TABLE `teams` (
  `t_id` int,
  `t_name` varchar(255)
);

CREATE TABLE `games` (
  `g_id` int,
  `team1` int,
  `team2` int,
  `utcDate` datetime,
  `status` varchar(255),
  `stage` varchar(255),
  `group` varchar(255),
  `lastupdated` datetime,
  `winner` varchar(255),
  `duration` varchar(255),
  `score1` int,
  `score2` int
);

CREATE TABLE `predictions` (
  `u_id` int,
  `g_id` int,
  `score1` int,
  `score2` int,
  `status` int
);

ALTER TABLE `users` ADD FOREIGN KEY (`id`) REFERENCES `points` (`id`);

ALTER TABLE `users` ADD FOREIGN KEY (`id`) REFERENCES `position` (`id`);

ALTER TABLE `users` ADD FOREIGN KEY (`id`) REFERENCES `avatar` (`u_id`);

ALTER TABLE `teams` ADD FOREIGN KEY (`t_id`) REFERENCES `games` (`team1`);

ALTER TABLE `teams` ADD FOREIGN KEY (`t_id`) REFERENCES `games` (`team2`);

ALTER TABLE `users` ADD FOREIGN KEY (`id`) REFERENCES `predictions` (`u_id`);

ALTER TABLE `games` ADD FOREIGN KEY (`g_id`) REFERENCES `predictions` (`g_id`);
