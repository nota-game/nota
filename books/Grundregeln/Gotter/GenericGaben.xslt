<xsl:stylesheet xml:space="preserve" 
  xmlns:nota="https://nota-game.github.io/schema/vNext/nota" 
  xmlns:lebewesen="https://nota-game.github.io/schema/vNext/lebewesen" 
  xmlns:kultur="https://nota-game.github.io/schema/vNext/kultur" 
  xmlns:profession="https://nota-game.github.io/schema/vNext/profession" 
  xmlns:talent="https://nota-game.github.io/schema/vNext/talent" 
  xmlns:fertigkeit="https://nota-game.github.io/schema/vNext/fertigkeit" 
  xmlns:besonderheit="https://nota-game.github.io/schema/vNext/besonderheit" 
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="https://nota-game.github.io/schema/vNext/nota ..\..\..\..\..\static\schema\nota.xsd                https://nota-game.github.io/schema/vNext/lebewesen ..\..\..\..\..\static\schema\lebewesen.xsd                https://nota-game.github.io/schema/vNext/kultur ..\..\..\..\..\static\schema\kultur.xsd                https://nota-game.github.io/schema/vNext/profession ..\..\..\..\..\static\schema\profession.xsd                https://nota-game.github.io/schema/vNext/talent ..\..\..\..\..\static\schema\talent.xsd                https://nota-game.github.io/schema/vNext/fertigkeit ..\..\..\..\..\static\schema\fertigkeit.xsd                 https://nota-game.github.io/schema/vNext/besonderheit ..\..\..\..\..\static\schema\besonderheit.xsd" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text" indent="no" />
  <xsl:template match="nota:Daten">
    <xsl:apply-templates select="besonderheit:Besonderheiten"/>
  </xsl:template>

  <xsl:template match="besonderheit:Besonderheiten">
    <xsl:apply-templates select="besonderheit:Besonderheit[besonderheit:Bedingung/besonderheit:Besonderheit[@Name='Auserwählter']]"/>
  </xsl:template>


  <xsl:template match="besonderheit:Besonderheit">
:::Gabe

::<xsl:value-of select="@Name"/>::{.Titel}
/::

:::Beschreibung

<xsl:value-of select="besonderheit:Beschreibung"/>

/:: 

  </xsl:template>
  <xsl:template match="*">[FEHLER IM XSLT]</xsl:template>
</xsl:stylesheet>