<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Registration Form</title>
<%--    <link rel="stylesheet"--%>
<%--          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"--%>
<%--          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"--%>
<%--          crossorigin="anonymous">--%>
    <style type="text/css">
        body {
            font-family:'Lato',sans-serif;
        }

        #quiz {
            background:#d2def2;
            padding:10px 20px 10px 20px;
            width:50%;
            border-radius:20px;
            margin: auto;
        }

        h1 {
            text-align:center;
        }

        #input {
            margin-border:20px;
            display:block ;
        }

        #textbox {
            height:22px;
            width:120px;
            font-size:16px;
            border-radius:5px;
            border:none;
            padding-left:5px;
        }

        #button {
            background:green;
            border:none;
            border-radius:5px;
            padding:10px;
            color:white;
            font-size:16px;
            transition-duration:.5s;
            margin-top:15px;
        }

        #button.hover {
            background:white;
            border:1px solid green;
            color:black;
            cursor:pointer;
        }

        #after_submit {
            visibility:hidden;
            background:#0000ff;
            padding:10px 20px 10px 20px;
            width:40%;
            border-radius:20px;
            float:left;
            margin-left:20px;
            font-size:30px;
        }

        #pictures {
            width:100%;
            height:100%;
        }
    </style>
</head>
<body>
<h1>"The best HTML Quiz"</h1>

<form id="quiz" name="quiz">

    <p>What is the missing word from Britney spears song "everytime"?</p>
    <p>"...without my wings i feel so small, i guess i need you _______ "</p>
    <input type="radio" id="mc1a" name="question3" value="here">here<br>
    <input type="radio" id="mc1b" name="question3" value="there">there<br>
    <input type="radio" id="mc1c" name="question3" value="baby">baby<br>
    <input type="radio" id="mc1d" name="question3" value="now">now<br>

    <p>What is the missing word from 50-Cent song ?</p>
    <p>" I don't know what you heard about me, but a _______ can't get a dollar out of me"</p>
    <input type="radio" id="mc2a" name="question3" value="girl">girl<br>
    <input type="radio" id="mc2b" name="question3" value="sugar">sugar<br>
    <input type="radio" id="mc2c" name="question3" value="bitch">bitch<br>
    <input type="radio" id="mc2d" name="question3" value="baby">baby<br>

    <p>What is the missing word from Eminem song?</p>
    <p>"don't let 'em say you ain't _______"</p>
    <input id="textbox" type="text" name="question3">

    <p>What is the missing word from Beyonce song?</p>
    <p>"...I think I could understand, how it feels to _______ a girl"</p>
    <input type="radio" id="mc4a" name="question3" value="love">love<br>
    <input type="radio" id="mc4b" name="question3" value="be">be<br>
    <input type="radio" id="mc4c" name="question3" value="find">find<br>
    <input type="radio" id="mc4d" name="question3" value="hate">hate<br>

    <p>Which one of the  following singers uses the most love words?</p>
    <input type="radio" id="mc5a" name="question3" value="Eminem">Eminem<br>
    <input type="radio" id="mc5b" name="question3" value="50-Cent">50-Cent<br>
    <input type="radio" id="mc5c" name="question3" value="Britney Spears">Britney Spears<br>
    <input type="radio" id="mc5d" name="question3" value="Coldplay">Coldplay<br>
    <input type="radio" id="mc5e" name="question3" value="Celine Dion">Celine Dion<br>
    <input type="radio" id="mc5f" name="question3" value="Beyonce">Beyonce<br>

    <input id="button" type="button" value="I'm finished!" onclick="check();">

</form>

<div id="after_submit"></div>

<p id="messages"></p>
<p id="number_correct"></p>
<img id="pictures">

<script type="text/javascript">
    function check(){

        var question1=document.quiz.question1.value;
        var question2=document.quiz.question2.value;
        var question3=document.quiz.question3.value;
        var correct=0;

        if (question1=="Markup"){
            correct++;
        }

        if (question2=="true"){
            correct++;
        }

        if (question3=="img"){
            correct++;
        }

        var messages=["Great job!","That's just okay!","You really need to do better"];
        var pictures=["https://media1.giphy.com/media/11sBLVxNs7v6WA/giphy.gif","https://media1.giphy.com/media/Nm9hS20D4swVO/200w.gif","https://media.giphy.com/media/xUA7aRaGvA53VSlxUk/giphy.gif"];

        var range;

        if(correct<1){
            range=2;
        }

        if(correct>0&&correct<3){
            range=1;
        }

        if(correct>2){
            range=0;
        }

        document.getElementById("after_submit").style.visibility="visible";
        document.getElementById("messages").innerHTML=messages[range];
        document.getElementById("number_correct").innerHTML="&rarr;you got "+correct+" correct.";
        document.getElementById("pictures").src=pictures[range];
    }
</script>
</body>
</html>