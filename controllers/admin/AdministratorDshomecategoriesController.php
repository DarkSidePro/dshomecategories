<?php
/**
* DS: Afillate
*
* NOTICE OF LICENSE
*
* This source file is subject to the Open Software License (OSL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/osl-3.0.php
*
* @author    Dark-Side.pro
* @copyright Copyright 2017 © fmemodules All right reserved
* @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
* @category  FO Module
* @package   dsafillate
*/

class AdministratorDshomecategoriesController extends ModuleAdminController
{
    public function __construct()
    {
        parent::__construct();

        if (!Tools::isSubmit('value') && !Tools::isSubmit('id_category')) {
            Tools::redirectAdmin($this->context->link->getAdminLink('AdminModules').'&configure=dshomecategories');
        }
    }

    public function ajaxProcessCall()
    {
        if (!Tools::isSubmit('id_category')) {
            echo Tools::jsonEncode(array('msg' => $this->l('ID category is missing.'), 'success' => false));
            return;
        }

        if (!Tools::isSubmit('value')) {
            echo Tools::jsonEncode(array('msg' => $this->l('Value for category status is missing.'), 'success' => false));
            return;
        }

        $id_category = Tools::getValue('id_category');
        $value = Tools::getValue('value');

        $this->changeStatus($id_category, $value);

        echo Tools::jsonEncode(array('msg' => $this->l('Status changed.'), 'success' => true));
        return;
    }

    protected function changeStatus($id_category, $value)
    {
        $value = (int) $value;
        $id_category = (int) $id_category;

        $db = \Db::getInstance();

        $result = $db->update('dshomecategory', array(
            'status' => $value
        ), 'id = ' . $id_category);
        
    }
}
