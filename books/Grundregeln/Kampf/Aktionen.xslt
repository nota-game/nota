<xsl:stylesheet 
  xml:space="preserve"
  xmlns:nota="http://nota.org/schema/nota" 
  xmlns:lebewesen="http://nota.org/schema/lebewesen" 
  xmlns:kultur="http://nota.org/schema/kultur" 
  xmlns:profession="http://nota.org/schema/profession" 
  xmlns:talent="http://nota.org/schema/talent" 
  xmlns:fertigkeit="http://nota.org/schema/fertigkeit" 
  xmlns:besonderheit="http://nota.org/schema/besonderheit" 
  xmlns:aktionen="http://nota.org/schema/kampf/aktionen" 
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://nota.org/schema/nota ..\..\..\..\..\static\schema\nota.xsd                http://nota.org/schema/lebewesen ..\..\..\..\..\static\schema\lebewesen.xsd                http://nota.org/schema/kultur ..\..\..\..\..\static\schema\kultur.xsd                http://nota.org/schema/profession ..\..\..\..\..\static\schema\profession.xsd                http://nota.org/schema/talent ..\..\..\..\..\static\schema\talent.xsd                http://nota.org/schema/fertigkeit ..\..\..\..\..\static\schema\fertigkeit.xsd                 http://nota.org/schema/besonderheit ..\..\..\..\..\static\schema\besonderheit.xsd                 http://nota.org/schema/kampf/aktionen ..\..\..\..\..\static\schema\kampf\aktionen.xsd" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="no" />
  <xsl:template match="nota:Daten">
      <xsl:apply-templates select="aktionen:Taktiken"/>
  </xsl:template>
  <xsl:template match="aktionen:Taktiken">

# Aktionen

<xsl:for-each select="aktionen:Taktik">
<xsl:sort select="@Id" />
:::Action

<xsl:apply-templates select="."/>
/::

</xsl:for-each>
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

<xsl:value-of select="aktionen:Beschreibung"/>

        <xsl:if test="./aktionen:Bedingung">
### Bedingung
<xsl:value-of select="./aktionen:Bedingung"/>
        </xsl:if>
        <xsl:if test="./aktionen:SofortigerEffekt">
### Augenblicklicher Effekt
<xsl:value-of select="./aktionen:SofortigerEffekt"/>
        </xsl:if>
        <xsl:if test="./aktionen:GarantierterEffekt">
### Garantierter Effekt
<xsl:value-of select="./aktionen:GarantierterEffekt"/>
        </xsl:if>
        <xsl:if test="./aktionen:Erfolg">
### Erfolg
<xsl:value-of select="./aktionen:Erfolg"/>
        </xsl:if>
        <xsl:if test="./aktionen:Misserfolg">
### Misserfolg
<xsl:value-of select="./aktionen:Misserfolg"/>
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

<xsl:template match="aktionen:VariableModValueType"><xsl:value-of select="@Value"/></xsl:template>

  <xsl:template match="aktionen:AddModValueType"><xsl:apply-templates select="./*[1]"/> <xsl:for-each select="./*[position()>1]"> &#65291; <xsl:apply-templates select="."/></xsl:for-each></xsl:template>

  <xsl:template match="aktionen:SubstractModValueType"><xsl:apply-templates select="./*[1]"/> <xsl:for-each select="./*[position()>1]"> &#x2212; <xsl:apply-templates select="."/></xsl:for-each></xsl:template>

  <xsl:template match="aktionen:MultiplyModValueType"><xsl:apply-templates select="./*[1]"/><xsl:for-each select="./*[position()>1]"> &#8226; <xsl:apply-templates select="."/></xsl:for-each></xsl:template>

  <xsl:template match="*">  [[FEHLER IM XSLT]] (<xsl:value-of select="local-name()"/>)
  </xsl:template>
</xsl:stylesheet>