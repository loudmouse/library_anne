# Meet LibraryAnne

LibraryAnne tells me what book to read next.
1. She accesses my reading list from the Goodreads API
2. I tell her my preferred library branch location which she pulls in from the Chicago Open Data Portal
3. She then tells me if my book is available at my chosen library branch

## Important

If you wish to use this app once you've cloned the repository, you'll need to add your Goodreads API key and username as ENV variables which are then utilized in `shelves.rb`

### The Tech

LibraryAnne is a command line tool built with Ruby, the Goodreads API, and Mechanize.

#### Work in progress
If I can find some time I'd like to make this into a web app so others can use it. I've got a number of ideas but will need to find some time.
