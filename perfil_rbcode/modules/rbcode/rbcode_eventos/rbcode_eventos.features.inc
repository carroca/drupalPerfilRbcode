<?php
/**
 * @file
 * rbcode_eventos.features.inc
 */

/**
 * Implements hook_views_api().
 */
function rbcode_eventos_views_api($module = NULL, $api = NULL) {
  return array("api" => "3.0");
}

/**
 * Implements hook_node_info().
 */
function rbcode_eventos_node_info() {
  $items = array(
    'evento' => array(
      'name' => t('Evento'),
      'base' => 'node_content',
      'description' => t('Permite añadir un evento'),
      'has_title' => '1',
      'title_label' => t('Nombre'),
      'help' => '',
    ),
  );
  drupal_alter('node_info', $items);
  return $items;
}
