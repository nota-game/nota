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
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://nota.org/schema/nota.xsd ..\..\..\..\..\static\schema\nota.xsd
                http://nota.org/schema/lebewesen.xsd ..\..\..\..\..\static\schema\lebewesen.xsd
                http://nota.org/schema/kultur.xsd ..\..\..\..\..\static\schema\kultur.xsd
                http://nota.org/schema/profession.xsd ..\..\..\..\..\static\schema\profession.xsd
                http://nota.org/schema/talent.xsd ..\..\..\..\..\static\schema\talent.xsd
                http://nota.org/schema/fertigkeit.xsd ..\..\..\..\..\static\schema\fertigkeit.xsd 
                http://nota.org/schema/besonderheit.xsd ..\..\..\..\..\static\schema\besonderheit.xsd" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="text" indent="no" />
<xsl:template match="nota:Daten">
<xsl:apply-templates select="talent:Talente"/>  
</xsl:template>


<xsl:template match="talent:Talente">
:::talente
<xsl:for-each select="talent:Talent[@Kategorie='Körper']">
<xsl:sort select="normalize-space(./talent:Name/misc:Lokalisirung[@Sparche='de']/text())" />
:::talent
<xsl:apply-templates select="."/>
/::

</xsl:for-each>
/::
</xsl:template>

<xsl:template match="talent:Talent">
## <xsl:value-of select="normalize-space(./talent:Name/misc:Lokalisirung[@Sparche='de']/text())"/> *(<xsl:apply-templates  select="talent:Probe/*[1]" />/<xsl:apply-templates  select="talent:Probe/*[2]" />/<xsl:apply-templates  select="talent:Probe/*[3]" />)*
**Komplexität**: <xsl:value-of select="@Komplexität"/>

:::Description
<xsl:value-of select="normalize-space(talent:Beschreibung)"/>
/::

<xsl:if test="talent:Ableitungen">
Ableitung
<xsl:apply-templates select="talent:Ableitungen"/>
</xsl:if>
</xsl:template>

<xsl:template match="talent:Ableitungen">
<xsl:for-each select="*">
  <xsl:apply-templates select="." />
</xsl:for-each>
</xsl:template>

<xsl:template match="*">
[FEHLER IM XSLT]
</xsl:template>

<xsl:template match="talent:Max" xml:space="preserve">
  + Maximum (<xsl:value-of select="@Anzahl"/>)
<xsl:for-each select="*">
    <xsl:apply-templates select="." />
</xsl:for-each>
</xsl:template>

<xsl:template match="talent:Ableitung">+ <xsl:value-of select="@Id" /> _(<xsl:value-of select="@Anzahl" />)_</xsl:template>

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