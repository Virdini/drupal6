<?php

/**
 * Fixed default engine's prepare function.
 *
 * @param
 *   Same parameters as mimemail() except $send.
 *
 * @return
 *   The $message array structure containing all details of the message.
 */
function _virdini_fix_prepare_message($sender, $recipient, $subject, $body, $plaintext = NULL, $headers = array(), $text = NULL, $attachments = array(), $mailkey = '') {
  module_load_include('inc', 'mimemail');

  $site_name = variable_get('site_name', 'Drupal');
  $site_mail = variable_get('site_mail', ini_get('sendmail_from'));

  // Override site mails default sender when using default engine.
  if (variable_get('mimemail_engine', 'mimemail') == 'virdini_fix_mimemail') {
    if ((empty($sender) || $sender == $site_mail)) {
      $mimemail_name = variable_get('mimemail_name', $site_name);
      $mimemail_mail = variable_get('mimemail_mail', $site_mail);
      $sender = array(
        'name' => !empty($mimemail_name) ? $mimemail_name : $site_name,
        'mail' => !empty($mimemail_mail) ? $mimemail_mail : $site_mail,
      );
    }
    elseif (is_array($sender)) {
      if (empty($sender['name'])) {
        $sender['name'] = variable_get('mimemail_name', $site_name);
      }
      if (empty($sender['mail'])) {
        $sender['mail'] = variable_get('mimemail_mail', $site_mail);
      }
    }
  }

  // Body is empty, this is a plaintext message.
  if (empty($body)) {
    $plaintext = 1;
  }
 // Try to determine recpient's text mail preference.
  elseif (is_null($plaintext)) {
    if (is_object($recipient)) {
      if (isset($recipient->mimemail_textonly)) {
        $plaintext = $recipient->mimemail_textonly;
      }
    }
    elseif (is_string($recipient) && valid_email_address($recipient)) {
      if (is_object($r = user_load(array('mail' => $recipient))) && isset($r->mimemail_textonly)) {
        $plaintext = $r->mimemail_textonly;
        $recipient = $r; // Pass the user object to the address function.
      }
    }
  }
  $subject = str_replace(array(" \n", "\n"), '', trim(drupal_html_to_text($subject)));
  $body = theme(array('mimemail_message__'. $mailkey, 'mimemail_message'), $subject, $body, $mailkey, $recipient);
  foreach (module_implements('mail_post_process') as $module) {
    $function = $module .'_mail_post_process';
    $function($body, $mailkey);
  }
  $plaintext = $plaintext || variable_get('mimemail_textonly', 0);
  $sender    = virdini_fix_mimemail_address($sender);
  $subject = mime_header_encode($subject);
  $mail      = mimemail_html_body($body, $subject, $plaintext, $text, $attachments);
  $headers   = array_merge($headers, $mail['headers']);
  $message   = array(
    'address' => virdini_fix_mimemail_address($recipient),
    'subject' => $subject,
    'body'    => $mail['body'],
    'sender'  => $sender,
    'headers' => virdini_fix_mimemail_headers($headers, $sender),
  );

  return $message;
}

/**
 * Fixed defaults for standard email headers.
 *
 * @param $headers
 *   An array of headers.
 *
 * @return
 *   An array containing the encoded headers with the default values.
 */
function virdini_fix_mimemail_headers($headers, $from = NULL) {
  // Run all headers through mime_header_encode() to convert non-ascii
  // characters to an rfc compliant string, similar to drupal_mail().
  foreach ($headers as $key => $value) {
    $headers[$key] = mime_header_encode($value);
  }
  
  $default_from = variable_get('site_mail', ini_get('sendmail_from'));

  // Overwrite standard headers.
  if ($from) {
    if (!isset($headers['From']) || $headers['From'] == $default_from) {
      $headers['From'] = $from;
    }
    if (!isset($headers['Sender']) || $headers['Sender'] == $default_from) {
      $headers['Sender'] = $from;
    }
    // This may not work. The MTA may rewrite the Return-Path.
    if (!isset($headers['Return-Path']) || $headers['Return-Path'] == $default_from) {
      preg_match('/[a-z\d\-\.\+_]+@(?:[a-z\d\-]+\.)+[a-z\d]{2,4}/i', $from, $matches);
      $headers['Return-Path'] = "<$matches[0]>";
    }
  }

  // Convert From header if it is an array.
  if (is_array($headers['From'])) {
    $headers['From'] = virdini_fix_mimemail_address($headers['From']);
  }

  return $headers;
}

/**
 * Fixed helper function to format an address string.
 *
 * @todo Could use some enhancement and stress testing.
 *
 * @param $address
 *   A user object, a text email address or an array containing name, mail.
 *
 * @return
 *   A formatted address string or FALSE.
 */
function virdini_fix_mimemail_address($address) {
  $simple_address = variable_get('mimemail_simple_address', 0);

  if (is_array($address)) {

    // It's an array containing mail and/or name.
    if (isset($address['mail'])) {
      $output = '';
      if (empty($address['name']) || $simple_address) {
        return $address['mail'];
      }
      else {
        return '"'. addslashes(mime_header_encode($address['name'])) .'" <'. $address['mail'] .'>';
      }
    }

    // It's an array of address items.
    $addresses = array();
    foreach ($address as $a) {
      $addresses[] = virdini_fix_mimemail_address($a);
    }
    return $addresses;
  }

  // It's a user object.
  if (is_object($address) && isset($address->mail)) {
    if (empty($address->name) || $simple_address) {
      return $address->mail;
    }
    else {
      return '"'. addslashes(mime_header_encode($address->name)) .'" <'. $address->mail .'>';
    }
  }

  // Its a formatted or an unformatted string.
  // @todo Shouldn't assume it's valid, should try to re-parse.
  if (is_string($address)) {
    return $address;
  }

  // It's null, return the site default address.
  if (is_null($address)) {
    return array(
      'name' => mime_header_encode(variable_get('site_name', 'Drupal')),
      'mail' => variable_get('site_mail', ini_get('sendmail_from')),
    );
  }

  return FALSE;
}
