<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Biblio</title>
            </head>
            <body>
                <h1>Données de la bibliothèque</h1>

                    <xsl:for-each select="biblio/etudiant">
                        <ul>
                            <li>ID : <xsl:value-of select="@id"/></li>
                            <li>Nom : <xsl:value-of select="@nom"/></li>
                            <li>Prénom : <xsl:value-of select="@prenom"/></li>
                            <li>Age : <xsl:value-of select="@age"/></li>
                            <li>Nombre de livres enpruntés : <xsl:value-of select="count(livre)"/></li>
                            <li>Nombre de livres non rendus : <xsl:value-of select="count(livre[@rendu='non'])"/></li>
                        </ul>
                        <table border="1" width="90%">
                            <tr>
                                <th>ID</th><th>Titre</th><th>Date Enprunt</th><th>Rendu</th>
                            </tr>
                            <xsl:for-each select="livre[@rendu='non']">
                                <tr>
                                    <td><xsl:value-of select="@id"/></td>
                                    <td><xsl:value-of select="@titre"/></td>
                                    <td><xsl:value-of select="@dateEmprunt"/></td>
                                    <td><xsl:value-of select="@rendu"/></td>
                                </tr>
                            </xsl:for-each>
                            <tr>
                                <td colspan="3">NOmbre de livre empruntés</td>
                                <td><xsl:value-of select="count(livre)"/></td>
                            </tr>
                            <tr>
                                <td colspan="3">Nombre de livre non rendus</td>
                                <td><xsl:value-of select="count(livre[@rendu='non'])"/></td>
                            </tr>
                        </table>
                    </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>