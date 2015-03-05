<?php
/**
 * @file
 * rbcode_blog.features.taxonomy.inc
 */

/**
 * Implements hook_taxonomy_default_vocabularies().
 */
function rbcode_blog_taxonomy_default_vocabularies() {
  return array(
    'categoria' => array(
      'name' => 'Categoria',
      'machine_name' => 'categoria',
      'description' => 'Categoria del blog',
      'hierarchy' => 0,
      'module' => 'taxonomy',
      'weight' => 0,
    ),
    'tag' => array(
      'name' => 'Tag',
      'machine_name' => 'tag',
      'description' => 'Etiqueta para las entradas',
      'hierarchy' => 0,
      'module' => 'taxonomy',
      'weight' => 0,
    ),
  );
}
