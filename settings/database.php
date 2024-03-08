<?php
/* database.php */
return array (
  'mysql' => 
  array (
    'dbdriver' => 'mysql',
    'username' => 'root',
    'password' => '',
    'dbname' => 'edms',
    'prefix' => 'edms',
    'hostname' => 'localhost', 
    'port' => '3306',
  ),
  'tables' => 
  array (
    'category' => 'category',
    'edms' => 'edms',
    'edms_files' => 'edms_files',
    'edms_download' => 'edms_download',
    'language' => 'language',
    'logs' => 'logs',
    'user' => 'user',
    'user_meta' => 'user_meta',
  ),
);