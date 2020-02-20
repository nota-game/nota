<xsl:stylesheet 
  xml:space="preserve"
  xmlns:nota="http://nota.org/schema/nota" 
  xmlns:misc='http://nota.org/schema/misc'
  xmlns:lebewesen="http://nota.org/schema/lebewesen" 
  xmlns:kultur="http://nota.org/schema/kultur" 
  xmlns:profession="http://nota.org/schema/profession" 
  xmlns:talent="http://nota.org/schema/talent" 
  xmlns:fertigkeit="http://nota.org/schema/fertigkeit" 
  xmlns:besonderheit="http://nota.org/schema/besonderheit" 
  xmlns:aktionen="http://nota.org/schema/kampf/aktionen" 
  xmlns:ausstattung="http://nota.org/schema/kampf/ausstattung" 
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://nota.org/schema/nota ..\..\..\..\..\static\schema\nota.xsd                http://nota.org/schema/lebewesen ..\..\..\..\..\static\schema\lebewesen.xsd                http://nota.org/schema/kultur ..\..\..\..\..\static\schema\kultur.xsd                http://nota.org/schema/profession ..\..\..\..\..\static\schema\profession.xsd                http://nota.org/schema/talent ..\..\..\..\..\static\schema\talent.xsd                http://nota.org/schema/fertigkeit ..\..\..\..\..\static\schema\fertigkeit.xsd                 http://nota.org/schema/besonderheit ..\..\..\..\..\static\schema\besonderheit.xsd                 http://nota.org/schema/kampf/aktionen ..\..\..\..\..\static\schema\kampf\aktionen.xsd                 http://nota.org/schema/kampf/ausstattung ..\..\..\..\..\static\schema\kampf\ausstattung.xsd" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="no" />
  <xsl:template match="nota:Daten">
<xsl:apply-templates select="ausstattung:Ausstattung/ausstattung:Waffen/ausstattung:Nahkampfwaffe"/>
  </xsl:template>


<xsl:template match="ausstattung:Nahkampfwaffe">

### <xsl:value-of select="normalize-space(./ausstattung:Name/misc:Lokalisirung[@Sparche='de']/text())"/>  

<xsl:value-of select="normalize-space(./ausstattung:Beschreibung/misc:Lokalisirung[@Sparche='de']/text())"/>

**Distanzklasse** <xsl:value-of select="@Distanzklasse"/>

<xsl:if test="./ausstattung:Schaden/ausstattung:Schnitt">
**Schnittschaden** <xsl:value-of select="./ausstattung:Schaden/ausstattung:Schnitt/@Schaden"/>
</xsl:if>

<xsl:if test="./ausstattung:Schaden/ausstattung:Wucht">
**Wuchtschaden** <xsl:value-of select="./ausstattung:Schaden/ausstattung:Wucht/@Schaden"/>
</xsl:if>


<xsl:if test="./ausstattung:Eigenschaften">
**Eigenschaften**: _<xsl:for-each select="./ausstattung:Eigenschaften/*" ><xsl:value-of select="@Id"/></xsl:for-each>_
</xsl:if>

<xsl:if test="./ausstattung:Talente">
**Talente**: _<xsl:for-each select="./ausstattung:Talente/*" ><xsl:value-of select="@Id"/></xsl:for-each>_
</xsl:if>



</xsl:template>

  <xsl:template match="*">  [[FEHLER IM XSLT]] (<xsl:value-of select="local-name()"/>)
  </xsl:template>
</xsl:stylesheet>