<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">
<xsl:stylesheet version="1.0" xmlns:umi="http://www.umi-cms.ru/TR/umi" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="udata[@module='usel' and @method='getCountMenu']">
		<ul>
			<xsl:apply-templates select="page" mode="pageMenu"/>
		</ul>
	</xsl:template>
	
	<xsl:template match="page" mode="pageMenu">
		<li>
			<a href="{@link}"><xsl:value-of select="name"/></a>
		</li>
	</xsl:template>

	<!-- Бренды на главной -->
	<xsl:template match="udata[@module='usel' and @method='image_on_main']/page">
		<li>
			<a href="{@link}">
				<xsl:call-template name="thumbing">
                    <xsl:with-param name="source" select=".//property[@name = 'logotip']/value" />
            	    <xsl:with-param name="width" select="120" />
                    <xsl:with-param name="height" select="120" />
                    <xsl:with-param name="podpis" select="name" />
                </xsl:call-template>
			</a>
		</li>
	</xsl:template>
	<!-- Бренды на главной -->


<!-- Вывод фотоальбома -->
	<xsl:template match="item">
		<xsl:param name="rel" />
		<xsl:apply-templates select="document(concat('upage://', @id))/udata" mode="photoalbum">
			<xsl:with-param name="rel" select="$rel"/>
		</xsl:apply-templates>
	</xsl:template>
	
	<xsl:template match="page" mode="photoalbum">
		<xsl:param name="rel" />
		<li>
			<a rel="single_{$rel}" href="{.//property[@name = 'photo']/value}" title="{.//property[@name='h1']/value}">
				<xsl:call-template name="thumbing">
                    <xsl:with-param name="source" select=".//property[@name = 'photo']/value" />
            	    <xsl:with-param name="width" select="130" />
                    <xsl:with-param name="height" select="130" />
                    <xsl:with-param name="podpis" select=".//property[@name='h1']/value" />
                </xsl:call-template>
			</a>
		</li>
	</xsl:template>
<!-- Вывод фотоальбома -->


	<xsl:template match="udata[@module='usel' and @method='shop']" mode="default_tab" >
        <xsl:param name="name" />
        <xsl:param name="show_inside" />
		<div class="heading">
			<span><xsl:value-of select="$name"/></span>
			<xsl:apply-templates select="page" mode="map_tab" />
		</div>
		<div class="head_add">
			<xsl:apply-templates select="page" mode="map_info">
                <xsl:with-param name="show" select="$show_inside"/>
            </xsl:apply-templates>
		</div>
	</xsl:template>

	<xsl:template match="page" mode="map_tab">
		<div data-tab="tab{position()}" data-id="{@object-id}" id="{@object-id}"><xsl:value-of select=".//name" /></div>
	</xsl:template>

	<xsl:template match="page" mode="map_info">
        <xsl:param name="show" />

		<div id="tab{position()}" class="tab{position()}">
            <xsl:if test="$show = 'yes'">
                <span class="head_add_content">
                    <h4>Виртуальная экскурсия по магазину:</h4>
                        <p>Дождитесь, пожалуйста, загрузки панорамы, чтобы посмотреть как выглядит наш салон светильников <xsl:value-of select="name"/> изнутри.
Для удобства просмотра, после полной загрузки, панораму можно распахнуть на весь экран, с помощью кнопки в левом-верхнем углу панорамы, и таким-же образом свернуть обратно.
Приятного просмотра!</p>
					<span class="map_block ex_block">
                        <xsl:value-of select=".//property[@name='virtual']/value" disable-output-escaping='yes'/>
					</span>

                        </span>
            </xsl:if>
			<span><xsl:value-of select=".//property[@name='nazvanie']/value" /><br/>
<b>Адрес: </b> <xsl:value-of select=".//property[@name='adress']/value" />
</span>
		<span><b>Режим работы:</b><br/>
<xsl:value-of select=".//property[@name='work']/value" /> с <xsl:value-of select=".//property[@name='rezhim_raboty_s']/value" /> до <xsl:value-of select=".//property[@name='rezhim_raboty_do']/value" /></span>
		<span><b>Тел: </b> <xsl:value-of select=".//property[@name='phone']/value" /></span>
		</div>
	</xsl:template>

<!-- Пейджер для новостей -->
    <xsl:template name="numpages">
        <xsl:param name="limit" />
        <xsl:param name="total" />
        <xsl:if test="$total > $limit">
            <xsl:apply-templates select="document(concat('udata://system/numpages/', $total, '/', $limit))/udata" mode="news-pager" /></xsl:if>
    </xsl:template>
    <xsl:template match="udata[@module = 'system' and @method = 'numpages']" mode="news-pager">
       
        <div class="pagings">
				<span>Страницы:</span>
            <ul>
                <xsl:apply-templates select="toprev_link" mode="num-news" />
                <xsl:apply-templates select="items/item" mode="num-news" />
                <xsl:apply-templates select="tonext_link" mode="num-news" />
            </ul>
        </div>
    </xsl:template>
    <xsl:template match="item[@is-active='1']" mode="num-news">
        <li><a class="current_page" href="#"><xsl:value-of select="." disable-output-escaping="no" /></a>
        </li>
    </xsl:template>
    <xsl:template match="item" mode="num-news">
        <li>
            <a href="{@link}">
                <xsl:value-of select="." disable-output-escaping="no" />
            </a>
        </li>
    </xsl:template>
    <xsl:template match="tonext_link" mode="num-news">
        <li><a href="{.}" class="arrow-forward">Следующая</a>
        </li>
    </xsl:template>
    <xsl:template match="toprev_link" mode="num-news">
        <li><a class="arrow-back" href="{.}">Предыдущая</a>
        </li>
    </xsl:template>


    <!-- Хлебные крошки -->
    <xsl:template match="udata[@method = 'navibar']">
        <div class="breadcrumbs">
            <ul>
                <li>
                    <a href="/">Главная</a>
                </li>
                <xsl:apply-templates select="items/item" mode="navibar"/>
            </ul>
        </div>
    </xsl:template>

    <xsl:template match="item" mode="navibar">
    	
	   	<xsl:choose>
	   		<xsl:when test="@id=21"></xsl:when>
	   		<xsl:otherwise>
	   		   <li>
	    		   <a href="{@link}"><xsl:value-of select="."/></a>
	   			</li>
	   		</xsl:otherwise>
	   	</xsl:choose>
	   	
    </xsl:template>

    <xsl:template match="item[position() = last()]" mode="navibar">
        <li><xsl:value-of select="."/></li>
    </xsl:template>
    <!-- Хлебные крошки -->

	<!-- Шаблон создания миниатюры -->
    <xsl:template name="thumbing">
        <xsl:param name="source" />
        <xsl:param name="width" select='60' />
        <xsl:param name="height">auto</xsl:param>
        <xsl:param name="class" />
        <xsl:param name="podpis" />
        <!--<xsl:choose> <xsl:when test="$width"> </xsl:when> <xsl:otherwise><xsl:variable name="width" select=""></xsl:variable> </xsl:otherwise></xsl:choose>-->
        <xsl:choose>
            <xsl:when test="$source">
                <xsl:apply-templates select="document(concat('udata://system/makeThumbnailFull/(.',$source,')/',$width,'/',$height,'///1/5//100'))/udata" mode="temp">
                    <xsl:with-param name="class" select="$class" />
                    <xsl:with-param name="podpis" select="$podpis" /></xsl:apply-templates>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="document(concat('udata://system/makeThumbnailFull/(.',$template-resources,'img/no_image.jpg)/',$width,'/',$height,'//////100'))/udata" mode="temp">
                    <xsl:with-param name="class" select="$class" />
                    <xsl:with-param name="podpis" select="$podpis" /></xsl:apply-templates>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="thumsrc">
        <xsl:param name="source" />
        <xsl:param name="width" select='60' />
        <xsl:param name="height">auto</xsl:param>
        <!--<xsl:choose> <xsl:when test="$width"> </xsl:when> <xsl:otherwise><xsl:variable name="width" select=""></xsl:variable> </xsl:otherwise></xsl:choose>-->
        <xsl:value-of select="document(concat('udata://system/makeThumbnailFull/(.',$source,')/',$width,'/',$height,'//////100'))/udata/src" /></xsl:template>
    <xsl:template match="udata" mode="temp">
        <xsl:param name="class" />
        <xsl:param name="podpis" />
        <img class="{$class}" alt="{$podpis}" src="{src}" />
    </xsl:template>

</xsl:stylesheet>
