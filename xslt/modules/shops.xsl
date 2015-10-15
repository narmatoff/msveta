<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">
<xsl:stylesheet version="1.0" xmlns:umi="http://www.umi-cms.ru/TR/umi" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="result[@module='content' and @method='content'][page/@object-id='345']">
	

	<div class="contacts">

		<xsl:apply-templates select="document('usel://shop')/udata" mode="default_tab" >
			<xsl:with-param name="name" select="'Магазины:'"/>
			<xsl:with-param name="show_inside" select="'yes'"/>
		</xsl:apply-templates>

		<div class="map_block" id="maps_main"></div>
			
		</div>
		
		<xsl:apply-templates select="document('usel://shop')/udata" mode="shopGallary" />
		<section>
		<h1><xsl:value-of select=".//property[@name='h1']/value"/></h1>
		<article>
			<xsl:value-of select=".//property[@name='content']/value" disable-output-escaping="yes"/>
		</article>
	</section>

	<aside class="contacts_asd">
		<ul class="aside_shopslinks">
			<li><img src="{$template-resources}css/images/store.svg" alt=""/><a href="{$def-shop}">Интернет-магазин</a></li>
			<li><img src="{$template-resources}css/images/facebook.svg" alt=""/><a href="{$def-facebook}">Присоединяйтесь к нам в Facebook</a></li>
			<li><img src="{$template-resources}css/images/twitter.svg" alt=""/><a href="{$def-twitter}">Читайте нас в Twitter</a></li>
		</ul>
	</aside>
</xsl:template>

<xsl:template match="udata[@module='usel' and @method='shop']" mode="shopGallary">
		<div class="type_gallery">
	<xsl:apply-templates select="page" mode="shopImages" />
		</div>
</xsl:template>

<xsl:template match="page" mode="shopImages">
	<div id="tab{position()}" class="tab{position()}">
			<ul>
				<xsl:apply-templates select="document(concat('udata://photoalbum/album/(', .//property[@name='fotogalereya_magazina']/value/page/@link, ')'))/udata/items">
					<xsl:with-param name="rel" select="position()"/>
				</xsl:apply-templates>
			</ul>
	</div>
</xsl:template>

</xsl:stylesheet>