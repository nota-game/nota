<xsl:stylesheet
        xml:space="preserve"
        xmlns:nota="http://nota.org/schema/nota"
        xmlns:lebewesen="http://nota.org/schema/lebewesen"
        xmlns:kultur="http://nota.org/schema/kultur"
        xmlns:profession="http://nota.org/schema/profession"
        xmlns:talent="http://nota.org/schema/talent"
        xmlns:fertigkeit="http://nota.org/schema/fertigkeit"
        xmlns:besonderheit="http://nota.org/schema/besonderheit"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://nota.org/schema/nota ..\..\..\..\..\static\schema\nota.xsd
                http://nota.org/schema/lebewesen ..\..\..\..\..\static\schema\lebewesen.xsd
                http://nota.org/schema/kultur ..\..\..\..\..\static\schema\kultur.xsd
                http://nota.org/schema/profession ..\..\..\..\..\static\schema\profession.xsd
                http://nota.org/schema/talent ..\..\..\..\..\static\schema\talent.xsd
                http://nota.org/schema/fertigkeit ..\..\..\..\..\static\schema\fertigkeit.xsd 
                http://nota.org/schema/besonderheit ..\..\..\..\..\static\schema\besonderheit.xsd" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="text" indent="no" />
<xsl:template match="nota:Daten"><xsl:apply-templates select="talent:Talente"/></xsl:template>



<xsl:template match="talent:Talente"><xsl:for-each-group select="talent:Talent" group-by="@Kategorie"><xsl:value-of select="@Kategorie" /><xsl:for-each select="current-group()"><xsl:sort select="@Name" />
;<xsl:apply-templates select="."/></xsl:for-each>
</xsl:for-each-group>
</xsl:template>

<xsl:template match="talent:Talent"><xsl:value-of select="@Name"/>;<xsl:apply-templates  select="talent:Probe/*[1]" />/<xsl:apply-templates  select="talent:Probe/*[2]" />/<xsl:apply-templates  select="talent:Probe/*[3]" />;<xsl:value-of select="@Komplexität"/></xsl:template>

<xsl:template match="talent:Mut">MU</xsl:template>
<xsl:template match="talent:Glück">GL</xsl:template>
<xsl:template match="talent:Klugheit">KL</xsl:template>
<xsl:template match="talent:Intuition">IN</xsl:template>
<xsl:template match="talent:Gewandtheit">GE</xsl:template>
<xsl:template match="talent:Präzision">PR</xsl:template>
<xsl:template match="talent:Sympathie">SY</xsl:template>
<xsl:template match="talent:Antipathie">AN</xsl:template>
<xsl:template match="talent:Stärke">ST</xsl:template>
<xsl:template match="talent:Konstitution">KO</xsl:template>
<xsl:template match="talent:Fokus">FO</xsl:template>
<xsl:template match="talent:Einfluss">EI</xsl:template>

</xsl:stylesheet>