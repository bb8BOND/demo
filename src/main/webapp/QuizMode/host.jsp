<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="host.css">
    <title>Client solve select host</title> 
</head>
<body>
    <h1>
        ルーム作成
    </h1>
    <button id="kari" onclick="getElement()">ボタン</button>
    <select id="dropdown" onclick="displaySelectedItem()">
        <option value="item1">-</option>
        <option value="item2">国語</option>
        <option value="item3">数学</option>
        <option value="item4">英語</option>
    </select>
    <br>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        function displaySelectedItem() {
            var selectElement = document.getElementById("dropdown");
            var selectedOption = selectElement.options[selectElement.selectedIndex].text;
        }

        // WebSocket接続
        var webSocket = new WebSocket("ws://localhost:8025/websocket");
        
        webSocket.onopen = function(event) {
            console.log("WebSocket connection opened.");
            // ここで必要に応じてWebSocketに関する処理を追加
        };

        webSocket.onerror = function(error) {
            console.error("WebSocket error: " + error);
        };

        webSocket.onclose = function(event) {
            console.log("WebSocket connection closed.");
        };

        // データベースからジャンル情報を取得してJSON形式で送信
        $(document).ready(function() {
            $.ajax({
                url: "api.php",
                type: "GET",
                dataType: "json",
                success: function(data) {
                    // 取得したデータを処理する
                    var genre = data;
                    // ここでgenreを使ってHTML要素を操作するなどの処理を行う
                    console.log(genre);
                },
                error: function(xhr, status, error) {
                    console.log("Error: " + error);
                }
            });
        });
    </script>
</body>
</html>
