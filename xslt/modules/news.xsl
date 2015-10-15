<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">
<xsl:stylesheet version="1.0" xmlns:umi="http://www.umi-cms.ru/TR/umi" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- Новости на главной -->
	<xsl:template match="udata[@method = 'lastlist']" mode="main">
			<xsl:apply-templates select="items/item" mode="news-list" />
		<!-- <xsl:apply-templates select="total" /> -->
	</xsl:template>
<!-- Новости на главной -->
	<xsl:template match="item" mode="news-list">
		<li>
			<span class="date_b"><xsl:value-of select="document(concat('udata://custom/dateru/',@publish_time))//d"/></span>
				<span class="mounth_b"><xsl:value-of select="document(concat('udata://custom/dateru/',@publish_time))//m_y"/></span>
				<h4 class="head_b"><a href="{@link}">
					<xsl:value-of select="." />
				</a></h4>
				<xsl:value-of select="substring(document(concat('upage://',@id,'.anons'))//value, 0, 120)" disable-output-escaping="yes"/>...	
		</li>
	</xsl:template>

	<xsl:template match="item" mode="news">
		<div class="news_item">
			<div class="date_news_item">
				<span><xsl:value-of select="document(concat('udata://custom/dateru/',@publish_time))//d"/></span>
							<span><xsl:value-of select="document(concat('udata://custom/dateru/',@publish_time))//m_y"/></span>
						</div>
						<div class="news_item_content">
							<h2><a href="{@link}"><xsl:value-of select="."/></a></h2>
							<!-- <span>Свет, новые технологии и инновациие</span> -->
							<span></span>
							<p><xsl:value-of select="substring(document(concat('upage://',@id,'.anons'))//value, 0, 120)" disable-output-escaping="yes"/>...<a href="{@link}">читать дальше</a></p>
						</div>



					</div>
	</xsl:template>

	<xsl:template match="result[@module='news' and @method='item']" >
		<h1><xsl:value-of select="//property[@name='h1']/value" /></h1>
		<xsl:value-of select="//property[@name='content']/value" disable-output-escaping="yes" />
		<div class="type_gallery">
			<ul>
				<xsl:apply-templates select="document(concat('udata://photoalbum/album/(', .//property[@name='produkciya_foto']/value/page/@link, ')'))/udata/items" />
			</ul>
		</div>
	</xsl:template>

	
	<xsl:template match="result[@module='news' and @method='rubric']" >
		<section class="news_block">
			<h1><xsl:value-of select=".//property[@name='h1']/value"/></h1>

				<div class="list_news">
					<xsl:apply-templates select="document(concat('udata://news/lastlist/', page/@link ,'/notemplate//10/0'))/udata/items/item" mode="news"/>
					
					
					

				</div>



			</section>
		<xsl:call-template name="numpages">
			<xsl:with-param name="limit" select="document(concat('udata://news/lastlist/', page/@link ,'/notemplate//10/0'))/udata/per_page"/>
			<xsl:with-param name="total" select="document(concat('udata://news/lastlist/', page/@link ,'/notemplate//10/0'))/udata/total"/>
		</xsl:call-template>
	</xsl:template>
    

</xsl:stylesheet>