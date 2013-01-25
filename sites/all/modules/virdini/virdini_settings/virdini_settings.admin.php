<?php
/**
 * Implementation of hook_admin_settings() for configuring the module
 */
function virdini_settings_admin_settings_form(&$form_state) {
  $form = array();
  $form['virdini_contact_mail'] = array(
    '#type' => 'textfield',
    '#title' => t('Contact mail'),
    '#default_value' => variable_get('virdini_contact_mail',''),
  );
  $form['site_name'] = array(
    '#type' => 'textfield', 
    '#title' => t('Name'), 
    '#default_value' => variable_get('site_name', 'Drupal'), 
    '#description' => t('The name of this website.'), 
    '#required' => TRUE,
  );
  $form['site_mail'] = array(
    '#type' => 'textfield', 
    '#title' => t('E-mail address'), 
    '#default_value' => variable_get('site_mail', ini_get('sendmail_from')), 
    '#description' => t("The <em>From</em> address in automated e-mails sent during registration and new password requests, and other notifications. (Use an address ending in your site's domain to help prevent this e-mail being flagged as spam.)"), 
    '#required' => TRUE,
  );
  $form['site_slogan'] = array(
    '#type' => 'textfield', 
    '#title' => t('Slogan'), 
    '#default_value' => variable_get('site_slogan', ''), 
    '#description' => t("Your site's motto, tag line, or catchphrase (often displayed alongside the title of the site)."),
  );
  return system_settings_form($form);
}