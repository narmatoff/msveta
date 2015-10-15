<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">
<xsl:stylesheet version="1.0" xmlns:umi="http://www.umi-cms.ru/TR/umi" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="result[@module='content' and @method='content'][page/@object-id='343']" >
	<section>
	    <h1><xsl:value-of select=".//property[@name='h1']/value"/></h1>
	    <article>
		   	<table class="respon_tbl">
							<thead>
								<tr>
									<th><b>Адрес:</b>
									</th>
									<th><b>Режим работы:</b>
									</th>
									<th><b>Телефон:</b>
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:apply-templates select="document('usel://shop')/udata" mode="contacts"/>
							</tbody>
			</table>
	    </article>
	</section>
	<aside class="contacts_asd">
	    <ul class="aside_shopslinks">
	        <li><img src="{$template-resources}css/images/store.svg" alt=""/><a href="{$def-shop}">Интернет-магазин</a></li>
	        <li><img src="{$template-resources}css/images/facebook.svg" alt=""/><a href="{$def-facebook}">Присоединяйтесь к нам в Facebook</a></li>
	        <li><img src="{$template-resources}css/images/twitter.svg" alt=""/><a href="{$def-twitter}">Читайте нас в Twitter</a></li>
	    </ul>
	</aside>
	
	<div class="contacts">
		<div class="map_block" id="maps_main"></div>
	</div>
</xsl:template>
<xsl:template match="udata[@module='usel' and @method='shop']" mode="contacts">
	<xsl:apply-templates select="page" mode="contact_one"/>
</xsl:template>
<xsl:template match="page" mode="contact_one">
	<tr>
		<td>
			<h4>Магазин <xsl:value-of select="name"/></h4>
			<p>Адрес: <xsl:value-of select=".//property[@name='adress']/value" /></p>
			<a data-id="{@object-id}" class="maps-contact" href="#maps_main">показать на карте</a>
		</td>
		<td>
			<p><xsl:value-of select=".//property[@name='work']/value" /> с <xsl:value-of select=".//property[@name='rezhim_raboty_s']/value" /> до <xsl:value-of select=".//property[@name='rezhim_raboty_do']/value" /></p>
		</td>
		<td>
			<span><b>Тел: </b> <xsl:value-of select=".//property[@name='phone']/value" /></span>
		</td>
	</tr>
</xsl:template>
</xsl:stylesheet>