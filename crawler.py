import requests
import bs4

def get_song_links(url):
	resp = requests.get(url)

	ret = []
	soup = bs4.BeautifulSoup(resp.content, features = "html.parser")

	links = soup.find_all("a", attrs = {"class" : "title"})

	for i in links:
		ret.append(i['href'])	
		
	return ret
	
def get_file_name(url):
	return url.split("/")[-1].replace(".html", ".txt")
		
def get_song_lyrics(url):
	lyrics = []
	resp = requests.get(url)
	soup = bs4.BeautifulSoup(resp.content, features = "html.parser")
	
	verses = soup.find_all("p", attrs = {"class" : "verse"})
	
	for i in verses:
		lyrics.append(i.get_text())
	
	return "\n".join(lyrics)	
	
def main():
	links = get_song_links("https://www.metrolyrics.com/grateful-dead-lyrics.html")
	
	for i in links:
		fname = get_file_name(i)
		print(f"{i} -> {fname}")
		f = open(fname, 'w')
		lyrics = get_song_lyrics(i)
		f.write(lyrics)
		f.close()
		
		
		
if __name__ == "__main__":
	main()
	

