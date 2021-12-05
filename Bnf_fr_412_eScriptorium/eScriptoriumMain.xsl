<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"  xmlns:alto="http://www.loc.gov/standards/alto/ns-v4#" xpath-default-namespace="http://www.loc.gov/standards/alto/ns-v4#"
    xmlns="http://www.loc.gov/standards/alto/ns-v4#"
    exclude-result-prefixes="xs alto"
    version="2.0">
   
    
   <xsl:output method="xml" encoding="UTF-8" indent="yes"/> 
      
    
    <xsl:variable name="LabelMain">
        <xsl:value-of select="descendant::Tags/OtherTag[@LABEL='Main' and contains(@DESCRIPTION, 'block')]/@ID"/>
    </xsl:variable>
   
   <!--
    <xsl:template match="alto">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="Description">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="Tags">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="Layout">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="Page">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
   
    <xsl:template match="PrintSpace">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    -->
    
    <xsl:template match="/">
            <xsl:variable name="fileName">
                <xsl:value-of select="tokenize(document-uri(current()), '/')[last()]"/>
            </xsl:variable>
            <xsl:result-document href="{concat('TransformationMain/',$fileName)}">
               <xsl:copy><xsl:apply-templates/></xsl:copy>
            </xsl:result-document>
        
    </xsl:template>
    
    
    <xsl:template match="node() | @*">
               <xsl:copy>
                   <xsl:apply-templates select="@* | node()"/>
               </xsl:copy>      
    </xsl:template>
    
    <xsl:template match="TextBlock">
        <xsl:choose>
            <xsl:when test="@TAGREFS=$LabelMain">
                <xsl:copy-of select="."/>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:template>
    
    
</xsl:stylesheet>