var boardWidth = 300;
var boardHeight = 600;
var canvas;
var context;

//cut_kokoro.txtを読み込んで配列なりにする
function getText() {
    


function init() {
    canvas = document.getElementById("kokoro_canvas");
    canvas.width = boardWidth;
    canvas.height = boardHeight;

    context = canvas.getContext("2d");
}
