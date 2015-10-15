<?xml version="1.0" encoding="utf-8"?>


<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="utf-8" method="html" indent="yes"/>

<xsl:output
	encoding="UTF-8"
	indent="yes"
	cdata-section-elements="script noscript"
	omit-xml-declaration="yes"
	doctype-system = "string"
/>

	<xsl:param name="template-resources" />
	

	<xsl:variable name="lang-prefix" select="/result/@pre-lang" />
	<xsl:variable name="document-page-id" select="/result/@pageId" />
	<xsl:variable name="document-title" select="/result/@title" />
	<xsl:variable name="user-type" select="/result/user/@type" />
	<xsl:variable name="request-uri" select="/result/@request-uri" />
	<xsl:variable name="domain" select="/result/@domain" />
	
	<xsl:variable name="site-info-id" select="document('upage://contacts')/udata/page/@id" />
	<xsl:variable name="site-info" select="document('upage://contacts')//group[@name = 'site_info']/property" />
	
	<xsl:variable name="user-id" select="/result/user/@id" />
	<xsl:variable name="user-info" select="document(concat('uobject://', $user-id))" />
	
	<xsl:variable name="module" select="/result/@module" />
	<xsl:variable name="method" select="/result/@method" />

	<xsl:variable name="def-phone" select="document('upage://2.phone')//value" />
	<xsl:variable name="def-email" select="document('upage://2.kontaktnyj_email')//value" />
	<xsl:variable name="def-shop" select="document('upage://2.ssylka_na_magazin')//value" />
	<xsl:variable name="def-twitter" select="document('upage://2.twitter')//value" />
	<xsl:variable name="def-facebook" select="document('upage://2.facebook')//value" />

	<xsl:include href="default.xsl" />
	<xsl:include href="modules/tips.xsl" />
	<xsl:include href="modules/news.xsl" />
	<xsl:include href="modules/menu.xsl" />
	<xsl:include href="modules/content.xsl" />
	<xsl:include href="modules/banner.xsl" />
	<xsl:include href="modules/shops.xsl" />
	<xsl:include href="modules/brends.xsl" />
	<xsl:include href="modules/contacts.xsl" />
	<xsl:include href="modules/advice.xsl" />


</xsl:stylesheet>