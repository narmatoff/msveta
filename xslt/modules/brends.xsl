<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">
<xsl:stylesheet version="1.0" xmlns:umi="http://www.umi-cms.ru/TR/umi" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="result[@module='content' and @method='content' and parents/page[1]/@id='21']" >
		<section>
			<h1><xsl:value-of select=".//property[@name='h1']/value"/></h1>
			<article>
				<xsl:value-of select=".//property[@name='content']/value" disable-output-escaping="yes"/>
			</article>

			<div class="type_pac">

				<span class="type_pac_main_img">
					<xsl:call-template name="thumbing">
                        <xsl:with-param name="source" select=".//property[@name='logotip']/value" />
                        <xsl:with-param name="width" select="170" />
                        <xsl:with-param name="height" select="170" />
                        <xsl:with-param name="podpis" select=".//property[@name='h1']/value" />
                    </xsl:call-template>
				</span>

				<div class="type_pac_rside">
					<div class="type_pac_rside_h">
						<img src="{$template-resources}css/images/download_cats.svg" alt="123" />
						<span>Скачать каталоги компании:</span>
					</div>

					<ul class="type_pac_rside_cats">
						<xsl:apply-templates select="document(concat('usel://brends_catalog/(', .//property[@name='katalogi']/value/page/@link, ')'))/udata/page" mode="tips_page_doc">
							<xsl:with-param name="ico" select="'cat_ico'" />
							<xsl:with-param name="prop_name" select="'fb_cat_option'" />
						</xsl:apply-templates>
					</ul>
				</div>

				<ul class="type_pac_price">
					<xsl:apply-templates select="document(concat('udata://filemanager/list_files/', @pageId))/udata/items" mode="tips_page_price">
							<xsl:with-param name="ico" select="'pdf'" />
							<xsl:with-param name="prop_name" select="'fb_cat_option'" />
					</xsl:apply-templates>
				</ul>

				<div class="buy_block">
					<xsl:if test=".//property[@name='magaziny']/value/page">
						<h4>Вы можете купить продукцию <xsl:value-of select="./page/name"/> в наших магазинах:</h4>
						<div class="buy_block_cont">
							<img src="{$template-resources}css/images/intmag.svg" />
							<ul class="buy_block_cont_ul">
								<xsl:apply-templates select=".//property[@name='magaziny']/value/page" mode="shop_in_bprands"/>
							</ul>
						</div> 
					</xsl:if>
				</div>
			</div>
		</section>

		<aside>
			<!-- aside_flexslider -->
			<div class="aside_type">
				<xsl:call-template name="thumbing">
                    <xsl:with-param name="source" select=".//property[@name='bolshoe_izobrazhenie']/value" />
                    <xsl:with-param name="width" select="400" />
                    <xsl:with-param name="height" select="400" />
                    <xsl:with-param name="podpis" select=".//property[@name='h1']/value" />
                </xsl:call-template>
			</div>
			<!-- end_aside_flexslider -->
		</aside>

		<div class="type_gallery">
			<ul>
				<xsl:apply-templates select="document(concat('udata://photoalbum/album/(', .//property[@name='produkciya_foto']/value/page/@link, ')'))/udata/items" />
			</ul>
		</div>
		
	</xsl:template>

</xsl:stylesheet>