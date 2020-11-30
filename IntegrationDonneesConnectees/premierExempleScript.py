api = "http://api.geonames.org/searchJSON?q="+lieu+"&maxRows=1&username=projet_TER_reddit"
    # print(api)

    with urllib.request.urlopen(api) as url:
        data = json.loads(url.read().decode())
    # print("Taille:", len(data))
    if data['totalResultsCount'] == 0:
        return -1

    long = data['geonames'][0]['lng']
    lat  = data['geonames'][0]['lat']
    contry = ""
    code = ""
    name = ""
    if "countryName" in data['geonames'][0] and "countryCode" in data['geonames'][0]:
        contry = data['geonames'][0]["countryName"]
        code = data['geonames'][0]["countryCode"]
        name = data['geonames'][0]["name"]
    else:
        contry = data['geonames'][0]["fcodeName"]
        code = data['geonames'][0]["fcode"]
        name = data['geonames'][0]["name"]


    list=[]

    list.append(lieu)
    list.append(long)
    list.append(lat)
    list.append(contry)
    list.append(code)
    list.append(name)
    return list
