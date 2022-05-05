<xsl:stylesheet 
  xml:space="preserve"
  xmlns:nota="https://nota-game.github.io/schema/vNext/nota" 
  xmlns:misc='https://nota-game.github.io/schema/vNext/misc'
  xmlns:lebewesen="https://nota-game.github.io/schema/vNext/lebewesen" 
  xmlns:kultur="https://nota-game.github.io/schema/vNext/kultur" 
  xmlns:profession="https://nota-game.github.io/schema/vNext/profession" 
  xmlns:talent="https://nota-game.github.io/schema/vNext/talent" 
  xmlns:fertigkeit="https://nota-game.github.io/schema/vNext/fertigkeit" 
  xmlns:besonderheit="https://nota-game.github.io/schema/vNext/besonderheit" 
  xmlns:aktionen="https://nota-game.github.io/schema/vNext/kampf/aktionen" 
  xmlns:ausstattung="https://nota-game.github.io/schema/vNext/kampf/ausstattung" 
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="https://nota-game.github.io/schema/vNext/nota ..\..\..\..\..\static\schema\nota.xsd                https://nota-game.github.io/schema/vNext/lebewesen ..\..\..\..\..\static\schema\lebewesen.xsd                https://nota-game.github.io/schema/vNext/kultur ..\..\..\..\..\static\schema\kultur.xsd                https://nota-game.github.io/schema/vNext/profession ..\..\..\..\..\static\schema\profession.xsd                https://nota-game.github.io/schema/vNext/talent ..\..\..\..\..\static\schema\talent.xsd                https://nota-game.github.io/schema/vNext/fertigkeit ..\..\..\..\..\static\schema\fertigkeit.xsd                 https://nota-game.github.io/schema/vNext/besonderheit ..\..\..\..\..\static\schema\besonderheit.xsd                 https://nota-game.github.io/schema/vNext/kampf/aktionen ..\..\..\..\..\static\schema\kampf\aktionen.xsd                 https://nota-game.github.io/schema/vNext/kampf/ausstattung ..\..\..\..\..\static\schema\kampf\ausstattung.xsd" 
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