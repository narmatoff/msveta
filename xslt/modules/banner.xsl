<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">
<xsl:stylesheet version="1.0" xmlns:umi="http://www.umi-cms.ru/TR/umi" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="udata[@module='usel' and @method='banner']" mode="banner-top" >
	<!-- flexslider -->
		<div class="main_flexslider">
			<ul class="slides">
				<xsl:apply-templates select="page" mode="banner-top-page" />
			</ul>
		</div>
	<!-- end_flexslider -->
	</xsl:template>

	<xsl:template match="page" mode="banner-top-page">
		<li>
			<xsl:choose>
				<xsl:when test=".//property[@name='shop']/value">
					<a href="{.//property[@name='shop']/value}">
						<xsl:call-template name="thumbing">
	                        <xsl:with-param name="source" select=".//property[@name='izobrazhenie_slajdera']/value" />
	                        <xsl:with-param name="width" select="1160" />
	                        <xsl:with-param name="height" select="460" />
	                        <xsl:with-param name="podpis" select=".//property[@name='h1']/value" />
	                    </xsl:call-template>
                    </a>
				</xsl:when>
				<xsl:when test="not(.//property[@name='ssylka_na_novost'])">
					<xsl:call-template name="thumbing">
                        <xsl:with-param name="source" select=".//property[@name='izobrazhenie_slajdera']/value" />
                        <xsl:with-param name="width" select="1160" />
                        <xsl:with-param name="height" select="460" />
                        <xsl:with-param name="podpis" select=".//property[@name='h1']/value" />
                    </xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<a href="{.//property[@name='ssylka_na_novost']/value/page/@link}">
						<xsl:call-template name="thumbing">
	                        <xsl:with-param name="source" select=".//property[@name='izobrazhenie_slajdera']/value" />
	                        <xsl:with-param name="width" select="1160" />
	                        <xsl:with-param name="height" select="460" />
	                        <xsl:with-param name="podpis" select=".//property[@name='h1']/value" />
	                    </xsl:call-template>
					</a>
				</xsl:otherwise>
			</xsl:choose>
		</li>
	</xsl:template>

	<xsl:template match="udata[@module='usel' and @method='banner']" mode="banner-right" >
	<!-- aside_flexslider -->
		<div class="aside_flexslider">
			<ul class="slides">
				<xsl:apply-templates select="page" mode="banner-right-page" />
			</ul>
		</div>
	<!-- end_aside_flexslider -->
	</xsl:template>

	<xsl:template match="page" mode="banner-right-page">
		<li>
			<xsl:choose>
				<xsl:when test="not(.//property[@name='ssylka_na_novost'])">
					<xsl:call-template name="thumbing">
	                        <xsl:with-param name="source" select=".//property[@name='izobrazhenie_slajdera']/value" />
	                        <xsl:with-param name="width" select="400" />
	                        <xsl:with-param name="height" select="360" />
	                        <xsl:with-param name="podpis" select=".//property[@name='h1']/value" />
	                    </xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<a href="{.//property[@name='ssylka_na_novost']/value/page/@link}">
						<xsl:call-template name="thumbing">
	                        <xsl:with-param name="source" select=".//property[@name='izobrazhenie_slajdera']/value" />
	                        <xsl:with-param name="width" select="400" />
	                        <xsl:with-param name="height" select="360" />
	                        <xsl:with-param name="podpis" select=".//property[@name='h1']/value" />
	                    </xsl:call-template>
					</a>
				</xsl:otherwise>
			</xsl:choose>
		</li>
	</xsl:template>


</xsl:stylesheet>

