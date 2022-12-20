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

<div class="card">
	<div class="card-body">
		<div class="row">
			<div class="col-md-4">
			</div>
			<div class="col-md-4">
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>{l s="#" mod='dshomecategories'}</th>
								<th>{l s="Category name" mod='dshomecategories'}</th>
								<th>{l s="Status" mod='dshomecategories'}</th>
							</tr>
						</thead>
						<tbody>
							{foreach from=categoryData item=category key=key}
								<tr>
									<th>{$category.id}</th>
									<td>{$category.name}</th>
									<td>
										<div class="ps-switch ps-switch-sm ps-switch-nolabel ps-switch-center" onclick="toggleCategoryStatus({$category.id});">
											<input type="radio" name="input-3" id="input-false-3" value="0" {if $category.status = 0}checked{/if}>
											<label for="input-false-3">{l s="Off" mod='dshomecategories'}</label>
											<input type="radio" name="input-3" id="input-true-3" value="1" {if $category.status = 1}checked{/if}>
											<label for="input-true-3">{l s="On" mod='dshomecategories'}</label>
											<span class="slide-button"></span>
										</div>
									</td>
								</tr>	
							{/foreach}
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
