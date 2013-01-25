<?php
function virdini_breadcrumb($breadcrumb) {
  if (!empty($breadcrumb)) {
    //return '<div class="breadcrumb">' . implode('', $breadcrumb) . '</div>';
  }
}

function off_line_status($proceed=FALSE) {
    if(!$proceed) return;
    if(is_array($_SESSION['messages']['status'])) {
    $offline = l(t('Operating in off-line mode.'), 'admin/settings/site-maintenance');
    $statuses = array();
    foreach($_SESSION['messages']['status'] as $status) {
        if($status != $offline) $statuses[] = $status;
    }
    if(!count($statuses))    {
        unset($_SESSION['messages']['status']);
    } else {
        $_SESSION['messages']['status'] = $statuses;
    }
  }
}

//off_line_status(TRUE);
