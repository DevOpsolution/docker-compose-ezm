-- 创建数据库
create database xprofiler_console default character set utf8mb4 collate utf8mb4_unicode_ci;
create database xprofiler_logs default character set utf8mb4 collate utf8mb4_unicode_ci;

-- 创建普通用户
create user 'monitor'@'%' identified by 'monitor@2021';
grant all privileges on xprofiler_console.* to 'monitor'@'%';
grant all privileges on xprofiler_logs.* to 'monitor'@'%';
flush privileges;