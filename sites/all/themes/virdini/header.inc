<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
  xmlns:fb="http://www.facebook.com/2008/fbml"
  xmlns:og="http://ogp.me/ns#" 
  xml:lang="<?php echo $language->language; ?>"
  lang="<?php echo $language->language; ?>"
  dir="<?php echo $language->dir; ?>">
  <head>
    <title><?php echo $head_title; ?></title>
    <?php echo $head; ?>
    <meta name="viewport" content="width=device-width">
    <meta name="SKYPE_TOOLBAR" content="SKYPE_TOOLBAR_PARSER_COMPATIBLE" />
    <meta content="telephone=no" name="format-detection">
    <?php echo $styles; ?>
    <!--[if lt IE 9]>
    <script src="<?php echo base_path() . path_to_theme(); ?>/js/html5-3.4-respond-1.1.0.min.js"></script>
    <![endif]-->
    <?php echo $head_scripts; ?>
  </head>
  <body class="<?php echo $body_classes;?>">