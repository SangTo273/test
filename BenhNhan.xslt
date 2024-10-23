<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
				xmlns:bn ="http://tempuri.org/BenhNhan.xsd"
>
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
		<html>
			<head>
				<title>TX1</title>
				<style>
					.bg_blue{
					background-color: blue;
					}
					.text{
					color: red;
					font-weight: bold;
					font-style: italic;
					}
				</style>
			</head>
			<body>
				<h1 align="center">BẢNG CHI TRẢ VIỆN PHÍ</h1>
				<h2>Tên bệnh viện: <xsl:value-of select="/bn:DS/@tenbv"/>
			</h2>
				<xsl:apply-templates select="/bn:DS/bn:khoa"></xsl:apply-templates>
			</body>
		</html>
    </xsl:template>
	<xsl:template match="/bn:DS/bn:khoa">
		<h2>Tên khoa khám: <xsl:value-of select="bn:tenkhoa"/>
	</h2>
		<table border="2" width="100%" cellspacing="0" class="bg_blue">
			<tr>
				<th>STT</th>
				<th>Họ tên</th>
				<th>Số ngày nằm viện</th>
				<th>Viện phí</th>
			</tr>
			<xsl:apply-templates select="bn:benhnhan"></xsl:apply-templates>
		</table>
		<br/>
		<h2>--------------------------------------------------------------------------------</h2>
	</xsl:template>
	<xsl:template match="bn:benhnhan">
		<tr>
			<td>
				<xsl:value-of select="position()"/>
			</td>
			<td class="text">
				<xsl:value-of select="bn:hoten"/>
			</td>
			<td>
				<xsl:value-of select="@songay"/>
			</td>
			<td>
				<xsl:if test="@songay &lt;= 10">
					<xsl:value-of select="@songay * 100000"/>
				</xsl:if>
				<xsl:if test="@songay &gt; 10 and @songay &lt;= 20">
					<xsl:value-of select="10 * 100000 + (@songay - 10) * 120000"/>
				</xsl:if>
				<xsl:if test="@songay &gt; 20">
					<xsl:value-of select="10 * 100000 + 10 * 120000 + (@songay - 20) * 200000"/>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>
