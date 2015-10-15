<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">
<xsl:stylesheet version="1.0" xmlns:umi="http://www.umi-cms.ru/TR/umi" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="result[@module='content' and @method='content' and @pageId='85']" >
		<section>
			<h1><xsl:value-of select=".//property[@name='h1']/value"/></h1>
			<article>
				<xsl:value-of select=".//property[@name='content']/value" disable-output-escaping="yes" />
			</article>
		</section>

		<aside>
			<!-- aside_flexslider -->
			<div class="aside_type">
				<!-- <a href="#"> -->
					<xsl:call-template name="thumbing">
                        <xsl:with-param name="source" select=".//property[@name='menu_pic_a']/value" />
                        <xsl:with-param name="width" select="400" />
                        <xsl:with-param name="height" select="280" />
                        <xsl:with-param name="podpis" select=".//property[@name='h1']/value" />
                    </xsl:call-template>
				<!-- </a> -->
			</div>
				<!-- end_aside_flexslider -->
		</aside>




		<!-- </div> -->

		<table class="lamps_table">
			<thead>
				<tr>
					<th>
						<span>Эффективность</span>
						<img src="{$template-resources}css/images/grdnt_lmptbl.png" alt="123" />
						<div>
							<span>меньше</span>
							<span>больше</span>
						</div>
					</th>
					<th>
						<img src="{$template-resources}css/images/ir_lamp.svg" alt="123" />
					</th>
					<th>
						<img src="{$template-resources}css/images/lum_lamp.svg" alt="123" />
					</th>
					<th>
						<img src="{$template-resources}css/images/led_lamp.svg" alt="123" />
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<img src="{$template-resources}css/images/sun_lamp.svg" alt="123" />
						<span>Световой поток</span>
					</td>
					<td>
						<span>800 LM</span>
					</td>
					<td>
						<span>800 LM</span>
					</td>
					<td>
						<span>800 LM</span>
					</td>
				</tr>
				<tr>
					<td>
						<img src="{$template-resources}css/images/scale_lamp.svg" alt="123" />
						<span>Потребляемая мощность</span>
					</td>
					<td>
						<span>60 W</span>
					</td>
					<td>
						<span>14 W</span>
					</td>
					<td>
						<span>11 W</span>
					</td>
				</tr>
				<tr>
					<td>
						<img src="{$template-resources}css/images/time_lamp.svg" alt="123" />
						<span>Время работы</span>
					</td>
					<td>
						<span>~ 1 год</span>
					</td>
					<td>
						<span>~ 6-10 лет</span>
					</td>
					<td>
						<span>~ 15-25 лет</span>
					</td>
				</tr>
				<tr>
					<td>
						<img src="{$template-resources}css/images/econom_lamp.svg" alt="123" />
						<span>Экономия за 5 лет работы</span>
					</td>
					<td>
						<span>0</span>
					</td>
					<td>
						<span>3500 РУБ.</span>
					</td>
					<td>
						<span>15000 РУБ.</span>
					</td>
				</tr>
			</tbody>
		</table>

		<div class="type_pac">






					<div class="buy_block">
						<h4>Вы можете купить продукцию в наших магазинах:</h4>
						<div class="buy_block_cont">
							<img src="{$template-resources}css/images/intmag.svg" alt="13654"/>
							<ul class="buy_block_cont_ul">
								<xsl:apply-templates select=".//property[@name='magaziny']/value/page" mode="shop_in_bprands"/>
							</ul>
						</div>
					</div>



				</div>


	</xsl:template>

	<xsl:template match="udata[@module='usel' and @method='advice']" >
		<ul class="blog_b">
			<xsl:apply-templates select="page" mode="advice"/>
		</ul>
	</xsl:template>

	<xsl:template match="page" mode="advice">
		<li>
			<span class="text_items">
				<h3><xsl:value-of select=".//property[@name='h1']/value"/></h3>
				<p><xsl:value-of select="substring(.//property[@name='content']/value, 0, 120)" disable-output-escaping="yes"/>...</p>
				<a href="{@link}">Читать дальше</a>
			</span>
			<xsl:call-template name="thumbing">
                        <xsl:with-param name="source" select=".//property[@name='menu_pic_a']/value" />
                        <xsl:with-param name="width" select="130" />
                        <xsl:with-param name="height" select="130" />
                        <xsl:with-param name="podpis" select=".//property[@name='h1']/value" />
            </xsl:call-template>
		</li>
	</xsl:template>

	<xsl:template match="result[@module='content' and @method='content' and @pageId='10']">

		<section>
			<h1><xsl:value-of select=".//property[@name='h1']/value"/></h1>
			<article>
				<xsl:value-of select=".//property[@name='content']/value" disable-output-escaping="yes" />
			</article>
		</section>

		<form class="formClass partner_access" action="">
				<span>Вход для участников партнерской программы</span>
				<input required='required' type="text" title='логин' placeholder="Логин"/>
				<input required='required' type="password" title='пароль' placeholder="Пароль"/>
				<input required='required' type="submit" value="Войти в личный кабинет" />

			</form>
			<aside>

				<div class="aside_type">



				</div>

			</aside>


			<div class="partnership_pict">
				<ul>
					<li>Архитектурные мастерские</li>
					<li>Дизайн-студии</li>
					<li>Строительные компании</li>
					<li>Архитекторы</li>
					<li>Дизайнеры</li>
					<li>Декораторы</li>
				</ul>

				<span>
					<div class='circle_part'>
						<span>Партнерская программа</span>
					</div>
					<img src="{$template-resources}css/images/partner_right.png" alt="45345" />
				</span>

				<ol>
					<li>
						<h2><xsl:value-of select=".//property[@name='parvyj_blok_zagolovok_1']/value"/></h2>
						<p><xsl:value-of select=".//property[@name='pravyj_blok_tekst_1']/value"/></p>
					</li>
					<li>
						<h2><xsl:value-of select=".//property[@name='parvyj_blok_zagolovok_2']/value"/></h2>
						<p><xsl:value-of select=".//property[@name='pravyj_blok_tekst_2']/value"/></p>
					</li>
					<li>
						<h2><xsl:value-of select=".//property[@name='parvyj_blok_zagolovok_3']/value"/></h2>
						<p><xsl:value-of select=".//property[@name='pravyj_blok_tekst_3']/value"/></p>
					</li>
				</ol>
			</div>


			<a href="#connectToProgramm" class="connect_partnership" data-id='92'>Присоединиться к программе</a>
			<div id="connectToProgramm">
				
				<form class="formClass" id="feedback_form" action="/webforms/send/" method="post">
			<!-- 		<span>Присоединиться к партнерской программе</span>
					<input required='required' type="text" title='Ваше имя' placeholder="Как к Вам обращаться?" />
					<input required='required' type="text" title='Ваше отчество' placeholder="Ваше отчество" />
					<input type="email" title='email' placeholder="Ваш e-mail"/>
					<input type="tel" required='required' placeholder="Контактный номер телефона"/>
					<input required='required' type="password" title='пароль' placeholder="Кодовое слово"/>
					<textarea name="dsfghj" id="" cols="30" rows="10" placeholder="Сообщение"></textarea>
					<input type="submit" value="Отправить заявку" /> -->

				</form>
			</div>
	</xsl:template>

</xsl:stylesheet>