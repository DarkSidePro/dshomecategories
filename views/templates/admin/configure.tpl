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

<div class="panel panel-default">
	<div class="panel-body">
		<div class="row">
			<div class="col-md-4">
			</div>
			<div class="col-md-4">
				<div id="response" class="alert alert-warning alert-dismissible fade show" role="alert">
				</div>
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
							{foreach from=$categoryData item=category}
								<tr>								
									<th>{$category.id}</th>
									<td>{$category.name}</th>
									<td>
										<div class="ps-switch ps-switch-sm ps-switch-nolabel ps-switch-center">
											<input type="radio" class="category-status" data-token='{$token}' data-category="{$category.id}" name="input-{$category.id}" id="input-false-{$category.id}" value="0" {if $category.status == 0}checked{/if}>
											<label for="input-false-{$category.id}">{l s="Off" mod='dshomecategories'}</label>
											<input type="radio" class="category-status" data-token='{$token}' data-category="{$category.id}" name="input-{$category.id}" id="input-true-{$category.id}" value="1" {if $category.status == 1}checked{/if}>
											<label for="input-true-{$category.id}">{l s="On" mod='dshomecategories'}</label>
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
<script>
	$('.category-status').on('click', function(e) {
		token = $(this).data('token');
		category = $(this).data('category');
		value = $(this).val();

		$.ajax({
			type: 'POST',
			url: baseAdminDir+'index.php',
			data: {
				ajax: true,
				controller: 'AdministratorDshomecategories',
				action: 'call',
				token: token,
				id_category: category,
				value: value,
				
			},
			success: function (data) {
				array = JSON.parse(data);
				
				console.log(array);
				console.log(array.msg)
				$('#response').removeClass('fade');
				$('#response').prepend(array.msg);

				setTimeout(() => {
					$('#response').addClass('fade');
				}, 4000);
			},
			error: function (data) {
				console.log('An error occurred.');
				console.log(data);
			},
		});
	})
</script>