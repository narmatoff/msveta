<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/TR/xlink" xmlns:umi="http://www.umi-cms.ru/TR/umi">

<xsl:param name="show">0</xsl:param>

    <xsl:template match="/">
<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>

<xsl:text disable-output-escaping='yes'>
        &lt;!--[if lt IE 7]&gt;      &lt;html class="no-js lt-ie9 lt-ie8 lt-ie7"&gt; &lt;![endif]--&gt;
        &lt;!--[if IE 7]&gt;         &lt;html class="no-js lt-ie9 lt-ie8"&gt; &lt;![endif]--&gt;
        &lt;!--[if IE 8]&gt;         &lt;html class="no-js lt-ie9"&gt; &lt;![endif]--&gt;
        &lt;!--[if gt IE 8]&gt;&lt;!--&gt;
</xsl:text>

<html class="no-js" lang="">
<!--<![endif]-->

<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="keywords" content="{//meta/keywords}" />
	<meta name="description" content="{//meta/description}" />
	<title>
		<xsl:value-of select="/result/@title" />
	</title>
	<meta name="viewport" content="width=device-width, initial-scale=1" />




	<link href="{$template-resources}favicon.ico" rel="shortcut icon" type="image/x-icon" />
	<link rel="apple-touch-icon" sizes="57x57" href="{$template-resources}apple-icon-57x57.png" />
	<link rel="apple-touch-icon" sizes="60x60" href="{$template-resources}apple-icon-60x60.png" />
	<link rel="apple-touch-icon" sizes="72x72" href="{$template-resources}apple-icon-72x72.png" />
	<link rel="apple-touch-icon" sizes="76x76" href="{$template-resources}apple-icon-76x76.png" />
	<link rel="apple-touch-icon" sizes="114x114" href="{$template-resources}apple-icon-114x114.png" />
	<link rel="apple-touch-icon" sizes="120x120" href="{$template-resources}apple-icon-120x120.png" />
	<link rel="apple-touch-icon" sizes="144x144" href="{$template-resources}apple-icon-144x144.png" />
	<link rel="apple-touch-icon" sizes="152x152" href="{$template-resources}apple-icon-152x152.png" />
	<link rel="apple-touch-icon" sizes="180x180" href="{$template-resources}apple-icon-180x180.png" />
	<link rel="icon" type="image/png" sizes="192x192" href="{$template-resources}android-icon-192x192.png" />
	<link rel="icon" type="image/png" sizes="32x32" href="{$template-resources}favicon-32x32.png" />
	<link rel="icon" type="image/png" sizes="96x96" href="{$template-resources}favicon-96x96.png" />
<!-- 	<link rel="icon" type="image/png" sizes="16x16" href="{$template-resources}favicon-16x16.png" /> -->
	<link rel="manifest" href="{$template-resources}manifest.json" />
	<meta name="msapplication-TileColor" content="#ffffff" />
	<meta name="msapplication-TileImage" content="{$template-resources}ms-icon-144x144.png" />
	<meta name="theme-color" content="#ffffff" />






	<!--	<link rel='stylesheet' href='{$template-resources}components/jquery.scrollbar/jquery.scrollbar.css' />-->

	<link rel="stylesheet" href="{$template-resources}css/main.css" />





</head>
<body>
	<!--[if lt IE 8]>
            <p class="browserupgrade">Ваш браузер <strong>устарел</strong>. Пожалуйста <a href="http://browsehappy.com/">обновите Ваш браузер</a> для использования всех возможностей страницы.</p>
        <![endif]-->


	<!--        background image-->
	<div class="bgimg">

	</div>
	<!--     end background image-->


	<div class="mn_wpr">
	
	
	<div class="catalogbtn">
			<span class="btnzind">
				<img src="{$template-resources}css/images/strelka.svg" alt="right"/>
				<span>Каталоги</span>
			</span>

			<!--				catalog-->
			<ul class="catalog">
				<div class="catmenuh">
					<img src="{$template-resources}css/images/strelka.svg" alt="right" />
					<span>Каталог</span>
				</div>

				<xsl:apply-templates select="document('usel://katalogi')/udata/page" mode="brends_cat" />
			
			</ul>
			<!--				end_catalog-->

		</div>
	
		<div class="sec_wrp">
			<xsl:choose>
				<xsl:when test="result/page/@is-default">
	            	<xsl:attribute name="class">sec_wrp main_page</xsl:attribute>
	            </xsl:when>
			</xsl:choose>

			<header>
				<nav>
					<div class="burger_top_menu">

					</div>
					<a class="logotipe" href="/" title="Логотип компании"><img src="{$template-resources}css/images/logo.svg" alt="Логотип компании" />
					</a>
					<xsl:apply-templates select="document('udata://menu/draw/top')" mode="top" />
				</nav>

				<div class="maglink_nphone">
				
				
<!--				pls del "visibility:hidden" to display market link-->
				<span class="maglink_nphone_item">
 					<a href="/galereya_magazinov">
						<img src="{$template-resources}css/images/intmag.svg" alt="" />
					</a>
					<!-- 					<a href="{$def-shop}">
						<img src="{$template-resources}css/images/intmag.svg" alt="" />
					</a>
					<div class="maglink_nphone_item_links">
						 <a href="{$def-shop}"><span>Интернет-магазин</span>
						</a> 						 
						<a href="{$def-shop}"><span>Интернет-магазин 2</span>
						</a> 
					</div> -->
				</span>
				
				<!-- <a href="tel:{translate($def-phone, ' ', '')}"><span><xsl:value-of select="substring-after($def-phone, '+7')" /> Магазин на Луне</span>
						</a>  -->
				<span class="maglink_nphone_item">

					<!-- <a href="tel:{translate($def-phone, ' ', '')}"> -->
					<a href="javascript://">
						<img src="{$template-resources}css/images/phoneico.svg" alt="" />
					</a>

					<div class="maglink_nphone_item_links">
						<a href="tel:{translate(document('upage://2.tel_tmp_1')//value, ' ', '')}">
							<span>
								<xsl:value-of select="substring-after(document('upage://2.tel_tmp_1')//value, '+7')" />&nbsp;
								<xsl:value-of select="document('upage://2.pod_tmp_1')//value"/>
							</span>
						</a> 	

						<a href="tel:{translate(document('upage://2.tel_tmp_2')//value, ' ', '')}">
							<span>
								<xsl:value-of select="substring-after(document('upage://2.tel_tmp_2')//value, '+7')" />&nbsp;
								<xsl:value-of select="document('upage://2.pod_tmp_2')//value"/>
							</span>
						</a>
                      
						<a href="tel:{translate(document('upage://2.tel_tmp_3')//value, ' ', '')}">
							<span>
								<xsl:value-of select="substring-after(document('upage://2.tel_tmp_3')//value, '+7')" />&nbsp;
								<xsl:value-of select="document('upage://2.pod_tmp_3')//value"/>
							</span>
						</a> 
                      
						<a href="tel:+7(812)335-48-49">
						  <span>
						  	(812) 335-48-49&nbsp;
						  	На Новолитовской
						  </span>
						</a>

					</div>
				</span>	
				
				
					<!-- <a href="#">Магазин на Заневском</a> -->
				</div>

				<div class="nametitle">
					<span>Мир света</span>
					<span>Лучший выбор света в Петербурге!</span>
				</div>
			</header>
		<xsl:if test="not(result/page/@is-default)">
			<!--separator type page-->
			<div class="sep_type_top"></div>
			<!--end separator type page-->
			<!-- Хлебные крошки -->
			<xsl:apply-templates select="document('udata://core/navibar')/udata" />
			<!-- Хлебные крошки -->
        	<xsl:apply-templates select="result" disable-output-escaping="yes" />
		</xsl:if>
		<xsl:if test="result/page/@is-default">
			<!-- Верхний слайдер -->
			<xsl:apply-templates select="document('usel://banner/slajder_sverhu')" mode="banner-top" />
			<!-- Верхний слайдер -->

			<section>

				<div class="heading">
					<span>Новости магазинов</span>
				</div>

				<ul class="newsblock">
					<xsl:apply-templates select="document('udata://news/lastlist/novosti_i_akcii/notemplate/4/0//')" mode="main"/>
					
				</ul>

				<article>
					<h1>
						<xsl:value-of select="//property[@name = 'h1']/value" />
					</h1>
					<p>
						<xsl:value-of select="//property[@name = 'content']/value" disable-output-escaping="yes" />
					</p>

				</article>

				<div class="brends_b">
					<ul>
						<xsl:apply-templates select="document('usel://image_on_main')/udata/page" />
					</ul>
					<p><xsl:value-of select="document('upage://2.down_text')//value"/></p>

				</div>

			</section>

			<aside>
				<!-- слайдер правый -->
				<xsl:apply-templates select="document('usel://banner/slajder_sprava')" mode="banner-right" />
				<!-- слайдер правый -->
				
				
					<xsl:apply-templates select="document('usel://advice/4')/udata"  />





			</aside>

			<div class="contacts">
				<xsl:apply-templates select="document('usel://shop')/udata" mode="default_tab" >
					<xsl:with-param name="name" select="'Контакты:'"/>
				</xsl:apply-templates>
				<div class="map_block" id="maps_main">
					<!-- <script type="text/javascript" charset="utf-8" src="https://api-maps.yandex.ru/services/constructor/1.0/js/?sid=1JOplpEZwgd6l5wS6FfBSf4gE9H04U12&amp;width=1160&amp;height=400"></script> -->
				</div>

			</div>

		</xsl:if>
		</div>


		<footer>


			<ul>
				<li><span>© Cеть магазинов «Мир света», 2015 г.</span>
				</li>
				<li><img src="{$template-resources}css/images/phone_stick.svg" alt="phst" /><span>Телефон: <xsl:value-of select="substring-after($def-phone, '+7')" /></span>
				</li>
				<li><img src="{$template-resources}css/images/mail.svg" alt="ml" /><span>E-mail: <xsl:value-of select="$def-email" /></span>
				</li>
			</ul>

			<ul>
				<li>
					<a href="{$def-twitter}" target="_blank"><img src="{$template-resources}css/images/twitterator.svg" alt="tw" />
					</a>
				</li>
				<li>
					<a href="{$def-facebook}" target="_blank"><img src="{$template-resources}css/images/facebookator.svg" alt="fb" />
					</a>
				</li>
			</ul>




		</footer>

	</div>
	
	
	

	<script src="{$template-resources}components/jQuery/dist/jquery.min.js"></script>

	<!-- <script src="{$template-resources}js/vendor/jquery-1.11.2.js"></script> -->
	<!--        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.js"><\/script>')</script>-->
	<script src="{$template-resources}components/fancybox3/jquery.fancybox.min.js"></script>
	<link rel="stylesheet" type="text/css" href="{$template-resources}components/fancybox3/jquery.fancybox.min.css" />
	
	
<!--	<script src="{$template-resources}components/jquery.scrollbar/jquery.scrollbar.min.js"></script>-->
<!--		<link rel="stylesheet" href="{$template-resources}components/baron/baron.css"/>-->


	
<!--	<script src="{$template-resources}components/egg.js/egg.js"></script>-->

	<xsl:if test="((result/page/@is-default) or (result/page/@object-id='345') or (result/page/@object-id='343'))">
		<script src="http://api-maps.yandex.ru/2.1/?lang=ru_RU" type="text/javascript"></script>
		<script src="{$template-resources}js/map.min.js"></script>
	</xsl:if>

	<script src="{$template-resources}js/plugins.min.js"></script>
	<script src="{$template-resources}js/main.min.js"></script>
	
	
<!--	up,up,down,down,left,left,right,right-->
	<div id="egggif">
		<img src="{$template-resources}/css/images/egglamp.png" alt="Лампонька"/>
	</div>
	
</body>

</html>

</xsl:template>


</xsl:stylesheet>