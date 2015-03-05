<?php
/**
 * @file
 * rbcode_eventos.features.menu_links.inc
 */

/**
 * Implements hook_menu_default_menu_links().
 */
function rbcode_eventos_menu_default_menu_links() {
  $menu_links = array();

  // Exported menu link: main-menu_calendario:calendario
  $menu_links['main-menu_calendario:calendario'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'calendario',
    'router_path' => 'calendario',
    'link_title' => 'Calendario',
    'options' => array(
      'identifier' => 'main-menu_calendario:calendario',
    ),
    'module' => 'system',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => 0,
    'customized' => 0,
  );
  // Translatables
  // Included for use with string extractors like potx.
  t('Calendario');


  return $menu_links;
}
