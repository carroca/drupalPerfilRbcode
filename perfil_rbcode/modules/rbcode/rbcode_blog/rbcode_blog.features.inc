<?php
/**
 * @file
 * rbcode_blog.features.inc
 */

/**
 * Implements hook_node_info().
 */
function rbcode_blog_node_info() {
  $items = array(
    'blog' => array(
      'name' => t('Blog'),
      'base' => 'node_content',
      'description' => t('Permite añadir una entrada de blog'),
      'has_title' => '1',
      'title_label' => t('Titulo'),
      'help' => '',
    ),
  );
  drupal_alter('node_info', $items);
  return $items;
}
