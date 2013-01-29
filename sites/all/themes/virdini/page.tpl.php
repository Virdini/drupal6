<?php include('header.inc'); ?>
	<?php if ($title): ?><h1><?php echo $title; ?></h1><?php endif; ?>
  <?php if ($tabs): ?><?php echo $tabs; ?><?php endif; ?>
  <?php if ($tabs2): ?><?php echo $tabs2; ?><?php endif; ?>
  <?php if ($show_messages && $messages): ?><div id='console' class='clear-block'><?php echo $messages; ?></div><?php endif; ?>
	<?php echo $content; ?>
<?php include('footer.inc'); ?>