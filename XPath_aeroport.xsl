<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html"/>
    <xsl:template match="/">
    <!--Afficher les dates des vols : (XPath)
    //vol/trajet/aeroport[@type='depart']/date
    //vol/trajet/aeroport[@type='arrivee']/date
    --> 
    
        <h2>Dates des vols :</h2>
        <xsl:for-each select="aeroports/vols/vol/trajet/aeroport[@type='depart']/date"> 
            <p>Date de départ : <xsl:value-of select="."/></p>
        </xsl:for-each>
        <xsl:for-each select="aeroports/vols/vol/trajet/aeroport[@type='arrivee']/date">
            <p>Date d'arrivée : <xsl:value-of select="."/></p>
        </xsl:for-each>

    <!--Afficher la piste du 1er vol de la BDD : (XPath)
   (//vol[1]/trajet/aeroport[@type='depart']/id_piste)[1]
    --> 
    
        <h2>Piste du 1er vol :</h2>
        <p>
            Piste de départ : <xsl:value-of select="(aeroports/vols/vol[1]/trajet/aeroport[@type='depart']/id_piste)"/>
        </p>

    <!--Afficher le nom des pilotes des vols : (XPath)
    //vol[equipage/id_employe = //employes/employe[poste_employe='Pilote']/id_employe]/equipage/id_employe
    --> 
        <h2>Noms des pilotes des vol :</h2>
        <xsl:for-each select="aeroports/vols/vol">
            <p>
                Vol <xsl:value-of select="num_vol"/> : 
                <xsl:for-each select="equipage/id_employe">
                    <xsl:variable name="emp_id" select="."/>
                    <xsl:value-of select="/aeroports/employes/employe[id_employe=$emp_id and poste_employe='Pilote']/nom_employe"/>
                    <xsl:text>, </xsl:text>
                </xsl:for-each>
            </p>
        </xsl:for-each>

    </xsl:template>
</xsl:stylesheet>
