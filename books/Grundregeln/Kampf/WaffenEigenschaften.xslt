<xsl:stylesheet 
  xml:space="preserve"
  xmlns:nota="http://nota.org/schema/nota.xsd" 
  xmlns:misc='http://nota.org/schema/misc.xsd'
  xmlns:lebewesen="http://nota.org/schema/lebewesen.xsd" 
  xmlns:kultur="http://nota.org/schema/kultur.xsd" 
  xmlns:profession="http://nota.org/schema/profession.xsd" 
  xmlns:talent="http://nota.org/schema/talent.xsd" 
  xmlns:fertigkeit="http://nota.org/schema/fertigkeit.xsd" 
  xmlns:besonderheit="http://nota.org/schema/besonderheit.xsd" 
  xmlns:aktionen="http://nota.org/schema/kampf/aktionen" 
  xmlns:ausstattung="http://nota.org/schema/kampf/ausstattung" 
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://nota.org/schema/nota.xsd ..\..\..\..\..\static\schema\nota.xsd                http://nota.org/schema/lebewesen.xsd ..\..\..\..\..\static\schema\lebewesen.xsd                http://nota.org/schema/kultur.xsd ..\..\..\..\..\static\schema\kultur.xsd                http://nota.org/schema/profession.xsd ..\..\..\..\..\static\schema\profession.xsd                http://nota.org/schema/talent.xsd ..\..\..\..\..\static\schema\talent.xsd                http://nota.org/schema/fertigkeit.xsd ..\..\..\..\..\static\schema\fertigkeit.xsd                 http://nota.org/schema/besonderheit.xsd ..\..\..\..\..\static\schema\besonderheit.xsd                 http://nota.org/schema/kampf/aktionen ..\..\..\..\..\static\schema\kampf\aktionen.xsd                 http://nota.org/schema/kampf/ausstattung ..\..\..\..\..\static\schema\kampf\ausstattung.xsd" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="no" />
  <xsl:template match="nota:Daten">
<xsl:apply-templates select="ausstattung:Ausstattung/ausstattung:Eigenschaften/ausstattung:Eigenschaft"/>
  </xsl:template>


<xsl:template match="ausstattung:Eigenschaft">

### <xsl:value-of select="normalize-space(./ausstattung:Name/misc:Lokalisirung[@Sparche='de']/text())"/>  

<xsl:value-of select="normalize-space(./ausstattung:Beschreibung/misc:Lokalisirung[@Sparche='de']/text())"/>

</xsl:template>

  <xsl:template match="*">  [[FEHLER IM XSLT]] (<xsl:value-of select="local-name()"/>)
  </xsl:template>
</xsl:stylesheet>