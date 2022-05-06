<xsl:stylesheet 
  xml:space="preserve"
  xmlns:nota="http://nota.org/schema/nota.xsd" 
  xmlns:lebewesen="http://nota.org/schema/lebewesen.xsd" 
  xmlns:kultur="http://nota.org/schema/kultur.xsd" 
  xmlns:profession="http://nota.org/schema/profession.xsd" 
  xmlns:talent="http://nota.org/schema/talent.xsd" 
  xmlns:fertigkeit="http://nota.org/schema/fertigkeit.xsd" 
  xmlns:besonderheit="http://nota.org/schema/besonderheit.xsd" 
  xmlns:aktionen="http://nota.org/schema/kampf/aktionen" 
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://nota.org/schema/nota.xsd ..\..\..\..\..\static\schema\nota.xsd                http://nota.org/schema/lebewesen.xsd ..\..\..\..\..\static\schema\lebewesen.xsd                http://nota.org/schema/kultur.xsd ..\..\..\..\..\static\schema\kultur.xsd                http://nota.org/schema/profession.xsd ..\..\..\..\..\static\schema\profession.xsd                http://nota.org/schema/talent.xsd ..\..\..\..\..\static\schema\talent.xsd                http://nota.org/schema/fertigkeit.xsd ..\..\..\..\..\static\schema\fertigkeit.xsd                 http://nota.org/schema/besonderheit.xsd ..\..\..\..\..\static\schema\besonderheit.xsd                 http://nota.org/schema/kampf/aktionen ..\..\..\..\..\static\schema\kampf\aktionen.xsd" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="no" />
  <xsl:template match="nota:Daten">
      <xsl:apply-templates select="aktionen:Taktiken"/>
  </xsl:template>
  <xsl:template match="aktionen:Taktiken">
# Taktiken
:::taktiken

<xsl:for-each select="aktionen:Taktik">
<xsl:sort select="@Id" />
:::taktik

<xsl:apply-templates select="."/>
/::

</xsl:for-each>
/::
</xsl:template>

  <xsl:template match="aktionen:Taktik" >


  <!-- 

             <element name="Beschreibung" type="string" />
              <element name="Bedingung" type="string" minOccurs="0" />
              <element name="SofortigerEffekt" type="string" minOccurs="0" />
              <element name="GarantierterEffekt" type="string" minOccurs="0" />
              <element name="Erfolg" type="string" minOccurs="0" />
              <element name="Misserfolg" type="string" minOccurs="0" />
     

  -->

## <xsl:value-of select="@Id"/>  

<xsl:call-template name="replace">
  <xsl:with-param name="text" select="./aktionen:Beschreibung"/>
</xsl:call-template>

        <xsl:if test="./aktionen:Bedingung">
### Bedingung
<xsl:call-template name="replace">
  <xsl:with-param name="text" select="./aktionen:Bedingung"/>
</xsl:call-template>
        </xsl:if>
        <xsl:if test="./aktionen:SofortigerEffekt">
### Augenblicklicher Effekt
<xsl:call-template name="replace">
  <xsl:with-param name="text" select="./aktionen:SofortigerEffekt"/>
</xsl:call-template>
        </xsl:if>
        <xsl:if test="./aktionen:GarantierterEffekt">
### Garantierter Effekt
<xsl:call-template name="replace">
  <xsl:with-param name="text" select="./aktionen:GarantierterEffekt"/>
</xsl:call-template>
        </xsl:if>
        <xsl:if test="./aktionen:Erfolg">
### Erfolg

<xsl:call-template name="replace">
  <xsl:with-param name="text" select="./aktionen:Erfolg"/>
</xsl:call-template>

<!-- <xsl:value-of select="replace(./aktionen:Erfolg, '$x', '')"/> -->
        </xsl:if>
        <xsl:if test="./aktionen:Misserfolg">
### Misserfolg
<xsl:call-template name="replace">
  <xsl:with-param name="text" select="./aktionen:Misserfolg"/>
</xsl:call-template>
        </xsl:if>

**Ausdauerkosten** _<xsl:value-of select="@Kosten"/>_ 

**Belastuntg** _<xsl:value-of select="@Belastung"/>_

**Typ** _<xsl:choose>
              <xsl:when test="@Typ='Offensiv'">Offensiv</xsl:when>
              <xsl:when test="@Typ='Defensiv'">Defensiv</xsl:when>
              <xsl:when test="@Typ='Ausgeglieschen'">Offensiv und Passiv</xsl:when>
              <xsl:when test="@Typ='Frei'">Frei</xsl:when>
              <xsl:when test="@Typ='Neutral'">Neutral</xsl:when>
              <xsl:when test="@Typ='Unterstützend'">Unterstützend</xsl:when>
              <xsl:otherwise>[Ungültiger wert] (<xsl:value-of select="@Typ"/>)</xsl:otherwise>
            </xsl:choose>_
          <xsl:if test="./aktionen:Mod">
**Modifikation**

<xsl:if test="./aktionen:Mod/@ModifierType = 'Bonus'">
:::bonus
&#65291;<xsl:apply-templates select="./aktionen:Mod/*"/>
/::
</xsl:if>
<xsl:if test="./aktionen:Mod/@ModifierType = 'Malus'">
:::malus
&#x2212;<xsl:apply-templates select="./aktionen:Mod/*"/>
/::
</xsl:if>
</xsl:if>

<xsl:if test="./aktionen:Eigenschaften">
**Schlüsselwörter**: <xsl:for-each select="./aktionen:Eigenschaften/*" >
- <xsl:value-of select="@Id"/>
</xsl:for-each>
</xsl:if>
</xsl:template>

<xsl:template match="aktionen:ConcreteModValueType"><xsl:value-of select="@Value"/><xsl:if test="@Type='Percent'">%</xsl:if></xsl:template>

<xsl:template match="aktionen:VariableModValueType"><xsl:call-template name="replace"><xsl:with-param name="text" select="@Value"/></xsl:call-template></xsl:template>

  <xsl:template match="aktionen:AddModValueType"><xsl:apply-templates select="./*[1]"/> <xsl:for-each select="./*[position()>1]"> &#65291; <xsl:apply-templates select="."/></xsl:for-each></xsl:template>

  <xsl:template match="aktionen:SubstractModValueType"><xsl:apply-templates select="./*[1]"/> <xsl:for-each select="./*[position()>1]"> &#x2212; <xsl:apply-templates select="."/></xsl:for-each></xsl:template>

  <xsl:template match="aktionen:MultiplyModValueType"><xsl:apply-templates select="./*[1]"/><xsl:for-each select="./*[position()>1]"> &#8226; <xsl:apply-templates select="."/></xsl:for-each></xsl:template>

<!-- -->

<xsl:template name="replace"><xsl:param name="text"/><xsl:call-template name="replace-string"><xsl:with-param name="text" select="$text"/><xsl:with-param name="replace" select="'$x'" /><xsl:with-param name="with" select="'&#119987;'"/></xsl:call-template></xsl:template>


<xsl:template name="replace-string" ><xsl:param name="text"/><xsl:param name="replace"/><xsl:param name="with"/><xsl:choose><xsl:when test="contains($text,$replace)"><xsl:value-of select="substring-before($text,$replace)"/><xsl:value-of select="$with"/><xsl:call-template name="replace-string"><xsl:with-param name="text"
select="substring-after($text,$replace)"/><xsl:with-param name="replace" select="$replace"/><xsl:with-param name="with" select="$with"/></xsl:call-template></xsl:when><xsl:otherwise><xsl:value-of select="$text"/></xsl:otherwise></xsl:choose></xsl:template>

  <xsl:template match="*">  [[FEHLER IM XSLT]] (<xsl:value-of select="local-name()"/>)
  </xsl:template>
</xsl:stylesheet>