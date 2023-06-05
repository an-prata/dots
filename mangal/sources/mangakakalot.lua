------------------------------------
-- @name    mangakakalot 
-- @url     https://mangakakalot.com
-- @author  evan 
-- @license MIT
------------------------------------


---@alias manga { name: string, url: string, author: string|nil, genres: string|nil, summary: string|nil }
---@alias chapter { name: string, url: string, volume: string|nil, manga_summary: string|nil, manga_author: string|nil, manga_genres: string|nil }
---@alias page { url: string, index: number }


----- IMPORTS -----
Html = require("html")
Http = require("http")
--- END IMPORTS ---




----- VARIABLES -----
Client = Http.client()
Base = "https://mangakakalot.com"
--- END VARIABLES ---



----- MAIN -----

--- Searches for manga with given query.
-- @param query string Query to search for
-- @return manga[] Table of mangas
function SearchManga(query)
	query = query:gsub(" ", "_")
	print(Base .. "/search/story/" .. query)
	local request = Http.request(Base .. "/search/story/" .. query)
	local result = Client:do_request(request)

	local doc = Html.parse(result.body)
	local mangas = {}

	doc:find(".story_name"):each(function (i, s)
		local manga = { name = s:text(), url = s:href() }
		mangas[i + 1] = manga
	end)

	return mangas
end


--- Gets the list of all manga chapters.
-- @param mangaURL string URL of the manga
-- @return chapter[] Table of chapters
function MangaChapters(mangaURL)
	local chapters = {}

	return chapters
end


--- Gets the list of all pages of a chapter.
-- @param chapterURL string URL of the chapter
-- @return page[]
function ChapterPages(chapterURL)
	local pages = {}
	return pages
end

--- END MAIN ---




----- HELPERS -----
--- END HELPERS ---

-- ex: ts=4 sw=4 et filetype=lua
