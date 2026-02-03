<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
version="1.0"> 
<xsl:output method="html" encoding="UTF-8" indent="yes"/> 
<xsl:template match="/"> 
<html lang="fr"> 
<head> 
<meta charset="UTF-8"/> 
<meta name="viewport" content="width=device-width, initial-scale=1.0"/> 
<title>Patrimoine Musical Algérien</title> 
<link 
href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&
amp;family=Poppins:wght@300;400;600&amp;family=Amiri:wght@400;700" 
rel="stylesheet"/> 
<link rel="stylesheet" 
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
/> 
<style> 
:root { --gold: #D4AF37; --dark-blue: #0A2463; --light-blue: #3E92CC; --white: #FFF; 
 --light-gray: #F5F5F5; 
                        --dark: #1E1E24; 
                    } 
                     
                    * { 
                        margin: 0; 
                        padding: 0; 
                        box-sizing: border-box; 
                    } 
                     
                    body { 
                        font-family: 'Poppins', sans-serif; 
                        background-color: var(--light-gray); 
                        color: var(--dark); 
                        line-height: 1.7; 
                    } 
                     
                    .container { 
                        max-width: 1400px; 
                        margin: 0 auto; 
                        padding: 2rem; 
                    } 
                     
                    header { 
                        background: linear-gradient(135deg, var(--dark-blue) 0%, #1E3A8A 
100%); 
                        color: var(--white); 
                        text-align: center; 
                        padding: 4rem 0; 
                        margin-bottom: 3rem; 
                        position: relative; 
                        overflow: hidden; 
                        box-shadow: 0 5px 15px rgba(0,0,0,0.1); 
                    } 
                     
                    header::before { 
                        content: ""; 
                        position: absolute; 
                        top: 0; 
                        left: 0; 
                        width: 100%; 
                        height: 5px; 
                        background: linear-gradient(90deg,  
                            #8E44AD 0%,  
                            #E74C3C 20%,  
                            #27AE60 40%,  
                            #F39C12 60%,  
 #3498DB 80%,  
                            #16A085 100%); 
                    } 
                     
                    h1 { 
                        font-family: 'Amiri', serif; 
                        font-size: 3.5rem; 
                        margin-bottom: 0.5rem; 
                        color: var(--gold); 
                        position: relative; 
                        display: inline-block; 
                        text-shadow: 1px 1px 3px rgba(0,0,0,0.3); 
                    } 
                     
                    .subtitle { 
                        font-size: 1.3rem; 
                        opacity: 0.9; 
                        max-width: 800px; 
                        margin: 0 auto 1.5rem; 
                        font-family: 'Amiri', serif; 
                    } 
                     
                    .genre-tabs { 
                        display: flex; 
                        justify-content: center; 
                        flex-wrap: wrap; 
                        gap: 1rem; 
                        margin-bottom: 3rem; 
                    } 
                     
                    .genre-tab { 
                        padding: 0.8rem 1.5rem; 
                        border-radius: 30px; 
                        font-weight: 600; 
                        cursor: pointer; 
                        transition: all 0.3s ease; 
                        color: white; 
                        box-shadow: 0 3px 10px rgba(0,0,0,0.1); 
                    } 
                     
                    .genre-tab:hover { 
                        transform: translateY(-3px); 
                        box-shadow: 0 5px 15px rgba(0,0,0,0.2); 
                    } 
                     
                    .genre-section { 
                        margin-bottom: 4rem;
   padding: 2rem; 
                        background: white; 
                        border-radius: 10px; 
                        box-shadow: 0 5px 15px rgba(0,0,0,0.05); 
                    } 
                     
                    .genre-title { 
                        font-family: 'Amiri', serif; 
                        font-size: 2.5rem; 
                        margin-bottom: 1.5rem; 
                        padding-bottom: 0.5rem; 
                        border-bottom: 3px solid; 
                        display: inline-block; 
                    } 
                     
                    .genre-description { 
                        max-width: 800px; 
                        margin-bottom: 2rem; 
                        font-size: 1.1rem; 
                        line-height: 1.8; 
                        color: #555; 
                    } 
                     
                    .artists-container { 
                        display: grid; 
                        grid-template-columns: repeat(auto-fill, minmax(350px, 1fr)); 
                        gap: 2.5rem; 
                        margin-top: 2rem; 
                    } 
                     
                    .artist-card { 
                        background: var(--white); 
                        border-radius: 12px; 
                        overflow: hidden; 
                        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08); 
                        transition: all 0.3s ease; 
                        position: relative; 
                        border-top: 5px solid; 
                    } 
                     
                    .artist-card:hover { 
                        transform: translateY(-8px); 
                        box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15); 
                    } 
                     
                    .artist-header { 
                        padding: 1.8rem;
 position: relative; 
                        color: white; 
                    } 
                     
                    .artist-header::after { 
                        content: ""; 
                        position: absolute; 
                        bottom: 0; 
                        left: 0; 
                        width: 100%; 
                        height: 4px; 
                        background: rgba(255,255,255,0.3); 
                    } 
                     
                    .artist-name { 
                        font-family: 'Playfair Display', serif; 
                        font-size: 1.8rem; 
                        margin-bottom: 0.5rem; 
                        display: flex; 
                        align-items: center; 
                    } 
                     
                    .artist-name i { 
                        margin-right: 10px; 
                        font-size: 1.5rem; 
                    } 
                     
                    .artist-city { 
                        display: inline-block; 
                        background: rgba(255, 255, 255, 0.2); 
                        padding: 0.4rem 1rem; 
                        border-radius: 20px; 
                        font-size: 0.9rem; 
                        margin-top: 0.5rem; 
                    } 
                     
                    .artist-body { 
                        padding: 2rem; 
                    } 
                     
                    .info-item { 
                        margin-bottom: 1.2rem; 
                    } 
                     
                    .info-label { 
                        font-weight: 600; 
                        display: block; 
   margin-bottom: 0.3rem; 
                        font-size: 0.9rem; 
                        text-transform: uppercase; 
                        letter-spacing: 0.5px; 
                    } 
                     
                    .info-value { 
                        color: #555; 
                        font-size: 1.1rem; 
                    } 
                     
                    .info-value.site { 
                        color: var(--dark-blue); 
                        text-decoration: none; 
                        font-weight: 500; 
                        transition: color 0.3s ease; 
                        word-break: break-all; 
                    } 
                     
                    .info-value.site:hover { 
                        color: var(--light-blue); 
                        text-decoration: underline; 
                    } 
                     
                    .album-section { 
                        margin-top: 2rem; 
                        padding-top: 1.5rem; 
                        border-top: 1px solid #eee; 
                    } 
                     
                    .album-title { 
                        font-family: 'Playfair Display', serif; 
                        font-size: 1.4rem; 
                        margin-bottom: 1.2rem; 
                        display: flex; 
                        align-items: center; 
                    } 
                     
                    .album-title::before { 
                        content: "
🎵
"; 
                        margin-right: 0.8rem; 
                        font-size: 1.2rem; 
                    } 
                     
                    .song-list { 
                        list-style: none; 
                    } 
 .song-item { 
                        padding: 0.7rem 0; 
                        border-bottom: 1px dashed #ddd; 
                        display: flex; 
                        align-items: center; 
                        transition: all 0.2s ease; 
                    } 
                     
                    .song-item:hover { 
                        background-color: rgba(0,0,0,0.02); 
                        padding-left: 5px; 
                    } 
                     
                    .song-item::before { 
                        content: "♫"; 
                        margin-right: 0.8rem; 
                        font-size: 0.9rem; 
                    } 
                     
                    .song-item:last-child { 
                        border-bottom: none; 
                    } 
                     
                    footer { 
                        text-align: center; 
                        margin-top: 4rem; 
                        padding: 2rem; 
                        color: #666; 
                        font-size: 0.9rem; 
                        border-top: 1px solid #eee; 
                        background: white; 
                    } 
                     
                    @media (max-width: 768px) { 
                        .artists-container { 
                            grid-template-columns: 1fr; 
                        } 
                         
                        h1 { 
                            font-size: 2.4rem; 
                        } 
                    } 
                </style> 
            </head> 
            <body> 
                <header>
   <div class="container"> 
                        <h1>Patrimoine Musical Algérien</h1> 
                        <p class="subtitle">Une immersion dans la richesse des rythmes et 
mélodies d'Algérie</p> 
                         
                        <div class="genre-tabs"> 
                            <xsl:for-each select="artists/genre"> 
                                <a href="#{translate(@name, ' ', '')}" class="genre-tab" 
style="background-color: {@color}"> 
                                    <xsl:value-of select="@name"/> 
                                </a> 
                            </xsl:for-each> 
                        </div> 
                    </div> 
                </header> 
                 
                <div class="container"> 
                    <xsl:apply-templates select="artists/genre"/> 
                     
                    <footer> 
                        <div class="container"> 
                            <p>© Culture Algérienne | Tous droits réservés</p> 
                        </div> 
                    </footer> 
                </div> 
            </body> 
        </html> 
    </xsl:template> 
     
    <xsl:template match="genre"> 
        <div class="genre-section" id="{translate(@name, ' ', '')}"> 
            <h2 class="genre-title" style="color: {@color}; border-color: {@color}"> 
                <i class="fas fa-{@icon}"></i> <xsl:value-of select="@name"/> 
            </h2> 
            <p class="genre-description"><xsl:value-of select="@description"/></p> 
             
            <div class="artists-container"> 
                <xsl:apply-templates select="artist"> 
                    <xsl:with-param name="genre-color" select="@color"/> 
                </xsl:apply-templates> 
            </div> 
        </div> 
    </xsl:template> 
     
    <xsl:template match="artist"> 
        <xsl:param name="genre-color"/>
  <div class="artist-card" style="border-color: {$genre-color}"> 
            <div class="artist-header" style="background-color: {$genre-color}"> 
                <h2 class="artist-name"><i class="fas fa-user"></i> <xsl:value-of 
select="name"/></h2> 
                <span class="artist-city"><xsl:value-of select="city"/></span> 
            </div> 
             
            <div class="artist-body"> 
                <div class="info-item"> 
                    <span class="info-label" style="color: {$genre-color}">Site Web</span> 
                    <a href="{site}" class="info-value site" target="_blank"><xsl:value-of 
select="site"/></a> 
                </div> 
                 
                <div class="info-item"> 
                    <span class="info-label" style="color: {$genre-color}">Style</span> 
                    <span class="info-value"><xsl:value-of select="production"/></span> 
                </div> 
                 
                <xsl:for-each select="albums/album"> 
                    <div class="album-section"> 
                        <h3 class="album-title" style="color: {$genre-color}"><xsl:value-of 
select="name"/></h3> 
                        <ul class="song-list"> 
                            <xsl:for-each select="songs/song"> 
                                <li class="song-item" style="color: {$genre-color}"><xsl:value-of 
select="."/></li> 
                            </xsl:for-each> 
                        </ul> 
                    </div> 
                </xsl:for-each> 
            </div> 
        </div> 
    </xsl:template> 
</xsl:stylesheet>
