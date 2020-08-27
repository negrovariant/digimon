require_relative 'request'


def head
    "<!doctype html>
    <html lang='en'
    <head>
        <title>Title</title>
        <!-- Required meta tags -->
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no'>
    
        <!-- Bootstrap CSS -->
        <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>\
        </head>
        <body>"


end 

def content(api)

    data = get_data(api)

if data.nil?
        cards = 'h3 class="text-center">No hay digimons Disponibles</h3>'
else
    cards = '<div class="row">'

    data.each do|digimon|
    cards+= "
    <div class='col-md-4'>
        <div class='card' style='width: 18rem;'>
            <img src='#{digimon['img']}' class='card-img-top' alt='#{digimon['name']}'>
            <div class='card-body'>
            <h5 class='card-title'>'#{digimon['name']}</h5>
            <p class='card-text'>'#{digimon['level']}</p>
            </div>
        </div>
    </div>
"
end


    cards += '</div>'
end
end






def foot
    
    foot= "<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->\
    <script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>\
    <script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js' integrity='sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1' crossorigin='anonymous'></script>\
    <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js' integrity='sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM' crossorigin='anonymous'></script>
    </body>
    </html>"
    
    return foot
end

index = head() +content('https://digimon-api.vercel.app/api/digimon') +foot()


File.write('./index.html', index)


