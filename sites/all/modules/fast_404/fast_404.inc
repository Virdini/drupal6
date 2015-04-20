<?php

function fast_404_ext_check() {

  // Work out which $_SERVER variable to work from.  We'll ignore calls to the
  // homepage, to avoid unnecessary processing.
  if (!empty($_SERVER['QUERY_STRING']) && $_SERVER['QUERY_STRING'] != '/' && $_SERVER['QUERY_STRING'] != '/index.php') {
    $server_var = 'QUERY_STRING';
  }
  elseif (!empty($_SERVER['REQUEST_URI']) && $_SERVER['REQUEST_URI'] != '/' && $_SERVER['REQUEST_URI'] != '/index.php') {
    $server_var = 'REQUEST_URI';
  }
  // This is the homepage, continue as normal.
  else {
    return TRUE;
  }
  
  // Check to see if the URL is an imagecache URL. Those are handled via Drupal
  if (strpos($_SERVER[$server_var], 'imagecache')) {

    // Check to see if we will allow anon users to access this url
    if (variable_get('fast_404_allow_anon_imagecache', TRUE)) {
      // If anonymous can access then anyone can and we'll just pass on by
      return TRUE; 
    }
    else {
      
      // This is if you would like to only let your authenticated users genterate the
      // imagecache variations. Useful for sites like magazines where content 
      // editors will view all the content and pre-generate the variations
      // as a part of their process.
      
      $found_session = FALSE;

      // At this stage of the game we don't know if the user is logged in via
      // regular function calls. Simply look for a session cookie. If we find
      // one we'll assume they're logged in
      foreach ($_COOKIE as $k => $v) {
        if (stristr($k, 'SESS')) {
          $found_session = TRUE;
          break;
        }
      }

      // Found a session. We're going to assume they're logged in
      if ($found_session) {
        return TRUE;
      }
    }
  }

  // Check to see if the URL is an advagg URL. Those are handled via Drupal
  if (strpos($_SERVER[$server_var], '/advagg_')) {
    // We're allowing anyone to hit non-existing advagg URLs (default behavior)
    return TRUE;
  }

  // If we are using URL whitelisting then determine if the current URL is whitelisted 
  // before running the extension check
  if (variable_get('fast_404_url_whitelisting', FALSE)) {
    $allowed = variable_get('fast_404_whitelist', array());
    if (in_array($_SERVER[$server_var], $allowed)) {
      return TRUE; // URL is whitelisted. Assumed good.
    }
  }

  // Load up the blacklisted extensions
  $exts = variable_get('fast_404_exts', '/\.(txt|png|gif|jpe?g|css|js|ico|swf|flv|cgi|bat|pl|dll|exe|asp|)$/i');

  // Determine if URL is in blacklisted extensions
  if ($exts && preg_match($exts, $_SERVER[$server_var], $m)) {
    fast_404_error_return();
  }

  define('FAST_404_EXT_CHECKED', TRUE);
}

function fast_404_path_check() {
  $valid = TRUE;

  if (variable_get('fast_404_path_check', FALSE) && !empty($_GET['q'])) {

    // Determine if we have the db_query function. If so, we are in boot and have functions. If not we are in settings.php and do not have functions.
    if (function_exists('db_query')) {
      $valid = fast_404_validate_path_drupal();
    }
    else {
      $valid = fast_404_validate_path_mysql();
    }
  }

  if (!$valid) {
    fast_404_error_return();
  }

  define('FAST_404_PATH_CHECKED', TRUE);
}

function fast_404_validate_path_drupal() {

  //check if path_redirect module is installed
  if (db_result(db_query("SELECT name FROM {system} WHERE type = 'module' AND status = 1 AND name = 'path_redirect'"))) {
    //check if path exits in path_redirect table
    if (db_result(db_query("SELECT rid FROM {path_redirect} WHERE '%s' LIKE source", $_GET['q']))) {
      return TRUE;
    }
  }

  $sql = "SELECT path FROM {menu_router} WHERE '%s' LIKE path OR '%s' LIKE CONCAT(path,'%')";
  $res = db_result(db_query($sql, $_GET['q'], $_GET['q']));
  if ($res) {
    return TRUE;
  }
  else {
    $sql = "SELECT pid FROM {url_alias} WHERE '%s' LIKE dst OR '%s' LIKE CONCAT(dst,'%')";
    $res = db_result(db_query($sql, $_GET['q'], $_GET['q']));
    return $res == 0 ? FALSE : TRUE;
  }

  return FALSE;
}

function fast_404_validate_path_mysql() {
  global $db_url, $db_prefix;

  // Handle $db_url if it's either a string or the default element of a $db_url array
  $db_conn = !is_array($db_url) ? $db_url : (isset($db_url['default']) ? $db_url['default'] : NULL);
  if (!$db_conn) {
    return TRUE; // We can't check this URL here. Return TRUE to let Drupal continue bootstrapping.
  }

  $sql = "SELECT path FROM menu_router WHERE '%s' LIKE CONCAT(path,'%')";
  $sql2 = "SELECT pid FROM url_alias WHERE '%s' LIKE CONCAT(dst,'%')";
  $sql3 = "SELECT rid FROM path_redirect WHERE '%s' LIKE source";

  $url = parse_url($db_conn);

  // Decode url-encoded information in the db connection string
  $url['user'] = urldecode($url['user']);
  // Test if database url has a password.
  $url['pass'] = isset($url['pass']) ? urldecode($url['pass']) : '';
  $url['host'] = urldecode($url['host']);
  $url['path'] = str_replace('/', '', urldecode($url['path']));


  // Query the database via either mysql or mysqli 
  if (strstr($db_conn, 'mysqli')) {
    $conn = mysqli_connect($url['host'], $url['user'], $url['pass'], $url['path'], $url['port']);

    //check if path_redirect module is installed
    if (mysqli_fetch_row(mysqli_query($conn, "SELECT name FROM system WHERE type = 'module' AND status = 1 AND name = 'path_redirect'"))) {
      //check if path exits in path_redirect table
      $sql3 = str_replace('%s', mysqli_real_escape_string($conn, $_GET['q']), $sql3);
      if (mysqli_fetch_row(mysqli_query($conn, $sql3))) {
        return TRUE;
      }
    }

    $sql = str_replace('%s', mysqli_real_escape_string($conn, $_GET['q']), $sql);
    $res = mysqli_query($conn, $sql);
    $row = mysqli_fetch_row($res);
    if (!is_array($row)) {
      $sql2 = str_replace('%s', mysqli_real_escape_string($conn, $_GET['q']), $sql2);
      $res = mysqli_query($conn, $sql2);
      $row = mysqli_fetch_row($res);
      return is_array($row) > 0 ? TRUE : FALSE;
    }
    else {
      return TRUE;
    }
  }
  elseif (strstr($db_conn, 'mysql')) {
    if (isset($url['port'])) {
      $url['host'] = $url['host'] . ':' . $url['port'];
    }
    $conn = mysql_connect($url['host'], $url['user'], $url['pass']);
    mysql_select_db($url['path'], $conn);

    //check if path_redirect module is installed
    if (mysql_fetch_row(mysql_query($conn, "SELECT name FROM system WHERE type = 'module' AND status = 1 AND name = 'path_redirect'"))) {
      //check if path exits in path_redirect table
      $sql3 = str_replace('%s', mysql_escape_string($_GET['q']), $sql3);
      if (mysql_fetch_row(mysql_query($sql3))) {
        return TRUE;
      }
    }

    $sql = str_replace('%s', mysql_escape_string($_GET['q']), $sql);
    $res = mysql_query($sql);
    $row = mysql_fetch_array($res);
    if (!is_array($row)) {
      $sql2 = str_replace('%s', mysql_escape_string($_GET['q']), $sql2);
      $res = mysql_query($sql2);
      $row = mysql_fetch_array($res);
      return is_array($row) > 0 ? TRUE : FALSE;
    }
    else {
      return TRUE;
    }
  }
  else {
    return TRUE; // We can't check this URL here. Return TRUE to let Drupal continue bootstrapping.
  }

  return TRUE;
}

function fast_404_error_return() {
  header('HTTP/1.0 404 Not Found');
  $fast_404_html = variable_get('fast_404_html', '<html xmlns="http://www.w3.org/1999/xhtml"><head><title>404 Not Found</title></head><body><h1>Not Found</h1><p>The requested URL "@path" was not found on this server.</p></body></html>');
  print strtr($fast_404_html, array('@path' => check_plain(request_uri())));
  exit();
}
