<?php

/**
 * @file
 * Template file for Colorbox content inserted via the Insert module.
 *
 * Available variables:
 * - $item: The complete item being inserted.
 * - $image_path: The URL to the image.
 * - $link_path: The URL to the image that Colorbox should open.
 * - $presetname: The ImageCache preset being used.
 * - $gallery_id: The ID of the Colorbox gallery.
 * - $insert_class: The classes provided by the insert module.
 *
 * Note that ALT and Title fields should not be filled in here, instead they
 * should use placeholders that will be updated through JavaScript when the
 * image is inserted.
 *
 * Available placeholders:
 * - __alt__: The ALT text, intended for use in the <img> tag.
 * - __title__: The Title text, intended for use in the <img> tag.
 * - __description__: A description of the image, sometimes used as a caption.
 */
?>
<a href="<?php print $link_path; ?>" title="__title__" class="colorbox colorbox-insert-image" rel="gallery-<?php print $gallery_id; ?>"><img src="<?php print $image_path; ?>" alt="__alt__" title="__title__" class="imagecache imagecache-<?php print "$presetname $insert_class"; ?>" /></a>