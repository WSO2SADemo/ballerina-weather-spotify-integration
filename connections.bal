import ballerina/http;

final http:Client weatherAPICLient = check new ("https://api.weatherapi.com/v1");
final http:Client SpotifyClient = check new ("https://api.spotify.com/v1", auth = {
    tokenUrl: "https://accounts.spotify.com/api/token",
    clientId: SPOTIFY_CLIENT_ID,
    clientSecret: SPOTIFY_CLIENT_SECRET
});
