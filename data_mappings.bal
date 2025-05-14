function transform(WeatherData weatherdata, SpotifyPlaylist spotyFfyData) returns MusicSuggestion => {
    location: weatherdata.location.name,
    weather: weatherdata.current.condition.text,
    musicMode: getMusicMode(weatherdata.current.condition.code),
    playlist: from var itemsItem in spotyFfyData.playlists.items
        select {
            name: itemsItem?.name ?: "",
            url: itemsItem?.external_urls?.spotify ?: "",
            artist: itemsItem?.owner?.display_name ?: ""
        }
};