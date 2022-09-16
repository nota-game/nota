<xsl:stylesheet xml:space="preserve" 
xmlns:misc='http://nota.org/schema/misc.xsd'
xmlns:nota="http://nota.org/schema/nota.xsd" xmlns:lebewesen="http://nota.org/schema/lebewesen.xsd" xmlns:kultur="http://nota.org/schema/kultur.xsd" xmlns:profession="http://nota.org/schema/profession.xsd" xmlns:talent="http://nota.org/schema/talent.xsd" xmlns:fertigkeit="http://nota.org/schema/fertigkeit.xsd" xmlns:besonderheit="http://nota.org/schema/besonderheit.xsd" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://nota.org/schema/nota.xsd ..\..\..\..\..\static\schema\nota.xsd                http://nota.org/schema/lebewesen.xsd ..\..\..\..\..\static\schema\lebewesen.xsd                http://nota.org/schema/kultur.xsd ..\..\..\..\..\static\schema\kultur.xsd                http://nota.org/schema/profession.xsd ..\..\..\..\..\static\schema\profession.xsd                http://nota.org/schema/talent.xsd ..\..\..\..\..\static\schema\talent.xsd                http://nota.org/schema/fertigkeit.xsd ..\..\..\..\..\static\schema\fertigkeit.xsd                 http://nota.org/schema/besonderheit.xsd ..\..\..\..\..\static\schema\besonderheit.xsd" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text" indent="no" />
  <xsl:template match="nota:Daten">
    <xsl:apply-templates select="besonderheit:Besonderheiten[@KategorieId='Gaben']" />
  </xsl:template>

  <xsl:template match="besonderheit:Besonderheiten">
    <xsl:apply-templates select="besonderheit:Besonderheit" />
  </xsl:template>


  <xsl:template match="besonderheit:Besonderheit">
    
:::Gabe
    
### <xsl:value-of select="misc:Name" />
  


<xsl:value-of select="misc:Beschreibung" />
/::
  </xsl:template>
  <xsl:template match="*">[FEHLER IM XSLT]</xsl:template>
</xsl:stylesheet>