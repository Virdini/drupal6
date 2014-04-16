<!DOCTYPE html>
<html lang="<?php echo $language->language; ?>" dir="<?php echo $language->dir; ?>">
  <head prefix="og: http://ogp.me/ns# article: http://ogp.me/ns/article# fb: http://ogp.me/ns/fb# object: http://ogp.me/ns/object#">
    <title><?php echo $head_title; ?></title>
    <?php echo $head; ?>
    <meta name="viewport" content="width=device-width" />
    <meta name="SKYPE_TOOLBAR" content="SKYPE_TOOLBAR_PARSER_COMPATIBLE" />
    <meta name="format-detection" content="telephone=no" />
    <?php echo $styles; ?>
    <!--[if lt IE 9]>
    <script src="<?php echo base_path() . path_to_theme(); ?>/js/html5-3.4-respond-1.1.0.min.js"></script>
    <![endif]-->
    <?php echo $head_scripts; ?>
  </head>
  <body class="<?php echo $body_classes;?>">