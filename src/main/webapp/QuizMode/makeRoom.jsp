<!DOCTYPE html>
<html>
<head>
    <title>WebSocket Button</title>
</head>
<body>
    <h1>WebSocket Button</h1>
    <button id="startButton">Start WebSocket Server</button>

    <script>
        var socket;

        document.getElementById("startButton").onclick = function() {
            // WebSocket サーバーに接続
            socket = new WebSocket("ws://192.168.11.14:8025/websocket");

            // 接続が確立されたときの処理
            socket.onopen = function(event) {
                console.log("WebSocket connection established.");
            };

            // エラーが発生したときの処理
            socket.onerror = function(error) {
                console.error("WebSocket error: ", error);
            };

            // 接続が閉じられたときの処理
            socket.onclose = function(event) {
                console.log("WebSocket connection closed.");
            };
        };
    </script>
</body>
</html>
