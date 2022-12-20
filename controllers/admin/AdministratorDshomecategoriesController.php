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

        if (!Tools::isSubmit('array') && !Tools::isSubmit('matrix')) {
            Tools::redirectAdmin($this->context->link->getAdminLink('AdminModules').'&configure=dshomecategories');
        }
    }

    public function ajaxProcessCall()
    {
        $ids_state = Tools::getValue('array');
        $this->addState($ids_state);
    }

    public function ajaxProcessConfiguration()
    {
        $matrix = Configuration::updateValue('DSDYNAMICPRICE_MATRIX', Tools::getValue('matrix'));
        $express = Configuration::updateValue('DSDYNAMICPRICE_EXPRESS', Tools::getValue('express'));

        if ($matrix === false || $express === false) {
            echo Tools::jsonEncode(array('msg' => $this->l('Something gone wrong. Please try again.')));
            return;
        }

        echo Tools::jsonEncode(array('success' => $this->l('Save success.')));
        return;
    }

    protected function addState($array)
    {
        $this->deleteStates();
        $db = \Db::getInstance();
        foreach ($array as $id_state) {
            $sql = "INSERT INTO `" . _DB_PREFIX_ . "dsdynamicprice_state` (`id_state`) VALUES ($id_state)";
            $db->execute($sql);
        }
    }

    protected function deleteStates()
    {
        $db = \Db::getInstance();
        $sql = "DELETE FROM "._DB_PREFIX_."dsdynamicprice_state";

        return DB::getInstance()->execute($sql);
    }
}
