<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form</title>
    <link rel="stylesheet" href="form.css">
</head>
<body>

    <label for="name"><h4> ユーザ名 :  </h4>  <input type="text" id="name" name="name" required minlength="0" maxlength="20" size="25" /></label>
    
    
    <div class="btn">
        <button>
            <a href="searchMode/search.jsp">閲覧モード</a>
        </button>
        <button>
            <a href="QuizMode/SolveSelection.jsp">回答モード</a>
        </button>
        <button>
            <a href="#">作問モード</a>
        </button>
        <button>
            <a href="#">設定</a>
        </button>
    </div>
</body>
</html>
