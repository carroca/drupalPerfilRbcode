<?php
/**
 * @file
 * Enables modules and site configuration for a standard site installation.
 */

/**
 * Implements hook_form_FORM_ID_alter() for install_configure_form().
 *
 * Allows the profile to alter the site configuration form.
 */
function perfil_rbcode_form_install_configure_form_alter(&$form, $form_state) {

  // Pre-populate the site name with the server name
  $form['site_information']['site_name']['#default_value'] = $_SERVER['SERVER_NAME'];
  $form['site_information']['site_mail']['#default_value'] = '';
  
  // El usuario administrador será 'admin' y no se podrá modificar
  $form['admin_account']['account']['name']['#value'] = 'admin';
  
  // La zona horaria por defecto se establece como Europe/Madrid
  // y no se mostrará al usuario
  $form['server_settings']['date_default_timezone']['#value'] = 'Europe/Madrid';
  // El país predefinido es España pero puede ser modificado
  $form['server_settings']['site_default_country']['#default_value'] = 'ES';

}

/**
*  Implements hook_profile_details().
*/
function perfil_rbcode_profile_details(){
  $details['language'] = 'es';
  return $details;
}

/**
* Implements hook_install_tasks().
*/
function perfil_rbcode_install_tasks() {
  $tasks = array();
  drupal_add_css(drupal_get_path('profile', 'perfil_rbcode') . '/rbcode.css');
  //solicita información adicional a través de un formulario
  $tasks['perfil_rbcode_settings_form'] = array(
    'display_name' => st('Opciones extra'),
    'type' => 'form',
  );
  return $tasks;
}

function perfil_rbcode_settings_form($form, &$form_state, &$install_state) {
  // Formulario de ejemplo con un campo de texto obligatorio
  $form['funciones_seleccionadas'] = array(
   '#type' => 'checkboxes',
   '#title' => st('Opciones extra'),
   '#options' => array(
     'rbcode_blog' => st('RB Blog'),
	 'rbcode_eventos' => st('RB Eventos'),
	 'rbcode_administracion' => st('RB administracion'),
	 'rbcode_campos_acidionales' => st('RB campos adicionales'),
	 'rbcode_desarrollo' => st('RB desarrollo'),
	 'rbcode_multilingue' => st('RB multilinüe'),
	 'rbcode_otros' => st('RB otros'),
   ),
   '#description' => st('Selecciona las opciones extra que desees añadir'),
  );
  
  $form['continue'] = array(
    '#type' => 'submit',
    '#value' => st('Continuar'),
  );
  
  return $form;
}

/**
* Función de envío del formulario
*/
function perfil_rbcode_settings_form_submit($form, &$form_state) {

  $modules = array();

  $modules = array_filter($form_state['values']['funciones_seleccionadas']);
  $enable_dependencies = TRUE;

  if($modules != null) {
	module_enable($modules, $enable_dependencies);
  }

  /*if(function_exists('l10n_update_modules_enabled')){
	l10n_update_modules_enabled(module_list());
  }*/
}
