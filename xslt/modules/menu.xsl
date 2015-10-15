<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">
<xsl:stylesheet version="1.0" xmlns:umi="http://www.umi-cms.ru/TR/umi" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="udata[@module='menu' and @method = 'draw']" mode="top">
			<ul class="top_menu">
			<div class="catmenuh">
						<img src="{$template-resources}css/images/strelka.svg" alt="strelka" />
											<span>Меню</span>
					</div>
				<xsl:apply-templates select="item" mode="menu-top" />
			</ul>
	</xsl:template>

	<xsl:template match="item" mode="menu-top">
		<li>
			<a href="{@link}">
				<xsl:value-of select="." />
			</a>
		</li>
	</xsl:template>

</xsl:stylesheet>