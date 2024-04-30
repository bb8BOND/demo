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
  <div id="log"></div>
  <input type="text" id="message" placeholder="Type a message...">
  <button onclick="sendMessage()">Send</button>

  <script>
    // WebSocket接続
    var webSocket = new WebSocket("ws://localhost:8025/websocket");
    var log = document.getElementById("log");
    
    webSocket.onopen = function(event) {
      console.log("WebSocket connection opened.");
      log.innerHTML += "<p>WebSocket connection opened.</p>";
    };

    webSocket.onerror = function(error) {
      console.error("WebSocket error: " + error);
      log.innerHTML += "<p>Error: " + error + "</p>";
    };

    webSocket.onclose = function(event) {
      console.log("WebSocket connection closed.");
      log.innerHTML += "<p>WebSocket connection closed.</p>";
    };

    webSocket.onmessage = function(event) {
      log.innerHTML += "<p>" + event.data + "</p>";
    }

    function sendMessage() {
      // 入力されたメッセージを送信
      var messageInput = document.getElementById("message");
      var message = messageInput.value;
      webSocket.send(message);
      messageInput.value = "";
    }
  </script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script>
    function displaySelectedItem() {
      var selectElement = document.getElementById("dropdown");
      var selectedOption = selectElement.options[selectElement.selectedIndex].text;
    }

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
