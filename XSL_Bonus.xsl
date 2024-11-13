<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Informations des Vols</title>
                <style>
                    body { font-family: Arial, sans-serif; }
                    .vol { margin-bottom: 20px; padding: 10px; border: 1px solid #ddd; }
                    h2 { font-size: 1.2em; color: #333; }
                    p { margin: 5px 0; }
                </style>
            </head>
            <body>
                <h1>Informations des Vols</h1>
                <xsl:for-each select="aeroports/vols/vol">
                    <div class="vol">
                        <h2>Vol <xsl:value-of select="num_vol"/></h2>
                        <p><strong>Date de départ :</strong> <xsl:value-of select="trajet/aeroport[@type='depart']/date"/></p>
                        <p><strong>Heure de départ :</strong> <xsl:value-of select="trajet/aeroport[@type='depart']/heure"/></p>
                        <p><strong>Numéro de piste :</strong> <xsl:value-of select="trajet/aeroport[@type='depart']/id_piste"/></p>
                        <p><strong>Type d'avion :</strong> <xsl:value-of select="/aeroports/avions/avion[id_avion=current()/id_avion]/modele"/></p>
                    </div>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
