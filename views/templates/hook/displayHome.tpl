{*
* 2007-2022 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2022 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
<div class="card p-1 mb-1">
	<div class="card-body">
		<h5 class="card-title">{l s="Featured categories" mod='dshomecategories'}</h5>
		<div id="categoriesWrapper">
			{foreach from=categories item=category key=key}
				<div class="col-md-3 ds-category-item">
					<a href="$link->getCategoryLink($category.category_id, $category.link_rewrite)|escape:'html':'UTF-8'}" title="{$category.name}">
						<img src="{$link->getCatImageLink($category.link_rewrite, $category.category_id, 'category_default')|escape:'html':'UTF-8'}" class="img-responsive ds-category-image">
					</a>
					<h3 class="h3 ds-category-name">
						<a href="$link->getCategoryLink($category.category_id, $category.link_rewrite)|escape:'html':'UTF-8'}" title="{$category.name}">
							{$category.name}
						</a>
					</h3>
				</div>
			{/foreach}
		</div>
	</div>
</div>