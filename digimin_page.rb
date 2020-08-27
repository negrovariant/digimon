
require_relative 'components'

def build_page
    url = 'https://digimon-api.vercel.app/api/digimon'
    index = head() + content() + foot ()

    return index 
end

File.write('./index.html', build_page())

