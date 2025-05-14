import ballerina/http;
import ballerina/log;

listener http:Listener httpDefaultListener = http:getDefaultListener();

type MusicMoodResponse record {|
    *WeatherData;
    string recommendedMusicMode;
|};

type SpotifyResponse record {|
    int weatherCode;
    string condition;
    Playlists playlist;
    string recommendedMusicMode;
|};

service /MusicMood on httpDefaultListener {
    resource function get playlist(string location) returns MusicSuggestion|error {
        do {
            WeatherData weatherAPIResponse = check weatherAPICLient->get(string `/current.json?q=${location}&key=${WEATHER_API_KEY}`);
            int weatherCode = weatherAPIResponse.current.condition.code;
            log:printInfo("Weather code: " + weatherCode.toString());
            string musicMode = getMusicMode(weatherCode);
            log:printInfo("Recommended music mode: " + musicMode);
            log:printInfo("Weather condition: " + weatherAPIResponse.current.condition.text);
            log:printInfo("Location: " + location);
            log:printInfo("Spotify API URL: " + string `/search?q=${musicMode}&type=playlist`);
            SpotifyPlaylist spotifyResponse = check SpotifyClient->get(string `/search?q=${musicMode}&type=playlist`);
            return transform(weatherAPIResponse, spotifyResponse);

        } on fail error err {
            return error("unhandled error", err);
        }
    }
}
