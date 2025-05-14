public function getMusicMode(int weatherCode) returns string {
    match weatherCode {
        1000 => {
            return "Upbeat Pop";
        }
        1003|1006 => {
            return "Indie Rock";
        }
        1009 => {
            return "Alternative Rock";
        }
        1030|1135|1147 => {
            return "Jazz";
        }
        1063|1150|1153|1180|1183|1240 => {
            return "Lo-fi";
        }
        1186|1189|1243 => {
            return "Soul";
        }
        1192|1195|1246 => {
            return "Classical";
        }
        1087|1273|1276 => {
            return "Metal";
        }
        1066|1210|1213|1216|1219|1222|1225|1255|1258 => {
            return "Ambient";
        }
        1114|1117 => {
            return "Progressive Rock";
        }
        1168|1171|1198|1201 => {
            return "Blues";
        }
        1204|1207|1237|1249|1252|1261|1264 => {
            return "Electronic";
        }
        _ => {
            return "Pop";
        }
    }
}