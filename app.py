from flask import Flask, render_template, request, redirect, url_for 
from lxml import etree 
import os 
 
app = Flask(__name__) 
 
# Configuration 
app.config['XML_FILE'] = 'ArtistAlgerian.xml' 
app.config['XSL_FILE'] = 'ArtistAlgerian.xsl' 
 
def parse_xml(): 
    try: 
        if not os.path.exists(app.config['XML_FILE']): 
            raise FileNotFoundError(f"Fichier XML {app.config['XML_FILE']} introuvable") 
        return etree.parse(app.config['XML_FILE']) 
    except Exception as e: 
        app.logger.error(f"Erreur lors du parsing XML: {str(e)}") 
        return None 
 
def search_artist(name): 
    try: 
        tree = parse_xml() 
        if tree is None: 
            return None
artists = [] 
for artist in tree.xpath(f"//artist[contains(translate(name, 
'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 
translate('{name}', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 
'abcdefghijklmnopqrstuvwxyz'))]"): 
genre = artist.xpath("./ancestor::genre")[0] 
artist_data = { 
'name': artist.find('name').text, 
'city': artist.find('city').text, 
'site': artist.find('site').text if artist.find('site') is not None else '', 
'production': artist.find('production').text, 
'genre': { 
'name': genre.get('name'), 
'color': genre.get('color'), 
'icon': genre.get('icon'), 
'description': genre.get('description') 
}, 
'albums': [], 
'biography': generate_biography( 
artist.find('name').text, 
artist.find('city').text, 
artist.find('production').text 
) 
} 
for album in artist.xpath('./albums/album'): 
album_data = { 
'name': album.find('name').text, 
'songs': [song.text for song in album.xpath('./songs/song')] 
} 
artist_data['albums'].append(album_data) 
artists.append(artist_data) 
return artists 
except Exception as e: 
app.logger.error(f"Erreur lors de la recherche: {str(e)}") 
return None 
def generate_biography(name, city, style): 
return f"{name} est un artiste renommé originaire de {city}, spécialisé dans 
{style}. Avec une carrière prolifique, il a marqué la scène musicale algérienne par 
son talent unique et son style distinctif." 
@app.route('/') 
def index(): 
try:
if os.path.exists(app.config['XML_FILE']) and 
os.path.exists(app.config['XSL_FILE']): 
xml = etree.parse(app.config['XML_FILE']) 
xslt = etree.parse(app.config['XSL_FILE']) 
transform = etree.XSLT(xslt) 
html_content = str(transform(xml)) 
return render_template('index.html', content=html_content) 
else: 
return render_template('error.html', message="Fichiers XML ou XSL 
manquants"), 404 
except Exception as e: 
app.logger.error(f"Erreur dans la route index: {str(e)}") 
return render_template('error.html', message="Erreur de traitement des 
données"), 500 
@app.route('/search', methods=['GET', 'POST']) 
def search(): 
try: 
if request.method == 'POST': 
query = request.form.get('query', '').strip() 
else: 
query = request.args.get('query', '').strip() 
if not query: 
return redirect(url_for('index')) 
artists = search_artist(query) 
if artists is None: 
return render_template('error.html', message="Erreur lors de la recherche"), 
500 
return render_template('search_results.html',  
artists=artists,  
query=query) 
except Exception as e: 
app.logger.error(f"Erreur dans la route search: {str(e)}") 
return render_template('error.html', message="Erreur lors de la recherche"), 
500 
@app.route('/artist/<name>') 
def artist_detail(name): 
try: 
artists = search_artist(name) 
if not artists: 
return render_template('error.html', message="Artiste non trouvé"), 404 
return render_template('artist_detail.html', artist=artists[0]) 
except Exception as e: 
app.logger.error(f"Erreur dans la route artist_detail: {str(e)}") 
return render_template('error.html', message="Erreur lors de l'affichage de 
l'artiste"), 500 
@app.errorhandler(404) 
def page_not_found(e): 
return render_template('error.html', message="Page non trouvée"), 404 
@app.errorhandler(500) 
def internal_server_error(e): 
return render_template('error.html', message="Erreur interne du serveur"), 500 
if __name__ == '__main__': 
app.run(debug=True) 