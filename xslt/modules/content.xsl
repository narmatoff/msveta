<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">
<xsl:stylesheet version="1.0" xmlns:umi="http://www.umi-cms.ru/TR/umi" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/TR/xlink" >



	<xsl:template match="page" mode="shop_in_bprands">
		<li><a href="/galereya_magazinov/#{@object-id}"><xsl:value-of select="name"/></a></li>
	</xsl:template>

	
	<xsl:template match="result[@module='content' and @method='content']" >
	
		<section>

			<h1>
				<xsl:value-of select=".//property[@name='h1']/value" />
			</h1>
			<article>
				<xsl:value-of select=".//property[@name='content']/value" disable-output-escaping="yes" />
			</article>

			<xsl:apply-templates select="document(concat('usel://getCountMenu/', @pageId))/udata" />

		</section>
	
	</xsl:template>

	
	<xsl:template match="page" mode="brends_cat">
		<li>
			<a href="{@link}"><xsl:value-of select="name" /></a>
			<!-- <ul>
				<xsl:apply-templates select="document(concat('usel://brends_catalog/(', .//property[@name='katalogi']/value/page/@link, ')'))/udata/page" mode="brends_catalog" />
			</ul> -->

			<xsl:if test=".//property[@name='kratkoe_opisanie']/value">
				<div class="catItemPopup">
					<xsl:value-of select=".//property[@name='kratkoe_opisanie']/value"/>
					<img src="{$template-resources}css/images/info_pic.svg" alt="info"/>
				</div>
			</xsl:if>

		</li>
	</xsl:template>

	<xsl:template match="page" mode="tips_page_doc">
        <xsl:param name="ico" />
        <xsl:param name="prop_name" />
		<li>
			<img src="{$template-resources}css/images/{$ico}.svg" alt="{name}" />
			<a href="{.//property[@name=$prop_name]/value}" target="_blank"><xsl:value-of select="name"/></a>
		</li>
	</xsl:template>

	<xsl:template match="items" mode="tips_page_price">
        <xsl:param name="ico" />
        <xsl:param name="prop_name" />
		<li>
			<img src="{$template-resources}css/images/{$ico}.svg" alt="{name}" />
			<a href="{@xlink:download-link}"><xsl:value-of select="@name"/></a>
		</li>
	</xsl:template>

	<xsl:template match="page" mode="brends_catalog">
		<li>
			<a href="{.//property[@name='fb_cat_option']/value}" target="_blank"><xsl:value-of select="name"/></a>
		</li>
	</xsl:template>
</xsl:stylesheet>